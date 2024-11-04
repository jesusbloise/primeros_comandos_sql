-- Active: 1730155961729@@127.0.0.1@5432@guia4@public
CREATE DATABASE guia4;

CREATE TABLE usuariosP1 (
    nombre VARCHAR(32),
    edad INTEGER
    );

select * from usuariosp1;

INSERT INTO usuariosp1(nombre, edad)
VALUES
('Consuelo', 27),
('Consuelo', 32),
('Francisco', 27);

UPDATE usuariosp1
SET edad = edad + 1
WHERE nombre = 'Consuelo';

ALTER TABLE usuariosP1
ADD COLUMN id SERIAL PRIMARY KEY;

CREATE TABLE pagos( 
    pagos_id serial PRIMARY key,
    monto INTEGER,
    usuario_id INTEGER);

select * from pagos;

INSERT into pagos(monto, usuario_id)
VALUES
(1500, 1),
(1300, 2),
(2700, 4);

DELETE FROM usuariosP1
WHERE id = 2;

