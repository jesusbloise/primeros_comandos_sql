 & "C:\Program Files\PostgreSQL\16\bin\psql.exe" -U postgres -- este comando nos conectamos con el postgres y podemos ver las bases de datos

---creamos la base de datos
CREATE DATABASE desafio3_jesus_bloise_g69; 

--nos conectamos a la base de datos
\c desafio3_jesus_bloise_g69; 

-- creamos la tabla usuarios con las condiciones indicadas
CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    email VARCHAR(50) NOT NULL UNIQUE,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    rol VARCHAR(50) NOT NULL
);  

--ingresamos los datos y recuerden que el id se auto incrementa solo 
INSERT  INTO usuarios (email, nombre, apellido, rol) VALUES
('jesus@example.com', 'Jesus', 'bloise', 'usuario'),
('daya@example.com', 'dayana', 'alvarez', 'usuario'),
('usuario1@example.com', 'Juan', 'Pérez', 'usuario'),
('admin@example.com', 'Ana', 'García', 'administrador'),
('usuario2@example.com', 'Luis', 'Martínez', 'usuario'); --ingresamos los datos y recuerden que el id se auto incrementa solo 

--vemos la tabla usuarios
SELECT * FROM usuario; --vemos la tabla usuarios

--creamos la tabla post
CREATE TABLE posts (
    id SERIAL PRIMARY KEY, --se incrementa solo 
    titulo VARCHAR(255) NOT NULL, --un titulo
    contenido TEXT NOT NULL, --cualquier texto
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP, --se establecera al momento de la creacion del registro
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP, --luego con un trigger le cambiamos el estado de actualizacion
    destacado BOOLEAN NOT NULL,  --aceptara true o false 
    usuario_id BIGINT   --se conecta con el usuario que escribio el post 
);  --creamos esta tabla con varias condiciones 

--creamos la funcion para la tabla post
CREATE OR REPLACE FUNCTION actualizar_fecha()
RETURNS TRIGGER AS $$
BEGIN
    NEW.fecha_actualizacion = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql; --se crea la funcion para poder utilizar el trigger que permita actualizar la fecha de actualizacion

--creamos el trigger para la tabla post
CREATE TRIGGER actualiza_fecha_actualizacion
BEFORE UPDATE ON posts
FOR EACH ROW
EXECUTE FUNCTION actualizar_fecha(); --creamos un trigger para poder actualizar la fecha cuando se modifique 

--introducimos los datos a la tabla post
INSERT INTO posts (titulo, contenido, destacado, usuario_id) VALUES --asignamos los datos 
('Post 1', 'Contenido del post 1', TRUE, 1),  -- Post del administrador
('Post 2', 'Contenido del post 2', FALSE, 1), -- Post del administrador
('Post 3', 'Contenido del post 3', TRUE, 2),  -- Post de otro usuario
('Post 4', 'Contenido del post 4', FALSE, 2), -- Post de otro usuario
('Post 5', 'Contenido del post 5', TRUE, NULL); -- Post sin usuario asignado

--vemos la tabla post
SELECT * FROM posts; 

--creamos la tabla comentarios 
CREATE TABLE comentarios (
    id SERIAL PRIMARY KEY, 
    contenido TEXT NOT NULL,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    usuario_id BIGINT, --se conecta con usuario 
    post_id BIGINT, --se conecta con post
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id), -- Asegúrate de que la tabla usuarios existe
    FOREIGN KEY (post_id) REFERENCES posts(id)   -- Asegúrate de que la tabla posts existe
);

--introducimos los datos a la tabla comentarios
INSERT INTO comentarios (contenido, usuario_id, post_id) VALUES
('Comentario 1 del usuario 1 sobre el post 1', 1, 1),
('Comentario 2 del usuario 2 sobre el post 1', 2, 1),
('Comentario 3 del usuario 3 sobre el post 1', 3, 1),
('Comentario 4 del usuario 1 sobre el post 2', 1, 2),
('Comentario 5 del usuario 2 sobre el post 2', 2, 2);  ---datos de la tabla comentarios 

--podemos ver la tabla comentarios 
SELECT * FROM comentarios; 

-- Requerimientos
-- 1. Crea y agrega al entregable las consultas para completar el setup de acuerdo a lo
-- pedido.
-- (1 Punto)

-- 2. Cruza los datos de la tabla usuarios y posts, mostrando las siguientes columnas:
-- nombre y email del usuario junto al título y contenido del post.
-- (1 Punto)

-- de esta manera usamos solo un join y muestra solo los registros que tienen coincidencia 
SELECT u.nombre, u.email, p.titulo, p.contenido
FROM usuarios u
JOIN posts p ON u.id = p.usuario_id;

-- de esta manera muestra los resultados asi sean null
SELECT  u.nombre, u.email, p.titulo, p.contenido
FROM usuarios u
LEFT JOIN posts p ON u.id = p.usuario_id;

-- 3. Muestra el id, título y contenido de los posts de los administradores.
-- a. El administrador puede ser cualquier id.
-- (1 Punto).    
SELECT p.id, p.titulo, p.contenido
FROM posts p
WHERE p.usuario_id = 1;  -- Cambia 1 por el ID del administrador correspondiente

-- 4. Cuenta la cantidad de posts de cada usuario.
-- a. La tabla resultante debe mostrar el id e email del usuario junto con la
-- cantidad de posts de cada usuario.
-- (1 Punto)
-- Hint: Aquí hay diferencia entre utilizar inner join, left join o right join, prueba con
-- todas y con eso determina cuál es la correcta. No da lo mismo la tabla desde la que
-- se parte.
-- El INNER JOIN solo mostrará los usuarios que tienen al menos un post.
SELECT u.id, u.email, COUNT(p.id) AS cantidad_posts
FROM usuarios u
INNER JOIN posts p ON u.id = p.usuario_id
GROUP BY u.id, u.email;

-- El LEFT JOIN mostrará todos los usuarios, incluso aquellos que no tienen posts. Para estos usuarios, la cantidad de posts será 0.
SELECT u.id, u.email, COUNT(p.id) AS cantidad_posts
FROM usuarios u
LEFT JOIN posts p ON u.id = p.usuario_id
GROUP BY u.id, u.email;

-- El RIGHT JOIN mostrará todos los posts, junto con los usuarios que los han escrito. Si un post no tiene un usuario asignado, el resultado será NULL para el usuario.
SELECT u.id, u.email, COUNT(p.id) AS cantidad_posts
FROM posts p
RIGHT JOIN usuarios u ON u.id = p.usuario_id
GROUP BY u.id, u.email; --esta seria mi opcion

-- 5. Muestra el email del usuario que ha creado más posts.
-- a. Aquí la tabla resultante tiene un único registro y muestra solo el email.
-- (1 Punto)
SELECT u.email
FROM usuarios u
JOIN posts p ON u.id = p.usuario_id
GROUP BY u.id, u.email
ORDER BY COUNT(p.id) DESC
LIMIT 1; --puedes aumentar la cantidad ya que pueden haber usuarios con misma cantidad de post

-- 6. Muestra la fecha del último post de cada usuario.
-- (1 Punto)
-- Hint: Utiliza la función de agregado MAX sobre la fecha de creación
SELECT u.id, u.email, MAX(p.fecha_creacion) AS fecha_ultimo_post
FROM usuarios u
JOIN posts p ON u.id = p.usuario_id --si le colocas LEFT JOIN , se mostrarán todos los usuarios, incluso aquellos que no tienen posts, y su fecha del último post será NULL.
GROUP BY u.id, u.email
ORDER BY fecha_ultimo_post DESC;

-- 7. Muestra el título y contenido del post (artículo) con más comentarios.
-- (1 Punto)
SELECT p.titulo, p.contenido
FROM posts p
JOIN comentarios c ON p.id = c.post_id
GROUP BY p.id, p.titulo, p.contenido
ORDER BY COUNT(c.id) DESC
LIMIT 1; 

-- 8. Muestra en una tabla el título de cada post, el contenido de cada post y el contenido
-- de cada comentario asociado a los posts mostrados, junto con el email del usuario
-- que lo escribió
SELECT  p.titulo AS post_titulo,  p.contenido AS post_contenido, c.contenido AS comentario_contenido, u.email AS usuario_email
FROM posts p
LEFT JOIN comentarios c ON p.id = c.post_id
LEFT JOIN usuarios u ON c.usuario_id = u.id
ORDER BY p.id;

-- 9. Muestra el contenido del último comentario de cada usuario.
-- (1 Punto)
SELECT u.id AS usuario_id, u.email AS usuario_email, c.contenido AS ultimo_comentario
FROM usuarios u
JOIN comentarios c ON u.id = c.usuario_id
WHERE  c.fecha_creacion = (
        SELECT MAX(fecha_creacion)
        FROM comentarios
        WHERE usuario_id = u.id
    )
ORDER BY u.id;

-- 10. Muestra los emails de los usuarios que no han escrito ningún comentario.
-- (1 Punto)
-- Hint: Recuerda el uso de Having
SELECT  u.email
FROM  usuarios u
LEFT JOIN comentarios c ON u.id = c.usuario_id
GROUP BY u.id, u.email
HAVING COUNT(c.id) = 0;
