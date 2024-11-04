create DATABASE pruebaSQL;

-- 1. Revisa el tipo de relación y crea el modelo correspondiente. Respeta las claves
-- primarias, foráneas y tipos de datos.
-- (1 punto)
CREATE TABLE peliculas (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(255),
    año INTEGER
);

CREATE TABLE tags (
    id SERIAL PRIMARY KEY,
    tag VARCHAR(32)
);

-- Esta tabla intermedia establece la relación muchos a muchos, 
-- relacionando las películas con sus tags a través de las claves foráneas pelicula_id y tag_id. 
-- La clave primaria compuesta garantiza la unicidad de cada asociación.
CREATE TABLE peliculas_tags (
    pelicula_id INTEGER REFERENCES peliculas(id),
    tag_id INTEGER REFERENCES tags(id),
    PRIMARY KEY (pelicula_id, tag_id)
);

-- 2. Inserta 5 películas y 5 tags; la primera película debe tener 3 tags asociados, la
-- segunda película debe tener 2 tags asociados.
-- (1 punto)
-- insertamos valores a la tabla de peliculas
INSERT INTO peliculas (nombre, año)
VALUES
    ('El Padrino', 1972),
    ('El Señor de los Anillos: La Comunidad del Anillo', 2001),
    ('Matrix', 1999),
    ('Pulp Fiction', 1994),
    ('El Laberinto del Fauno', 2006);

select * from peliculas;

-- insertamos valores a la tabla de tags
INSERT INTO tags (tag)
VALUES
    ('ciencia ficción'),
    ('acción'),
    ('drama'),
    ('fantasía'),
    ('terror');

select * from tags;

-- insertamos valores que relacionan las peliculas con tags
INSERT INTO peliculas_tags (pelicula_id, tag_id)
VALUES
    (1, 2),  -- El Padrino (acción)
    (1, 3),  -- El Padrino (drama)
    (1, 4),  -- El Padrino (fantasía)
    (2, 1),  -- El Señor de los Anillos (ciencia ficción)
    (2, 4),  -- El Señor de los Anillos (fantasía)
    (3, 1),  -- Matrix (ciencia ficción)
    (3, 2),  -- Matrix (acción)
    (4, 2),  -- Pulp Fiction (acción)
    (4, 3),  -- Pulp Fiction (drama)
    (5, 4),  -- El Laberinto del Fauno (fantasía)
    (5, 5);  -- El Laberinto del Fauno (terror)

select * from peliculas_tags;

-- 3. Cuenta la cantidad de tags que tiene cada película. Si una película no tiene tags debe
-- mostrar 0.
-- (1 punto)
SELECT peliculas.nombre AS nombre_de_la_pelicula,
COUNT(peliculas_tags.tag_id) AS numero_total_de_tags
FROM peliculas
LEFT JOIN peliculas_tags ON peliculas.id = peliculas_tags.pelicula_id
GROUP BY peliculas.id, peliculas.nombre;

-- Opcional borrado de tablas
DROP TABLE peliculas;
DROP TABLE tags;
DROP TABLE peliculas_tags;


-- 4. Crea las tablas correspondientes respetando los nombres, tipos, claves primarias y
-- foráneas y tipos de datos.
-- (1 punto)
--  Se crean las tablas con sus respectivas columnas y se establecen las claves primarias y foráneas.
CREATE TABLE preguntas (
    id SERIAL PRIMARY KEY,
    pregunta VARCHAR(255),
    respuesta_correcta VARCHAR(255)
);

CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(255),
    edad INTEGER
);

CREATE TABLE respuestas (
    id SERIAL PRIMARY KEY,
    respuesta VARCHAR(255),
    usuario_id INTEGER REFERENCES usuarios(id),
    pregunta_id INTEGER REFERENCES preguntas(id)
);

-- 5. Agrega 5 usuarios y 5 preguntas.
-- a. La primera pregunta debe estar respondida correctamente dos veces, por dos
-- usuarios diferentes.
-- b. La segunda pregunta debe estar contestada correctamente solo por un
-- usuario.
-- c. Las otras tres preguntas deben tener respuestas incorrectas.
-- Contestada correctamente significa que la respuesta indicada en la tabla respuestas
-- es exactamente igual al texto indicado en la tabla de preguntas.
-- (1 punto)
-- Se insertan datos en las tablas, asegurando que las respuestas correctas coincidan con la respuesta 
-- indicada en la tabla de preguntas.
INSERT INTO usuarios (nombre, edad)
VALUES
    ('Juan Pérez', 25),
    ('María López', 30),
    ('Pedro Gómez', 20),
    ('Ana Rodríguez', 28),
    ('Carlos Martínez', 32);

SELECT * FROM usuarios;

INSERT INTO preguntas (pregunta, respuesta_correcta)
VALUES
    ('¿Cuál es la capital de Francia?', 'París'),
    ('¿Quién pintó la Mona Lisa?', 'Leonardo da Vinci'),
    ('¿Cuál es el planeta más grande del sistema solar?', 'Júpiter'),
    ('¿Cuál es la fórmula del agua?', 'H2O'),
    ('¿En qué año se descubrió América?', '1492');

select * from preguntas;

INSERT INTO respuestas (respuesta, usuario_id, pregunta_id)
VALUES
    ('París', 1, 1),
    ('París', 2, 1),
    ('Leonardo da Vinci', 3, 2),
    ('Marte', 4, 3),
    ('Tierra', 5, 3),
    ('H3O', 1, 4),
    ('1500', 2, 5);
SELECT* FROM respuestas;

-- 6. Cuenta la cantidad de respuestas correctas totales por usuario (independiente de la
-- pregunta).
-- -- (1 punto)
--  Se realizan consultas para contar las respuestas correctas por usuario.
SELECT usuarios.nombre AS nombre_del_usuario, COUNT(*) AS cantidad_de_respuestas_correctas
FROM  usuarios
INNER JOIN respuestas ON usuarios.id = respuestas.usuario_id
INNER JOIN preguntas ON respuestas.pregunta_id = preguntas.id
WHERE respuestas.respuesta = preguntas.respuesta_correcta
GROUP BY usuarios.id, usuarios.nombre;

-- 7. Por cada pregunta, en la tabla preguntas, cuenta cuántos usuarios respondieron
-- correctamente.
-- (1 punto)
--  Se realizan consultas para contar las respuestas por pregunta, respectivamente.
SELECT preguntas.pregunta AS enunciado_de_la_pregunta, COUNT(*) AS cantidad_de_usuarios_que_acertaron
FROM  preguntas
INNER JOIN respuestas ON preguntas.id = respuestas.pregunta_id
WHERE respuestas.respuesta = preguntas.respuesta_correcta
GROUP BY  preguntas.id, preguntas.pregunta;

-- 8. Implementa un borrado en cascada de las respuestas al borrar un usuario. Prueba la
-- implementación borrando el primer usuario.
-- (1 punto)
--  Se crea una restricción de borrado en cascada para la tabla respuestas, lo que significa que al eliminar un usuario, 
-- también se eliminarán todas sus respuestas asociadas.
ALTER TABLE respuestas
DROP CONSTRAINT respuestas_usuario_id_fkey; --Eliminar la restricción existente

ALTER TABLE respuestas
ADD CONSTRAINT respuestas_usuario_id_fkey
FOREIGN KEY (usuario_id)
REFERENCES usuarios(id)
ON DELETE CASCADE; --Crear una nueva restricción con borrado en cascada

DELETE FROM usuarios WHERE id = 1; --implementacion

-- 9. Crea una restricción que impida insertar usuarios menores de 18 años en la base de
-- datos.
-- -- (1 punto)
-- Se agrega una restricción CHECK para asegurar que la edad de los usuarios sea mayor o igual a 18.
ALTER TABLE usuarios
ADD CONSTRAINT check_edad CHECK (edad >= 18);

select * from usuarios;

-- 10. Altera la tabla existente de usuarios agregando el campo email. Debe tener la
-- restricción de ser único.
-- (1 punto)
-- Se agrega una nueva columna email a la tabla usuarios y se establece como única para evitar duplicados.
ALTER TABLE usuarios
ADD COLUMN email VARCHAR(255) UNIQUE;

-- Opcional borrado de tablas
DROP TABLE usuarios;
DROP TABLE respuestas;
DROP TABLE preguntas;