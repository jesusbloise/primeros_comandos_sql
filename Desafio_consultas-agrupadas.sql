 & "C:\Program Files\PostgreSQL\16\bin\psql.exe" -U postgres -- este comando nos conectamos con el postgres y podemos ver las bases de datos

 create database desafio_consulta_agrupadas; --ceamos la base de datos

 \c desafio_consulta_agrupadas; --entramso a la base de datos

CREATE TABLE INSCRITOS(cantidad INT, fecha DATE, fuente VARCHAR); --creamos la tabla

INSERT INTO INSCRITOS(cantidad, fecha, fuente) --introducimos registros en la tabla
VALUES ( 44, '2021-01-01', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 56, '2021-01-01', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 39, '2021-01-02', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 81, '2021-01-02', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 12, '2021-01-03', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 91, '2021-01-03', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 48, '2021-01-04', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 45, '2021-01-04', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 55, '2021-01-05', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 33, '2021-01-05', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 18, '2021-01-06', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 12, '2021-01-06', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 34, '2021-01-07', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 24, '2021-01-07', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 83, '2021-01-08', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 99, '2021-01-08', 'Página' );

select count(*) from INSCRITOS; --con este codigo contamos los registros

select sum(cantidad) from INSCRITOS; --sumamos las cantidades 

select * from INSCRITOS where fecha  = (select min(fecha) from INSCRITOS LIMIT 2); --seleccionamos y mostramos los mas antiguos por fecha

SELECT fecha, SUM(cantidad) from INSCRITOS group by fecha; -- contamos cuantos inscritos por dia hay

SELECT fuente, SUM(cantidad) from INSCRITOS group by fuente;

SELECT fecha, SUM(cantidad) AS total_inscritos
FROM INSCRITOS
GROUP BY fecha LIMIT 1; --seleccionamos el todal de inscritos por fecha y mostramos el mayor 

select fecha, cantidad, fuente 
from INSCRITOS where fuente = 'Blog' 
order by cantidad desc limit 1; --vemos cuantos por fecha se inscribieron por el blog y mostramos el mayos

SELECT fecha, AVG(cantidad) as inscritos_por_dia FROM inscritos GROUP by fecha; --calculamos el promedio de personas inscritas por dia 

SELECT fecha, 
sum(cantidad) FROM INSCRITOS 
GROUP BY fecha 
HAVING sum(cantidad)> 50; -- mostramos los dias que se inscribieron mas de 50 personas

SELECT fecha, AVG(cantidad) as promedio_diario FROM INSCRITOS GROUP by fecha;

