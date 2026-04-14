from flask import Flask, jsonify, render_template, request
import os
import psycopg2

app = Flask(__name__)


def get_connection():
    return psycopg2.connect(
        host=os.getenv('DB_HOST', 'localhost'),
        port=os.getenv('DB_PORT', '5432'),
        dbname=os.getenv('DB_NAME', 'Tarea 1'),
        user=os.getenv('DB_USER', 'postgres'),
        password=os.getenv('DB_PASSWORD', 'huete123'),
    )


def fetch_all_dict(cur):
    cols = [desc[0] for desc in cur.description]
    return [dict(zip(cols, row)) for row in cur.fetchall()]


@app.route('/')
def index():
    return render_template('main.html')


@app.route('/api/torneos')
def api_torneos():
    conn = get_connection()
    cur = conn.cursor()
    try:
        cur.execute(
            '''
            SELECT id_torneo, nombre, videojuego, fecha_inicio, fecha_fin, prize_pool, max_equipos
            FROM TORNEO
            ORDER BY id_torneo
            '''
        )
        return jsonify(fetch_all_dict(cur))
    finally:
        cur.close()
        conn.close()


@app.route('/api/torneos/<int:id_torneo>')
def api_torneo_detalle(id_torneo: int):
    conn = get_connection()
    cur = conn.cursor()
    try:
        cur.execute(
            '''
            SELECT id_torneo, nombre, videojuego, fecha_inicio, fecha_fin, prize_pool, max_equipos
            FROM TORNEO
            WHERE id_torneo = %s
            ''',
            (id_torneo,),
        )
        row = cur.fetchone()
        if not row:
            return jsonify({'error': 'Torneo no encontrado'}), 404
        torneo = dict(zip([d[0] for d in cur.description], row))

        cur.execute(
            '''
            WITH stats AS (
                SELECT
                    e.nombre AS equipo,
                    COUNT(*) AS jugados,
                    SUM(CASE
                        WHEN (p.equipo_A = e.nombre AND p.puntaje_A > p.puntaje_B)
                          OR (p.equipo_B = e.nombre AND p.puntaje_B > p.puntaje_A)
                        THEN 1 ELSE 0 END) AS ganados,
                    SUM(CASE WHEN p.puntaje_A = p.puntaje_B THEN 1 ELSE 0 END) AS empatados,
                    SUM(CASE
                        WHEN (p.equipo_A = e.nombre AND p.puntaje_A < p.puntaje_B)
                          OR (p.equipo_B = e.nombre AND p.puntaje_B < p.puntaje_A)
                        THEN 1 ELSE 0 END) AS perdidos,
                    SUM(CASE
                        WHEN (p.equipo_A = e.nombre AND p.puntaje_A > p.puntaje_B)
                          OR (p.equipo_B = e.nombre AND p.puntaje_B > p.puntaje_A)
                        THEN 3
                        WHEN p.puntaje_A = p.puntaje_B THEN 1
                        ELSE 0 END) AS puntos
                FROM INSCRIPCION i
                JOIN EQUIPO e ON e.nombre = i.nombre_equipo
                JOIN PARTIDA p
                  ON p.id_torneo = i.id_torneo
                 AND (p.equipo_A = e.nombre OR p.equipo_B = e.nombre)
                WHERE i.id_torneo = %s
                  AND p.fase = 'Grupos'
                GROUP BY e.nombre
            )
            SELECT *
            FROM stats
            ORDER BY puntos DESC, ganados DESC, equipo ASC
            ''',
            (id_torneo,),
        )
        posiciones = fetch_all_dict(cur)

        cur.execute(
            '''
            SELECT id_partida, fecha_hora, equipo_A, puntaje_A, puntaje_B, equipo_B, fase
            FROM PARTIDA
            WHERE id_torneo = %s
            ORDER BY fecha_hora, id_partida
            ''',
            (id_torneo,),
        )
        partidas = fetch_all_dict(cur)

        cur.execute(
            '''
            SELECT e.nombre, e.capitan, e.fecha_creacion
            FROM INSCRIPCION i
            JOIN EQUIPO e ON e.nombre = i.nombre_equipo
            WHERE i.id_torneo = %s
            ORDER BY e.nombre
            ''',
            (id_torneo,),
        )
        equipos = fetch_all_dict(cur)

        cur.execute(
            '''
            SELECT s.nombre, s.industria, a.monto
            FROM AUSPICIO a
            JOIN SPONSOR s ON s.nombre = a.nombre_sponsor
            WHERE a.id_torneo = %s
            ORDER BY s.nombre
            ''',
            (id_torneo,),
        )
        sponsors = fetch_all_dict(cur)

        return jsonify({
            'torneo': torneo,
            'posiciones': posiciones,
            'partidas': partidas,
            'equipos': equipos,
            'sponsors': sponsors,
        })
    finally:
        cur.close()
        conn.close()


@app.route('/api/estadisticas/ranking')
def api_ranking():
    torneo_id = request.args.get('torneo_id', type=int)
    if torneo_id is None:
        return jsonify({'error': 'Falta torneo_id'}), 400

    conn = get_connection()
    cur = conn.cursor()
    try:
        cur.execute(
            '''
            SELECT
                j.gamertag,
                j.nombre_equipo AS equipo,
                SUM(e.KOs) AS kos,
                SUM(e.muertes) AS muertes,
                SUM(e.assists) AS assists,
                COUNT(DISTINCT e.id_partida) AS partidas,
                ROUND(SUM(e.KOs)::numeric / NULLIF(SUM(e.muertes), 0), 2) AS ratio
            FROM ESTADISTICAS e
            JOIN JUGADOR j ON j.gamertag = e.gamertag
            JOIN PARTIDA p ON p.id_partida = e.id_partida
            WHERE p.id_torneo = %s
            GROUP BY j.gamertag, j.nombre_equipo
            HAVING COUNT(DISTINCT e.id_partida) >= 2
            ORDER BY ratio DESC NULLS LAST, kos DESC, assists DESC, j.gamertag ASC
            ''',
            (torneo_id,),
        )
        return jsonify(fetch_all_dict(cur))
    finally:
        cur.close()
        conn.close()


@app.route('/api/estadisticas/equipo')
def api_equipo_fases():
    torneo_id = request.args.get('torneo_id', type=int)
    equipo = request.args.get('equipo', type=str)
    if torneo_id is None or not equipo:
        return jsonify({'error': 'Faltan parámetros'}), 400

    conn = get_connection()
    cur = conn.cursor()
    try:
        cur.execute(
            '''
            WITH base AS (
                SELECT
                    CASE WHEN p.fase = 'Grupos' THEN 'Grupos' ELSE 'Eliminatorias' END AS etapa,
                    AVG(e.KOs::numeric) AS promedio_kos,
                    AVG(e.muertes::numeric) AS promedio_muertes,
                    AVG(e.assists::numeric) AS promedio_assists
                FROM ESTADISTICAS e
                JOIN JUGADOR j ON j.gamertag = e.gamertag
                JOIN PARTIDA p ON p.id_partida = e.id_partida
                WHERE p.id_torneo = %s
                  AND j.nombre_equipo = %s
                  AND (p.equipo_A = %s OR p.equipo_B = %s)
                GROUP BY CASE WHEN p.fase = 'Grupos' THEN 'Grupos' ELSE 'Eliminatorias' END
            )
            SELECT etapa,
                   ROUND(promedio_kos, 2) AS promedio_kos,
                   ROUND(promedio_muertes, 2) AS promedio_muertes,
                   ROUND(promedio_assists, 2) AS promedio_assists
            FROM base
            ORDER BY CASE WHEN etapa = 'Grupos' THEN 1 ELSE 2 END
            ''',
            (torneo_id, equipo, equipo, equipo),
        )
        return jsonify(fetch_all_dict(cur))
    finally:
        cur.close()
        conn.close()


@app.route('/api/busqueda')
def api_busqueda():
    q = request.args.get('q', '', type=str).strip()
    if not q:
        return jsonify({'jugadores': [], 'equipos': []})

    pattern = f'%{q}%'
    conn = get_connection()
    cur = conn.cursor()
    try:
        cur.execute(
            '''
            SELECT gamertag, nombre_real, pais, nombre_equipo
            FROM JUGADOR
            WHERE gamertag ILIKE %s OR pais ILIKE %s
            ORDER BY gamertag
            ''',
            (pattern, pattern),
        )
        jugadores = fetch_all_dict(cur)

        cur.execute(
            '''
            SELECT nombre, fecha_creacion, capitan
            FROM EQUIPO
            WHERE nombre ILIKE %s
            ORDER BY nombre
            ''',
            (pattern,),
        )
        equipos = fetch_all_dict(cur)

        return jsonify({'jugadores': jugadores, 'equipos': equipos})
    finally:
        cur.close()
        conn.close()


@app.route('/api/sponsors')
def api_sponsors_videojuego():
    videojuego = request.args.get('videojuego', '', type=str).strip()
    if not videojuego:
        return jsonify([])

    conn = get_connection()
    cur = conn.cursor()
    try:
        cur.execute(
            '''
            SELECT s.nombre, s.industria, SUM(a.monto) AS monto_total
            FROM SPONSOR s
            JOIN AUSPICIO a ON a.nombre_sponsor = s.nombre
            JOIN TORNEO t ON t.id_torneo = a.id_torneo
            WHERE t.videojuego = %s
            GROUP BY s.nombre, s.industria
            HAVING COUNT(DISTINCT t.id_torneo) = (
                SELECT COUNT(*) FROM TORNEO WHERE videojuego = %s
            )
            ORDER BY monto_total DESC, s.nombre ASC
            ''',
            (videojuego, videojuego),
        )
        return jsonify(fetch_all_dict(cur))
    finally:
        cur.close()
        conn.close()


@app.route('/api/inscripcion', methods=['POST'])
def api_inscripcion():
    data = request.get_json(silent=True) or {}
    nombre_equipo = data.get('nombre_equipo')
    id_torneo = data.get('id_torneo')

    if not nombre_equipo or id_torneo is None:
        return jsonify({'error': 'Faltan datos'}), 400

    conn = get_connection()
    cur = conn.cursor()
    try:
        cur.execute('SELECT max_equipos FROM TORNEO WHERE id_torneo = %s', (id_torneo,))
        torneo = cur.fetchone()
        if not torneo:
            return jsonify({'error': 'Torneo no encontrado'}), 404

        max_equipos = torneo[0]

        cur.execute('SELECT COUNT(*) FROM INSCRIPCION WHERE id_torneo = %s', (id_torneo,))
        inscritos = cur.fetchone()[0]
        if inscritos >= max_equipos:
            return jsonify({'error': 'El torneo ya alcanzó su número máximo de equipos'}), 400

        cur.execute(
            'SELECT 1 FROM INSCRIPCION WHERE id_torneo = %s AND nombre_equipo = %s',
            (id_torneo, nombre_equipo),
        )
        if cur.fetchone():
            return jsonify({'error': 'Ese equipo ya está inscrito en este torneo'}), 400

        cur.execute('SELECT 1 FROM EQUIPO WHERE nombre = %s', (nombre_equipo,))
        if not cur.fetchone():
            return jsonify({'error': 'Equipo no encontrado'}), 404

        cur.execute(
            'INSERT INTO INSCRIPCION (nombre_equipo, id_torneo) VALUES (%s, %s)',
            (nombre_equipo, id_torneo),
        )
        conn.commit()
        return jsonify({'ok': True, 'message': 'Inscripción realizada correctamente'})
    except Exception as exc:
        conn.rollback()
        return jsonify({'error': str(exc)}), 500
    finally:
        cur.close()
        conn.close()


@app.route('/api/videojuegos')
def api_videojuegos():
    conn = get_connection()
    cur = conn.cursor()
    try:
        cur.execute('SELECT DISTINCT videojuego FROM TORNEO ORDER BY videojuego')
        return jsonify([row[0] for row in cur.fetchall()])
    finally:
        cur.close()
        conn.close()


@app.route('/api/equipos')
def api_equipos():
    conn = get_connection()
    cur = conn.cursor()
    try:
        cur.execute('SELECT nombre FROM EQUIPO ORDER BY nombre')
        return jsonify([row[0] for row in cur.fetchall()])
    finally:
        cur.close()
        conn.close()


if __name__ == '__main__':
    app.run(debug=True)
