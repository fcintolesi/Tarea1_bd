from flask import Flask
import psycopg2

app = Flask(__name__)

# Conexión a la BD
def get_connection():
    return psycopg2.connect(
        host="localhost",
        database="bd_tarea1",
        user="postgres",
        password="12345678",  # cambia esto
        port="5432"
    )

@app.route("/")
def inicio():
    conn = get_connection()
    cur = conn.cursor()
    cur.execute("SELECT nombre FROM TORNEO")
    torneos = cur.fetchall()
    cur.close()
    conn.close()
    return str(torneos)

if __name__ == "__main__":
    app.run(debug=True)