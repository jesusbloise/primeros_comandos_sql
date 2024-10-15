 
 & "C:\Program Files\PostgreSQL\16\bin\psql.exe" -U postgres // este comando nos conectamos con el postgres y podemos ver las bases de datos
"C:\Program Files\PostgreSQL\16\bin\psql.exe" -U postgres // este es para la terminal

CREATE DATABASE prueba1; //aqui creamos una base de datos.

\l  //aqui podemos ver un listado de las bases de datos.

\c prueba1; //nos conectamos a la base de datos.

CREATE TABLE estudiantes(
    nombre varchar(50)
); //aqui se crea una tabla con una columna nota 

create table clientes(
 email varchar(50),
 nombre varchar,
 telefono varchar(16),
 empresa varchar(50),
 prioridad smallint check(prioridad between 1 and 10)
 );

ALTER TABLE estudiantes ADD notas varchar(50); //se crea otra columna en la tabla

ALTER TABLE estudiantes ADD apellido varchar(50); //se crea otra columna en la tabla

ALTER TABLE estudiantes
ADD COLUMN descripcion TEXT; //esto crea una columna sin limitaciones.

ALTER TABLE estudiantes
ADD COLUMN descripcion VARCHAR; // esto tambien crea una columna sin limitaciones.

ALTER TABLE clientes
ADD COLUMN prioridad SMALLINT CHECK (prioridad BETWEEN 1 AND 10); // este comando crea una columna check indica limite de los valores y lo que esta entre parentesis le da prioridad.


\d estudiantes; // describe la tabla creada es decir como es.

ALTER TABLE estudiante DROP apellido; //elimina la columna creada.

ALTER TABLE estudiantes
ALTER COLUMN nombre TYPE varchar(50); //cambiamos la cantidad de valores en una columna.

INSERT INTO estudiantes (nombre,nota) VALUES('carla',12); // agregamos un estudiante con nota.

INSERT INTO estudiantes (nombre,nota) 
VALUES
('miguel',12),
('carla',13),
('maria',18),
('andres',17); //agregamos varios estudiantes.

INSERT INTO clientes (email, nombre, telefono, empresa,prioridad)
VALUES
('daniel12@gmail', 'daniel', 1346546, 'ccu', 9),
('ramon345@hotmail', 'ramon', 1265, 'nestle', 6),
('jdaya@outlok', 'dayana', 1556, 'pepsi', 1),
('12miguel@gmai', 'miguel', 6567, 'austral', 4),
('carobel@hotmail', 'carolina', 67887977, 'patagonia', 8),
('matia@hotmail', 'matiaz',8078088, 'cocacola', 7),
('josefa@gmail', 'josefa', 8080788, 'colum', 3),
('luis@outlook', 'luis', 870876457, 'lider', 2),
('rodrigo@yahoo', 'rodrigo', 870876457, 'falabella', 5); //9 registros 

SELECT *
FROM clientes
ORDER BY prioridad DESC
LIMIT 3;

SELECT *
FROM clientes
WHERE prioridad > 5;

INSERT TO estudiantes (nombre) 
VALUES
('JESUS'),
('JESUS'); //agrega estudiantes sin nota.

SELECT * FROM estudiantes; //podemos ver los registros de la tabla.

DELETE FROM estudiantes
WHERE notas IS NULL; //eliminas los registros sin nota.

SELECT * FROM estudiantes;

DELETE FROM estudiante
WHERE NOTAS = '/'; //esto tambien funciona para eliminar registros sin nota.

UPDATE estudiantes
SET nota = '10'
WHERE nota = (SELECT MIN (notas) FROM estudiantes); //nos permite tomar la nota mas pequeña y cambiarla por el valor asignado en SET

INSERT TO estudiantes (nombre,nota) VALUES('JESuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuUS',10); //esto da un error por que el nombre es muy largo

SELECT * FROM estudiantes ORDER BY nota DESC;//ordena las notas en forma decendente.

SELECT * FROM estudiantes LIMIT 2; //selecctiona solo los dos datos de la tabla los dos primero.

SELECT * FROM estudiantes
WHERE nombre - 'jesus'
OR nombre = 'MARIA'; //esto nos renombre el nombre de un estudiantes

SELECT * FROM estudiantes
ORDER BY nombre ASC; // organiza los nombres de los estudiantes de manera ascendente 

SELECT * FROM estudiantes
ORDER BY nota ASC 
LIMIT 3; // te ordena la nota de solo 3 estudiantes de manera ascendente

SELECT * FROM estudiantes 
WHERE cast (nota  as int) between 3 and 8;// aqui podemos seleccionar las notas que tengan 3 y 8 

SELECT *
FROM clientes
ORDER BY prioridad DESC
LIMIT 3;// te selecciona los 3 clientes con mayos prioridad 

SELECT *
FROM clientes
WHERE prioridad > 5; //seleccionamos los clientes con mayor prioridad de 5 

UPDATE estudiantes
SET nota = 18
WHERE nombre = 'jose' AND nota = 11;// cambia el valor de una columna 


 \q // salimos de la base de datos.

 DROP DATABASE Nombre de la base de datos;






