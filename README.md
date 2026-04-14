# Tarea 1 — Torneo Gaming

## Integrantes

- Agustín Fierro — N°Alumno: 24644978
- Felipe Cintolesi — N°Alumno: 24643424
- Lorenzo Huete — N°Alumno: xxxxxxxx
## Variables de entorno

las siguientes variables de entorno para la conexión a la base de datos PostgreSQL son:

 - `DB_HOST` = `localhost` 
 - `DB_PORT` = `5432` 
 - `DB_NAME` = `tarea1` 
 - `DB_USER` = `postgres` 
 - `DB_PASSWORD` = `postgres` 


## Instrucciones para levantar la aplicación


1. instalar bibliotecas necesarias
pip install flask psycopg2-binary

2. descargar pgadmin
descargar pg admin para usar PostgreSQL

3. Crear la base de datos en pgadmin
copiar y pegar schema.sql y data.sql en el script de pgadmin

4. Iniciar la aplicación
la aplicacion se inicia desde app.py

La aplicación quedará disponible en http://localhost:5000


# Consideraciones

1. A la variable "Restarts" le pusimos el nombre "Muertes", pues para nosotros generaba mas claridad.

2.  La funcion de inscribir equipos en torneos no funciona, ya que cuando poblamos la base de datos los llenamos todos.

3. Consideramos que no se van a eliminar o updatear variables.