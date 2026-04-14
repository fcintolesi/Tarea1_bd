-- =============================================
-- TABLA: TORNEO
-- =============================================
CREATE TABLE TORNEO (
    id_torneo    SERIAL PRIMARY KEY,
    nombre       VARCHAR(100) NOT NULL,
    videojuego   VARCHAR(100) NOT NULL,
    fecha_inicio DATE         NOT NULL,
    fecha_fin    DATE         NOT NULL,
    prize_pool   INT NOT NULL DEFAULT 0 CHECK (prize_pool >= 0), -- en clp (no nesecario que sea decimal)
    max_equipos  INT          NOT NULL CHECK (max_equipos > 0),
    CONSTRAINT chk_fechas CHECK (fecha_fin >= fecha_inicio)
);


-- =============================================
-- TABLA: SPONSOR
-- =============================================
CREATE TABLE SPONSOR (
    nombre    VARCHAR(100) PRIMARY KEY,
    industria VARCHAR(100) NOT NULL
);


-- =============================================
-- TABLA: EQUIPO
-- (capitan se agrega después como FK circular)
-- =============================================
CREATE TABLE EQUIPO (
    nombre          VARCHAR(100) PRIMARY KEY,
    fecha_creacion  DATE         NOT NULL,
    capitan         VARCHAR(100)  -- FK se agrega después
);


-- =============================================
-- TABLA: JUGADOR
-- =============================================
CREATE TABLE JUGADOR (
    gamertag         VARCHAR(50)  PRIMARY KEY,
    nombre_real      VARCHAR(100) NOT NULL,
    email            VARCHAR(150) NOT NULL UNIQUE,
    fecha_nacimiento DATE         NOT NULL,
    pais             VARCHAR(60)  NOT NULL,
    nombre_equipo    VARCHAR(100) NOT NULL,
    CONSTRAINT fk_jugador_equipo FOREIGN KEY (nombre_equipo)
        REFERENCES EQUIPO(nombre) 
);


-- =============================================
-- FK CIRCULAR: EQUIPO.capitan -> JUGADOR.gamertag
-- =============================================
ALTER TABLE EQUIPO
    ADD CONSTRAINT fk_equipo_capitan FOREIGN KEY (capitan)
        REFERENCES JUGADOR(gamertag)
;

-- =============================================
-- TABLA: INSCRIPCION
-- =============================================
CREATE TABLE INSCRIPCION (
    nombre_equipo VARCHAR(100) NOT NULL,
    id_torneo     INT          NOT NULL,
    PRIMARY KEY (nombre_equipo, id_torneo),
    CONSTRAINT fk_inscripcion_equipo  FOREIGN KEY (nombre_equipo)
        REFERENCES EQUIPO(nombre),
    CONSTRAINT fk_inscripcion_torneo  FOREIGN KEY (id_torneo)
        REFERENCES TORNEO(id_torneo)
);


-- =============================================
-- TABLA: PARTIDA
-- =============================================
CREATE TABLE PARTIDA (
    id_partida SERIAL      PRIMARY KEY,
    id_torneo  INT          NOT NULL,
    equipo_A   VARCHAR(100) NOT NULL,
    equipo_B   VARCHAR(100) NOT NULL,
    fecha_hora TIMESTAMP    NOT NULL,
    puntaje_A  INT          NOT NULL DEFAULT 0 CHECK (puntaje_A >= 0),
    puntaje_B  INT          NOT NULL DEFAULT 0 CHECK (puntaje_B >= 0),
    fase       VARCHAR(50)  NOT NULL,
    CONSTRAINT fk_partida_torneo   FOREIGN KEY (id_torneo)
        REFERENCES TORNEO(id_torneo),
    CONSTRAINT fk_partida_equipoA  FOREIGN KEY (equipo_A)
        REFERENCES EQUIPO(nombre),
    CONSTRAINT fk_partida_equipoB  FOREIGN KEY (equipo_B)
        REFERENCES EQUIPO(nombre),
    CONSTRAINT chk_equipos_distintos CHECK (equipo_A <> equipo_B)
);


-- =============================================
-- TABLA: ESTADISTICAS
-- =============================================
CREATE TABLE ESTADISTICAS (
    id_partida INT         NOT NULL,
    gamertag   VARCHAR(50) NOT NULL,
    KOs        INT         NOT NULL DEFAULT 0 CHECK (KOs >= 0),
    muertes    INT         NOT NULL DEFAULT 0 CHECK (muertes >= 0),
    assists    INT         NOT NULL DEFAULT 0 CHECK (assists >= 0),
    PRIMARY KEY (id_partida, gamertag),
    CONSTRAINT fk_est_partida  FOREIGN KEY (id_partida)
        REFERENCES PARTIDA(id_partida),
    CONSTRAINT fk_est_jugador  FOREIGN KEY (gamertag)
        REFERENCES JUGADOR(gamertag)
);


-- =============================================
-- TABLA: AUSPICIO
-- =============================================
CREATE TABLE AUSPICIO (
    nombre_sponsor VARCHAR(100)  NOT NULL,
    id_torneo      INT           NOT NULL,
    monto          NUMERIC(12,2) NOT NULL DEFAULT 0 CHECK (monto >= 0),
    PRIMARY KEY (nombre_sponsor, id_torneo),
    CONSTRAINT fk_auspicio_sponsor FOREIGN KEY (nombre_sponsor)
        REFERENCES SPONSOR(nombre),
    CONSTRAINT fk_auspicio_torneo  FOREIGN KEY (id_torneo)
        REFERENCES TORNEO(id_torneo)
);