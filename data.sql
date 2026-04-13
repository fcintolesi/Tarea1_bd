-- =============================================
-- SPONSORS (5)
-- =============================================
INSERT INTO SPONSOR (nombre, industria) VALUES
('Adidas',        'Indumentaria Deportiva'),
('Gatorade',      'Bebidas Deportivas'),
('Nike',          'Indumentaria Deportiva'),
('Mastercard',    'Servicios Financieros'),
('Fly Emirates',  'Aerolíneas');


-- =============================================
-- TORNEOS (3)
-- =============================================
INSERT INTO TORNEO (nombre, videojuego, fecha_inicio, fecha_fin, prize_pool, max_equipos) VALUES
('Copa Sudamericana Elite 2026', 'Fútbol 11', '2026-05-01', '2026-05-15', 500000.00, 8),
('Torneo Apertura Regional',     'Fútbol 11', '2026-06-01', '2026-06-10', 200000.00, 4),
('Copa Rápida Verano',           'Fútbol 11', '2026-07-01', '2026-07-05', 100000.00, 4);


-- =============================================
-- EQUIPOS (10)
-- =============================================
INSERT INTO EQUIPO (nombre, fecha_creacion, capitan) VALUES
('Colo-Colo',          '1925-04-19', NULL),
('Universidad de Chile','1927-07-07', NULL),
('Universidad Católica','1937-04-21', NULL),
('Boca Juniors',        '1905-04-03', NULL),
('River Plate',         '1901-05-25', NULL),
('Nacional',            '1899-05-14', NULL),
('Peñarol',             '1891-09-28', NULL),
('Flamengo',            '1895-11-17', NULL),
('Palmeiras',           '1914-08-26', NULL),
('Alianza Lima',        '1901-02-15', NULL);


-- =============================================
-- JUGADORES (5 por equipo = 50 jugadores)
-- =============================================


-- Colo-Colo
INSERT INTO JUGADOR (gamertag, nombre_real, email, fecha_nacimiento, pais, nombre_equipo) VALUES
('ElCacique',    'Arturo Vidal',      'avidal@colocolo.cl',    '1987-05-22', 'Chile',    'Colo-Colo'),
('CachorroCC',   'Gabriel Suazo',     'gsuazo@colocolo.cl',    '1997-06-08', 'Chile',    'Colo-Colo'),
('IndioCC',      'Esteban Pavez',     'epavez@colocolo.cl',    '1991-11-03', 'Chile',    'Colo-Colo'),
('GarraBlanca',  'Alexander Oroz',    'aoroz@colocolo.cl',     '2001-03-14', 'Chile',    'Colo-Colo'),
('PopoCC',       'Carlos Palacios',   'cpalacios@colocolo.cl', '2001-08-05', 'Chile',    'Colo-Colo');


-- Universidad de Chile
INSERT INTO JUGADOR (gamertag, nombre_real, email, fecha_nacimiento, pais, nombre_equipo) VALUES
('ElBulla',      'Marcelo Díaz',      'mdiaz@udechile.cl',     '1986-12-30', 'Chile',    'Universidad de Chile'),
('AzulRojo',     'Rodrigo Echeverría','recheverria@udechile.cl','1997-09-15', 'Chile',    'Universidad de Chile'),
('RompeRedes',   'Lucas Assadi',      'lassadi@udechile.cl',   '2003-04-22', 'Chile',    'Universidad de Chile'),
('ElTren',       'Darío Osorio',      'dosorio@udechile.cl',   '2003-07-11', 'Chile',    'Universidad de Chile'),
('ElPibe',       'Marcelo Morales',   'mmorales@udechile.cl',  '1996-02-18', 'Chile',    'Universidad de Chile');


-- Universidad Católica
INSERT INTO JUGADOR (gamertag, nombre_real, email, fecha_nacimiento, pais, nombre_equipo) VALUES
('ElCruzado',    'Ariel Holan',       'aholan@ucatolica.cl',   '1969-11-10', 'Argentina','Universidad Católica'),
('CruzadoK',     'Fernando Zampedri', 'fzampedri@ucatolica.cl','1990-09-28', 'Argentina','Universidad Católica'),
('SantoUC',      'Edson Puch',        'epuch@ucatolica.cl',    '1985-10-01', 'Chile',    'Universidad Católica'),
('CruzUC',       'Felipe Gutiérrez',  'fgutierrez@ucatolica.cl','1990-10-08','Chile',    'Universidad Católica'),
('TablitaUC',    'Nicolás Castillo',  'ncastillo@ucatolica.cl','1995-07-14', 'Chile',    'Universidad Católica');


-- Boca Juniors
INSERT INTO JUGADOR (gamertag, nombre_real, email, fecha_nacimiento, pais, nombre_equipo) VALUES
('XeneixeK',     'Edinson Cavani',    'ecavani@bocajr.com.ar', '1987-02-14', 'Uruguay',  'Boca Juniors'),
('BocaBoca',     'Cristian Medina',   'cmedina@bocajr.com.ar', '2001-11-22', 'Argentina','Boca Juniors'),
('LaRibera',     'Luis Advíncula',    'ladvincula@bocajr.com.ar','1990-03-02','Perú',    'Boca Juniors'),
('BomboneraN',   'Nicolás Figal',     'nfigal@bocajr.com.ar',  '1995-06-18', 'Argentina','Boca Juniors'),
('Xeneize10',    'Kevin Zenón',       'kzenon@bocajr.com.ar',  '2001-01-03', 'Argentina','Boca Juniors');


-- River Plate
INSERT INTO JUGADOR (gamertag, nombre_real, email, fecha_nacimiento, pais, nombre_equipo) VALUES
('ElMillonario', 'Marcelo Gallardo',  'mgallardo@river.com.ar','1976-01-18', 'Argentina','River Plate'),
('MilanesaR',    'Pablo Solari',      'psolari@river.com.ar',  '2001-02-16', 'Argentina','River Plate'),
('BandaRoja',    'Nicolás De La Cruz','ndelacruz@river.com.ar','1997-06-01', 'Uruguay',  'River Plate'),
('Monumental7',  'Facundo Colidio',   'fcolidio@river.com.ar', '1999-01-06', 'Argentina','River Plate'),
('RiverK10',     'Rodrigo Aliendro',  'raliendro@river.com.ar','1992-07-22', 'Argentina','River Plate');


-- Nacional
INSERT INTO JUGADOR (gamertag, nombre_real, email, fecha_nacimiento, pais, nombre_equipo) VALUES
('ElBolso',      'Gonzalo Bergessio', 'gbergessio@nacional.uy','1984-07-04', 'Argentina','Nacional'),
('TricolorN',    'Brian Ocampo',      'bocampo@nacional.uy',   '2000-12-11', 'Uruguay',  'Nacional'),
('ParkePared',   'Mathías Olivera',   'molivera@nacional.uy',  '1997-10-31', 'Uruguay',  'Nacional'),
('NacionalK',    'Sebastián Coates',  'scoates@nacional.uy',   '1991-10-07', 'Uruguay',  'Nacional'),
('BolsoGol',     'Gastón Pereiro',    'gpereiro@nacional.uy',  '1995-06-11', 'Uruguay',  'Nacional');


-- Peñarol
INSERT INTO JUGADOR (gamertag, nombre_real, email, fecha_nacimiento, pais, nombre_equipo) VALUES
('Carbonero',    'Facundo Torres',    'ftorres@penarol.uy',    '2000-09-17', 'Uruguay',  'Peñarol'),
('MirassolP',    'Agustín Canobbio',  'acanobbio@penarol.uy',  '1998-08-05', 'Uruguay',  'Peñarol'),
('AuregroP',     'Rodrigo Bentancur', 'rbentancur@penarol.uy', '1997-06-25', 'Uruguay',  'Peñarol'),
('CampeonP',     'Diego Forlán',      'dforlan@penarol.uy',    '1979-05-19', 'Uruguay',  'Peñarol'),
('CarbonK',      'Maximiliano Olivera','molivera2@penarol.uy', '1996-11-22', 'Uruguay',  'Peñarol');


-- Flamengo
INSERT INTO JUGADOR (gamertag, nombre_real, email, fecha_nacimiento, pais, nombre_equipo) VALUES
('MengaoK',      'Gabriel Barbosa',   'gabigol@flamengo.com.br','1996-08-30','Brasil',   'Flamengo'),
('RubroNegroF',  'Arrascaeta',        'arrascaeta@flamengo.com.br','1994-12-01','Uruguay','Flamengo'),
('FlaFlu',       'Éverton Ribeiro',   'eribeiro@flamengo.com.br','1989-09-01','Brasil',  'Flamengo'),
('NacaoF',       'Rodrygo Goes',      'rgoes@flamengo.com.br',  '2001-01-09','Brasil',   'Flamengo'),
('GaviaoF',      'Léo Pereira',       'lpereira@flamengo.com.br','1996-05-26','Brasil',  'Flamengo');


-- Palmeiras
INSERT INTO JUGADOR (gamertag, nombre_real, email, fecha_nacimiento, pais, nombre_equipo) VALUES
('Verdao',       'Endrick Felipe',    'endrick@palmeiras.com.br','2006-07-21','Brasil',  'Palmeiras'),
('PorcoPalm',    'Gustavo Scarpa',    'gscarpa@palmeiras.com.br','1994-08-09','Brasil',  'Palmeiras'),
('SociedadePalm','Dudu',             'dudu@palmeiras.com.br',   '1992-04-14','Brasil',  'Palmeiras'),
('AcademiaP',    'Raphael Veiga',     'rveiga@palmeiras.com.br', '1995-09-05','Brasil',  'Palmeiras'),
('VerdaoK',      'Zé Rafael',         'zerafael@palmeiras.com.br','1993-03-27','Brasil', 'Palmeiras');


-- Alianza Lima
INSERT INTO JUGADOR (gamertag, nombre_real, email, fecha_nacimiento, pais, nombre_equipo) VALUES
('GringuillO',   'Paolo Guerrero',    'pguerrero@alianza.pe',  '1984-01-01', 'Perú',     'Alianza Lima'),
('BlanquiazulA', 'Christian Cueva',   'ccueva@alianza.pe',     '1991-11-23', 'Perú',     'Alianza Lima'),
('ElPatron',     'Jefferson Farfán',  'jfarfan@alianza.pe',    '1984-10-26', 'Perú',     'Alianza Lima'),
('AlianzaK',     'Hernán Barcos',     'hbarcos@alianza.pe',    '1984-06-16', 'Argentina','Alianza Lima'),
('IntimosA',     'Anderson Santamaría','asantamaria@alianza.pe','1992-09-10','Perú',     'Alianza Lima');


-- =============================================
-- ASIGNAR CAPITANES
-- =============================================
UPDATE EQUIPO SET capitan = 'ElCacique'    WHERE nombre = 'Colo-Colo';
UPDATE EQUIPO SET capitan = 'ElBulla'      WHERE nombre = 'Universidad de Chile';
UPDATE EQUIPO SET capitan = 'ElCruzado'    WHERE nombre = 'Universidad Católica';
UPDATE EQUIPO SET capitan = 'XeneixeK'     WHERE nombre = 'Boca Juniors';
UPDATE EQUIPO SET capitan = 'ElMillonario' WHERE nombre = 'River Plate';
UPDATE EQUIPO SET capitan = 'ElBolso'      WHERE nombre = 'Nacional';
UPDATE EQUIPO SET capitan = 'Carbonero'    WHERE nombre = 'Peñarol';
UPDATE EQUIPO SET capitan = 'MengaoK'      WHERE nombre = 'Flamengo';
UPDATE EQUIPO SET capitan = 'Verdao'       WHERE nombre = 'Palmeiras';
UPDATE EQUIPO SET capitan = 'GringuillO'   WHERE nombre = 'Alianza Lima';


-- =============================================
-- INSCRIPCIONES
-- Torneo 1: 8 equipos (CUPO COMPLETO)
-- Torneo 2: 4 equipos
-- Torneo 3: 4 equipos
-- =============================================
INSERT INTO INSCRIPCION (nombre_equipo, id_torneo) VALUES
('Colo-Colo',           1),
('Universidad de Chile', 1),
('Universidad Católica', 1),
('Boca Juniors',         1),
('River Plate',          1),
('Nacional',             1),
('Peñarol',              1),
('Flamengo',             1);


INSERT INTO INSCRIPCION (nombre_equipo, id_torneo) VALUES
('Palmeiras',            2),
('Alianza Lima',         2),
('Colo-Colo',            2),
('Universidad Católica', 2);


INSERT INTO INSCRIPCION (nombre_equipo, id_torneo) VALUES
('Universidad de Chile', 3),
('Boca Juniors',         3),
('River Plate',          3),
('Peñarol',              3);


-- =============================================
-- AUSPICIOS
-- =============================================
INSERT INTO AUSPICIO (nombre_sponsor, id_torneo, monto) VALUES
('Adidas',       1, 150000.00),
('Fly Emirates', 1, 120000.00),
('Mastercard',   1,  80000.00),
('Nike',         2,  50000.00),
('Gatorade',     3,  30000.00),
('Adidas',       2,  40000.00),
('Nike',         3,  25000.00);


-- =============================================
-- PARTIDAS — TORNEO 1 (Copa Sudamericana Elite)
-- Grupo A: Colo-Colo, U. de Chile, U. Católica, Boca Juniors
-- Grupo B: River Plate, Nacional, Peñarol, Flamengo
-- =============================================


-- GRUPO A
INSERT INTO PARTIDA (id_torneo, equipo_A, equipo_B, fecha_hora, puntaje_A, puntaje_B, fase) VALUES
(1,'Colo-Colo',           'Universidad de Chile', '2026-05-01 15:00:00', 2, 1, 'Grupos'),
(1,'Universidad Católica','Boca Juniors',          '2026-05-01 18:00:00', 0, 1, 'Grupos'),
(1,'Colo-Colo',           'Universidad Católica',  '2026-05-03 15:00:00', 3, 1, 'Grupos'),
(1,'Universidad de Chile','Boca Juniors',           '2026-05-03 18:00:00', 1, 1, 'Grupos'),
(1,'Colo-Colo',           'Boca Juniors',           '2026-05-05 15:00:00', 2, 0, 'Grupos'),
(1,'Universidad de Chile','Universidad Católica',   '2026-05-05 18:00:00', 2, 0, 'Grupos');


-- GRUPO B
INSERT INTO PARTIDA (id_torneo, equipo_A, equipo_B, fecha_hora, puntaje_A, puntaje_B, fase) VALUES
(1,'River Plate','Nacional',  '2026-05-02 15:00:00', 3, 0, 'Grupos'),
(1,'Peñarol',    'Flamengo',  '2026-05-02 18:00:00', 1, 2, 'Grupos'),
(1,'River Plate','Peñarol',   '2026-05-04 15:00:00', 2, 0, 'Grupos'),
(1,'Nacional',   'Flamengo',  '2026-05-04 18:00:00', 1, 3, 'Grupos'),
(1,'River Plate','Flamengo',  '2026-05-06 15:00:00', 1, 2, 'Grupos'),
(1,'Nacional',   'Peñarol',   '2026-05-06 18:00:00', 0, 1, 'Grupos');


-- Clasificados:
-- Grupo A: 1° Colo-Colo (3W), 2° Universidad de Chile (1W1E)
-- Grupo B: 1° Flamengo (2W), 2° River Plate (2W, peor GD)


-- SEMIFINALES
INSERT INTO PARTIDA (id_torneo, equipo_A, equipo_B, fecha_hora, puntaje_A, puntaje_B, fase) VALUES
(1,'Colo-Colo',           'River Plate',          '2026-05-12 15:00:00', 2, 1, 'Semifinal'),
(1,'Flamengo',            'Universidad de Chile',  '2026-05-12 18:00:00', 1, 2, 'Semifinal');


-- FINAL
INSERT INTO PARTIDA (id_torneo, equipo_A, equipo_B, fecha_hora, puntaje_A, puntaje_B, fase) VALUES
(1,'Colo-Colo','Universidad de Chile','2026-05-15 19:00:00', 3, 2, 'Final');


-- =============================================
-- PARTIDAS — TORNEO 2 (Apertura Regional)
-- =============================================
INSERT INTO PARTIDA (id_torneo, equipo_A, equipo_B, fecha_hora, puntaje_A, puntaje_B, fase) VALUES
(2,'Palmeiras',           'Alianza Lima',          '2026-06-01 15:00:00', 3, 0, 'Grupos'),
(2,'Colo-Colo',           'Universidad Católica',  '2026-06-01 18:00:00', 1, 2, 'Grupos'),
(2,'Palmeiras',           'Colo-Colo',             '2026-06-03 15:00:00', 2, 1, 'Grupos'),
(2,'Alianza Lima',        'Universidad Católica',  '2026-06-03 18:00:00', 0, 2, 'Grupos'),
(2,'Palmeiras',           'Universidad Católica',  '2026-06-05 15:00:00', 1, 2, 'Grupos'),
(2,'Alianza Lima',        'Colo-Colo',             '2026-06-05 18:00:00', 1, 3, 'Grupos');


-- Final T2: Universidad Católica vs Colo-Colo
INSERT INTO PARTIDA (id_torneo, equipo_A, equipo_B, fecha_hora, puntaje_A, puntaje_B, fase) VALUES
(2,'Universidad Católica','Colo-Colo','2026-06-10 19:00:00', 2, 1, 'Final');


-- =============================================
-- PARTIDAS — TORNEO 3 (Copa Rápida Verano)
-- =============================================
INSERT INTO PARTIDA (id_torneo, equipo_A, equipo_B, fecha_hora, puntaje_A, puntaje_B, fase) VALUES
(3,'Universidad de Chile','Boca Juniors', '2026-07-01 15:00:00', 2, 3, 'Grupos'),
(3,'River Plate',         'Peñarol',      '2026-07-01 18:00:00', 4, 1, 'Grupos'),
(3,'Universidad de Chile','River Plate',  '2026-07-02 15:00:00', 0, 2, 'Grupos'),
(3,'Boca Juniors',        'Peñarol',      '2026-07-02 18:00:00', 2, 1, 'Grupos'),
(3,'Universidad de Chile','Peñarol',      '2026-07-03 15:00:00', 1, 1, 'Grupos'),
(3,'Boca Juniors',        'River Plate',  '2026-07-03 18:00:00', 0, 2, 'Grupos');


-- Final T3: River Plate vs Boca Juniors
INSERT INTO PARTIDA (id_torneo, equipo_A, equipo_B, fecha_hora, puntaje_A, puntaje_B, fase) VALUES
(3,'River Plate','Boca Juniors','2026-07-05 19:00:00', 3, 1, 'Final');


-- =============================================
-- ESTADÍSTICAS (KOs = goles, muertes = faltas, assists = asistencias)
-- =============================================


-- Partida 1: Colo-Colo 2-1 U de Chile
INSERT INTO ESTADISTICAS VALUES
(1,'ElCacique',   1,2,2), (1,'CachorroCC',  1,1,1), (1,'PopoCC',      0,3,1),
(1,'ElBulla',     1,2,0), (1,'RompeRedes',  0,3,1), (1,'ElTren',      0,4,0);


-- Partida 2: U Católica 0-1 Boca Juniors
INSERT INTO ESTADISTICAS VALUES
(2,'ElCruzado',   0,3,0), (2,'CruzadoK',    0,4,1), (2,'TablitaUC',   0,3,0),
(2,'XeneixeK',    1,1,1), (2,'BocaBoca',    0,2,1), (2,'Xeneize10',   0,3,1);


-- Partida 3: Colo-Colo 3-1 U Católica
INSERT INTO ESTADISTICAS VALUES
(3,'ElCacique',   1,1,2), (3,'CachorroCC',  1,2,1), (3,'PopoCC',      1,2,0),
(3,'CruzadoK',    1,3,0), (3,'SantoUC',     0,4,0), (3,'CruzUC',      0,3,0);


-- Partida 4: U de Chile 1-1 Boca Juniors
INSERT INTO ESTADISTICAS VALUES
(4,'ElBulla',     0,2,1), (4,'AzulRojo',    1,3,0), (4,'ElTren',      0,4,0),
(4,'XeneixeK',    1,2,1), (4,'LaRibera',    0,3,0), (4,'BomboneraN',  0,2,0);


-- Partida 5: Colo-Colo 2-0 Boca Juniors
INSERT INTO ESTADISTICAS VALUES
(5,'ElCacique',   1,1,1), (5,'IndioCC',     1,2,1), (5,'GarraBlanca', 0,2,1),
(5,'XeneixeK',    0,3,0), (5,'BocaBoca',    0,4,0), (5,'Xeneize10',   0,3,0);


-- Partida 6: U de Chile 2-0 U Católica
INSERT INTO ESTADISTICAS VALUES
(6,'ElBulla',     1,1,1), (6,'RompeRedes',  1,2,1), (6,'ElPibe',      0,2,1),
(6,'CruzadoK',    0,4,0), (6,'TablitaUC',   0,3,0), (6,'CruzUC',      0,4,0);


-- Partida 7: River Plate 3-0 Nacional
INSERT INTO ESTADISTICAS VALUES
(7,'ElMillonario',1,1,2), (7,'MilanesaR',   2,1,1), (7,'BandaRoja',   0,2,2),
(7,'ElBolso',     0,4,0), (7,'TricolorN',   0,3,0), (7,'ParkePared',  0,4,0);


-- Partida 8: Peñarol 1-2 Flamengo
INSERT INTO ESTADISTICAS VALUES
(8,'Carbonero',   1,3,0), (8,'MirassolP',   0,4,0), (8,'AuregroP',    0,3,0),
(8,'MengaoK',     1,2,1), (8,'RubroNegroF', 1,2,1), (8,'FlaFlu',      0,3,1);


-- Partida 9: River Plate 2-0 Peñarol
INSERT INTO ESTADISTICAS VALUES
(9,'ElMillonario',1,1,1), (9,'Monumental7', 1,2,1), (9,'RiverK10',    0,2,1),
(9,'Carbonero',   0,4,0), (9,'AuregroP',    0,3,0), (9,'CarbonK',     0,4,0);


-- Partida 10: Nacional 1-3 Flamengo
INSERT INTO ESTADISTICAS VALUES
(10,'ElBolso',     1,3,0),(10,'BolsoGol',    0,4,0),(10,'NacionalK',   0,3,0),
(10,'MengaoK',     2,1,1),(10,'RubroNegroF', 1,2,1),(10,'NacaoF',      0,3,1);


-- Partida 11: River Plate 1-2 Flamengo
INSERT INTO ESTADISTICAS VALUES
(11,'MilanesaR',  1,3,0),(11,'BandaRoja',   0,4,1),(11,'Monumental7', 0,3,0),
(11,'MengaoK',    1,2,1),(11,'RubroNegroF', 1,2,1),(11,'GaviaoF',     0,3,1);


-- Partida 12: Nacional 0-1 Peñarol
INSERT INTO ESTADISTICAS VALUES
(12,'ElBolso',    0,3,0),(12,'TricolorN',   0,4,0),(12,'BolsoGol',    0,3,0),
(12,'Carbonero',  1,2,0),(12,'MirassolP',   0,3,1),(12,'AuregroP',    0,2,0);


-- Semifinal 1: Colo-Colo 2-1 River Plate
INSERT INTO ESTADISTICAS VALUES
(13,'ElCacique',  1,2,1),(13,'CachorroCC',  1,1,1),(13,'PopoCC',      0,2,1),
(13,'ElMillonario',1,3,0),(13,'MilanesaR',  0,4,0),(13,'BandaRoja',   0,3,0);


-- Semifinal 2: Flamengo 1-2 U de Chile
INSERT INTO ESTADISTICAS VALUES
(14,'MengaoK',    1,3,0),(14,'RubroNegroF', 0,4,1),(14,'FlaFlu',      0,3,0),
(14,'ElBulla',    1,2,1),(14,'RompeRedes',  1,1,1),(14,'ElTren',      0,2,1);


-- FINAL T1: Colo-Colo 3-2 U de Chile
INSERT INTO ESTADISTICAS VALUES
(15,'ElCacique',  2,2,1),(15,'CachorroCC',  1,1,2),(15,'IndioCC',     0,2,1),
(15,'ElBulla',    1,2,1),(15,'RompeRedes',  1,1,1),(15,'ElTren',      0,3,1);


-- Torneo 2 Grupos (partidas 16-21)
INSERT INTO ESTADISTICAS VALUES
(16,'Verdao',     2,1,1),(16,'PorcoPalm',   1,2,1),(16,'AcademiaP',   0,2,1),
(16,'GringuillO', 0,4,0),(16,'BlanquiazulA',0,3,0),(16,'ElPatron',    0,4,0);


INSERT INTO ESTADISTICAS VALUES
(17,'ElCacique',  1,3,0),(17,'CachorroCC',  0,4,1),(17,'PopoCC',      0,3,0),
(17,'CruzadoK',   2,2,1),(17,'SantoUC',     0,3,1),(17,'TablitaUC',   0,3,0);


INSERT INTO ESTADISTICAS VALUES
(18,'Verdao',     1,2,1),(18,'SociedadePalm',1,3,0),(18,'VerdaoK',    0,3,1),
(18,'ElCacique',  1,3,0),(18,'IndioCC',      0,4,0),(18,'GarraBlanca', 0,3,0);


INSERT INTO ESTADISTICAS VALUES
(19,'GringuillO', 0,4,0),(19,'BlanquiazulA',0,3,0),(19,'AlianzaK',    0,4,0),
(19,'CruzadoK',   2,1,1),(19,'CruzUC',      0,3,1),(19,'TablitaUC',   0,3,0);


INSERT INTO ESTADISTICAS VALUES
(20,'Verdao',     1,3,0),(20,'PorcoPalm',    0,4,1),(20,'AcademiaP',   1,3,0),
(20,'CruzadoK',   2,2,1),(20,'SantoUC',      0,3,1),(20,'ElCruzado',   0,2,0);


INSERT INTO ESTADISTICAS VALUES
(21,'GringuillO', 1,3,0),(21,'ElPatron',     0,4,0),(21,'IntimosA',    0,3,0),
(21,'ElCacique',  2,1,1),(21,'CachorroCC',   1,2,1),(21,'IndioCC',     0,3,0);


-- Final T2: U Católica 2-1 Colo-Colo
INSERT INTO ESTADISTICAS VALUES
(22,'CruzadoK',  2,2,1),(22,'SantoUC',     0,3,1),(22,'TablitaUC',   0,4,0),
(22,'ElCacique', 1,3,0),(22,'CachorroCC',  0,4,0),(22,'PopoCC',      0,3,0);


-- Torneo 3 Grupos (partidas 23-28)
INSERT INTO ESTADISTICAS VALUES
(23,'ElBulla',    2,2,1),(23,'RompeRedes',  0,3,1),(23,'ElTren',      0,4,0),
(23,'XeneixeK',   2,2,1),(23,'BocaBoca',    1,3,1),(23,'Xeneize10',   0,4,0);


INSERT INTO ESTADISTICAS VALUES
(24,'ElMillonario',2,1,2),(24,'MilanesaR',  2,2,1),(24,'BandaRoja',   0,2,2),
(24,'Carbonero',   1,3,0),(24,'MirassolP',  0,4,0),(24,'AuregroP',    0,4,0);


INSERT INTO ESTADISTICAS VALUES
(25,'ElBulla',    0,4,0),(25,'AzulRojo',    0,3,0),(25,'ElPibe',      0,4,0),
(25,'ElMillonario',1,2,1),(25,'MilanesaR',  1,2,1),(25,'Monumental7', 0,3,1);


INSERT INTO ESTADISTICAS VALUES
(26,'XeneixeK',   2,2,1),(26,'BocaBoca',    0,3,1),(26,'Xeneize10',   0,4,0),
(26,'Carbonero',  1,3,0),(26,'AuregroP',    0,4,0),(26,'CarbonK',     0,3,0);


INSERT INTO ESTADISTICAS VALUES
(27,'ElBulla',    1,3,0),(27,'RompeRedes',  0,4,1),(27,'ElTren',      0,3,0),
(27,'Carbonero',  1,3,0),(27,'MirassolP',  0,4,0),(27,'CarbonK',     0,3,0);


INSERT INTO ESTADISTICAS VALUES
(28,'XeneixeK',   0,4,0),(28,'BocaBoca',    0,3,0),(28,'LaRibera',    0,4,0),
(28,'ElMillonario',2,1,1),(28,'MilanesaR',  0,2,2),(28,'BandaRoja',   0,3,1);


-- Final T3: River Plate 3-1 Boca Juniors
INSERT INTO ESTADISTICAS VALUES
(29,'ElMillonario',1,2,2),(29,'MilanesaR',  2,1,1),(29,'BandaRoja',   0,2,2),
(29,'XeneixeK',    1,3,0),(29,'BocaBoca',   0,4,0),(29,'Xeneize10',   0,4,0);
