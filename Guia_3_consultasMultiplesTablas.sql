 & "C:\Program Files\PostgreSQL\16\bin\psql.exe" -U postgres -- este comando nos conectamos con el postgres y podemos ver las bases de datos

create database paises;

CREATE TABLE countries(
id INTEGER,
name VARCHAR,
iso3 CHAR(3),
capital VARCHAR,
currency CHAR(3),
currency_name VARCHAR,
tid CHAR(3),
region VARCHAR,
subregion VARCHAR,
latitude DECIMAL(10,8),
longitude DECIMAL(11,8)
);

\copy countries from 'C:\Users\usuario\Documents\desafio-latam\modulo5\actividades' DELIMITER ',' CSV HEADER

\copy countries from '/mnt/C:/Users/usuario/Documents/desafio_latam/modulo5/actividades/Documentos_actividad_guía/countries.csv'
delimiter ',' csv header;

SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'public'; --podemos ver los nombres de las tablas dentro de la db

SELECT COUNT(*) 
FROM information_schema.tables 
WHERE table_schema = 'public'; --podemos contar las tablas que tenemos en la db

\copy cities FROM '/mnt/c/Users/usuario/Documents/desafio_latam/modulo5/actividades/Documentos_actividad_guía/cities.csv' DELIMITER ',' CSV HEADER;
\copy cities FROM 'C:/Users/usuario/Documents/cities.csv' DELIMITER ',' CSV HEADER; --asi copiamos los datos en una table, pero primero se debe transformar utf8
\copy cities FROM 'C:\Users\usuario\Documents\cities.csv' DELIMITER ',' CSV HEADER;

select * from countries
inner join states on countries.id = states.country_id
order  by countries.latitude
limit (10); --seleccionamos los paises y sus estados todo juntos mostramos solo 10 registros y los ordenamos por latitude

-- 1. Selecciona el cruce de ambas tablas ordenadas alfabéticamente por el nombre del
-- país y limitando a 10 resultados.

SELECT countries.name AS country_name, states.name AS state_name
FROM countries
INNER JOIN states ON countries.id = states.country_id
ORDER BY countries.name ASC
LIMIT 10;

-- 2. Selecciona los primeros 5 estados de Austria.

SELECT states.name AS state_name
FROM states
INNER JOIN countries ON states.country_id = countries.id
WHERE countries.name = 'Austria'
LIMIT 5;

-- 3. Cuenta la cantidad de estados que tiene cada país, limitando los resultados a 10.

SELECT countries.name AS country_name, COUNT(states.id) AS state_count
FROM countries
LEFT JOIN states ON countries.id = states.country_id
GROUP BY countries.name
ORDER BY state_count DESC
LIMIT 10;

-- 4. ¿Cuáles son los 3 países con más estados? Muestra el país junto con la cantidad de
-- estados.

SELECT countries.name AS country_name, COUNT(states.id) AS state_count
FROM countries
LEFT JOIN states ON countries.id = states.country_id
GROUP BY countries.name
ORDER BY state_count DESC
LIMIT 3;

-- 5. ¿Cuál es el país con el estado que está más al norte? Muestra el país y el estado con
-- la latitud correspondiente.
-- - (La latitud debe ser del estado, no la del país).

SELECT countries.name AS country_name, states.name AS state_name, states.latitude
FROM states
INNER JOIN countries ON states.country_id = countries.id
ORDER BY states.latitude DESC
LIMIT 1; -- aqui nos muestra hasta los null

SELECT countries.name AS country_name, states.name AS state_name, states.latitude
FROM states
INNER JOIN countries ON states.country_id = countries.id
WHERE states.latitude IS NOT NULL
ORDER BY states.latitude DESC
LIMIT 1; -- aqui filtramos para que se agregen solo los que tengan latitud
 
-- 6. ¿Tenemos la misma cantidad de resultados con inner join que con left join?
-- ● Cuenta ambos casos y compara.

SELECT COUNT(*) AS inner_join_count
FROM countries
INNER JOIN states ON countries.id = states.country_id; --inner join

SELECT COUNT(*) AS left_join_count
FROM countries
LEFT JOIN states ON countries.id = states.country_id; --left join

SELECT
    (SELECT COUNT(*) FROM countries INNER JOIN states ON countries.id = states.country_id) AS inner_join_count,
    (SELECT COUNT(*) FROM countries LEFT JOIN states ON countries.id = states.country_id) AS left_join_count; --buscamos ambos resultados 

-- 7. ¿Cuáles son los 5 estados con más ciudades? Muéstranos.

SELECT states.name AS state_name, COUNT(cities.id) AS city_count
FROM states
LEFT JOIN cities ON states.id = cities.state_id
GROUP BY states.name
ORDER BY city_count DESC
LIMIT 5;

-- ● Selecciona todos los países con sus estados y ciudades.
-- ○ Limita los resultados a 50.

SELECT 
    countries.name AS country_name, 
    states.name AS state_name, 
    cities.name AS city_name
FROM countries
LEFT JOIN states ON countries.id = states.country_id
LEFT JOIN cities ON states.id = cities.state_id
LIMIT 50;   --- muestra los primeros 50 sin importar el pais 

SELECT 
    countries.name AS country_name, 
    states.name AS state_name, 
    cities.name AS city_name
FROM countries
LEFT JOIN states ON countries.id = states.country_id
LEFT JOIN cities ON states.id = cities.state_id
WHERE countries.name = 'Polonia'
LIMIT 50;                 -- con este codigo hacemos la busqueda mas especifica a un pais 

-- ● Muestra cada país junto con la cantidad de ciudades que tiene.

SELECT 
    countries.name AS country_name, 
    COUNT(cities.id) AS city_count
FROM countries
LEFT JOIN states ON countries.id = states.country_id
LEFT JOIN cities ON states.id = cities.state_id
GROUP BY countries.name
ORDER BY city_count DESC;

-- ● Muestra cada país junto con la ciudad más al norte (mayor latitud).

SELECT 
    countries.name AS country_name,
    cities.name AS northern_city,
    cities.latitude
FROM countries
JOIN states ON countries.id = states.country_id
JOIN cities ON states.id = cities.state_id
WHERE (cities.latitude, states.id) IN (
    SELECT 
        MAX(cities.latitude), 
        states.id
    FROM cities
    JOIN states ON cities.state_id = states.id
    JOIN countries ON states.country_id = countries.id
    GROUP BY states.id
)
ORDER BY countries.name;

-- ● Considera este ejercicio en particular. ¿Existe alguna diferencia entre ocupar inner
-- join en ambos cruces, ocupar left join en ambos o uno de cada uno de los
-- tipos de joins? Cuenta los resultados y responde

SELECT 
    countries.name AS country_name, 
    COUNT(cities.id) AS city_count
FROM countries
INNER JOIN states ON countries.id = states.country_id
INNER JOIN cities ON states.id = cities.state_id
GROUP BY countries.name;

