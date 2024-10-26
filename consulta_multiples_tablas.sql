 & "C:\Program Files\PostgreSQL\16\bin\psql.exe" -U postgres -- entramos al motor de postgres desde la terminal de powershell

create database consultando_dos_tablas; --creamos nuestra base de datos

\c consultando_dos_tablas; -- entramos a nuestra base de datos 

create table bitcoins (
	email VARCHAR(50),
	bitcoinAdress VARCHAR(50),
	monto DECIMAL(3,2)
);
insert into bitcoins (email, bitcoinAdress, monto) values ('jaime@email.com', '1HB8RTKNzFAQZ5LtLFRL3R7rbaLGuJt5Un', 0.32);
insert into bitcoins (email, bitcoinAdress, monto) values ('diego@email.com', '15z6eAp7GGforurLkgntSLocJvTafMPThp', 0.08);
insert into bitcoins (email, bitcoinAdress, monto) values ('francisca@email.com', '1NumuVDAuyYGy7b5G19X47dpvYRzRCCc4a', 0.04);
insert into bitcoins (email, bitcoinAdress, monto) values ('francisca@email.com', '1NQpZnNzJL2ntadzXj2PbN9nGgEj8zeHVP', 0.28);
insert into bitcoins (email, bitcoinAdress, monto) values ('jaime@email.com', '1NtsgLEjo3wXNH8ZSfQrF6CY3WRau3ic5Y', 0.53);
insert into bitcoins (email, bitcoinAdress, monto) values ('camila@email.com', '1HbvwhvxXqSUB5FZGZjjrJzi7Y9SpUy4LW', 0.65);
insert into bitcoins (email, bitcoinAdress, monto) values ('francisca@email.com', '14uX7dNXuU657AbNz3fh5K17UZYfmETidb', 0.38);
insert into bitcoins (email, bitcoinAdress, monto) values ('diego@email.com', '18RfzSJsJJej9mzwFNoRs8hpg5tR8bmKim', 0.73);
insert into bitcoins (email, bitcoinAdress, monto) values ('camila@email.com', '115A5LUmNVsjREzCHKbpuec2XueBViJG86', 0.19);
insert into bitcoins (email, bitcoinAdress, monto) values ('jaime@email.com', '1DVP9ATi1H3QUcp7PQcSsTEJdMab1ZM78Q', 0.93);
insert into bitcoins (email, bitcoinAdress, monto) values ('jaime@email.com', '1LcB8bsqyqRmJV8BSFdXMxFwnCWmKj3P7B', 0.83);
insert into bitcoins (email, bitcoinAdress, monto) values ('diego@email.com', '1CNXt7BL8Cm5o8zd7jriC2bUoHmyVUENF7', 0.89);
insert into bitcoins (email, bitcoinAdress, monto) values ('francisca@email.com', '17o3MhRdGL2e5uBUTCiH5mLbVxQ7JHbuck', 0.82);
insert into bitcoins (email, bitcoinAdress, monto) values ('francisca@email.com', '1HtutwGyd573w1a8MB99yU3qZY2uUmvb5V', 0.18);
insert into bitcoins (email, bitcoinAdress, monto) values ('camila@email.com', '12ZDMxk73Ej6zJZJ2XwnfmGUr4jBUDHmk9', 0.96);
insert into bitcoins (email, bitcoinAdress, monto) values ('jaime@email.com', '13L3hqtQbAzVWbu5zhnMM7v6y7kEM4wW3K', 0.2);
insert into bitcoins (email, bitcoinAdress, monto) values ('jaime@email.com', '14obJfGmgqFQeVeqBtpCWc7YE1r138djQt', 0.55);
insert into bitcoins (email, bitcoinAdress, monto) values ('camila@email.com', '1MggBaGyQGDgSUcb63g4Pqb3FTUg3VQawy', 0.21);
insert into bitcoins (email, bitcoinAdress, monto) values ('camila@email.com', '1L3281ktysdWfdkfGhq5SrmLkrwvTMdozS', 0.07);
insert into bitcoins (email, bitcoinAdress, monto) values ('francisca@email.com', '19CLwEhWsVW2oHUC6Dy66abetBbqB4qTiQ', 0.53);
insert into bitcoins (email, bitcoinAdress, monto) values ('jaime@email.com', '1A5oc25Q2Kj36aVT5JN3FBkXaHHrcKAR81', 0.43);
insert into bitcoins (email, bitcoinAdress, monto) values ('francisca@email.com', '14qXaaDbKMiTbovAd8772uZ6YDy2bWeGZm', 0.04);
insert into bitcoins (email, bitcoinAdress, monto) values ('jaime@email.com', '1M3dMYYngXbfbbjympmZAP57CaVDcx8Ffx', 0.95);
insert into bitcoins (email, bitcoinAdress, monto) values ('diego@email.com', '16WDsrHZ375PKBCdYLhhxrGFtguDQtJDSq', 0.61);
insert into bitcoins (email, bitcoinAdress, monto) values ('jaime@email.com', '1Jq2d8qk6a5p35Y3eqnrsgzDMdzTTCWUXv', 0.41);
insert into bitcoins (email, bitcoinAdress, monto) values ('diego@email.com', '15CBFjbUw46xH2md5eEeFpzaLHRZgATuT7', 0.72);
insert into bitcoins (email, bitcoinAdress, monto) values ('jaime@email.com', '1AFXgLKNCwPVTxVuHedTQrQY65yrAmyst5', 0.98);
insert into bitcoins (email, bitcoinAdress, monto) values ('camila@email.com', '19iMdr6JK6HgarHsebHmMMVjdxnNbybG6L', 0.8);
insert into bitcoins (email, bitcoinAdress, monto) values ('jaime@email.com', '1EL98fxNT1LyS6C8ckFBqocTho9NsEQATS', 0.96);
insert into bitcoins (email, bitcoinAdress, monto) values ('camila@email.com', '1B8xZAcBbU3mTfb6bNJvGtLdPanyAK9kN6', 0.79);

create table usuarios (
	email VARCHAR(50),
	nombre VARCHAR(100)
);

insert into usuarios (email, nombre) values ('camila@email.com', 'Camila');
insert into usuarios (email, nombre) values ('francisca@email.com', 'Francisca');
insert into usuarios (email, nombre) values ('diego@email.com', 'Diego');
insert into usuarios (email, nombre) values ('jaime@email.com', 'Jaime');
insert into usuarios (email, nombre) values ('fernanda@email.com', 'Fernanda');
insert into usuarios (email, nombre) values ('pedro@email.com', 'Pedro');
insert into usuarios (email, nombre) values ('josefina@email.com', 'Josefina');
insert into usuarios (email, nombre) values ('pp@email.com', 'Pepe');

-- mostramos ambas tablas con el campo en comun que es email. y mostramos una sola ves el emali se puede seleccionar de cualquier tabla.
SELECT usuarios.nombre, bitcoins.email, bitcoins.bitcoinAdress, bitcoins.monto
FROM usuarios, bitcoins
WHERE usuarios.email = bitcoins.email;  

-- mostramos ambas tablas con el campo en comun que es email pero con join
SELECT usuarios.nombre, usuarios.email, bitcoins.bitcoinAdress, bitcoins.monto
FROM usuarios
JOIN bitcoins ON usuarios.email = bitcoins.email; 

--con este comando unimos ambas tablas con el campo en comun lo mismo en las anteriores pero usando inner join
SELECT usuarios.nombre, usuarios.email, bitcoins.bitcoinAdress, bitcoins.monto
FROM usuarios
INNER JOIN bitcoins ON usuarios.email = bitcoins.email; 

--Selecciona los datos de ambas tablas utilizando LEFT JOIN y tomando como primera la tabla de bitcoins.
SELECT bitcoins.email, bitcoins.bitcoinAdress, bitcoins.monto, usuarios.nombre
FROM bitcoins
LEFT JOIN usuarios ON bitcoins.email = usuarios.email; 

--Selecciona los datos de ambas tablas utilizando LEFT JOIN y tomando como primera la tabla de usuarios
SELECT usuarios.email, usuarios.nombre, bitcoins.bitcoinAdress, bitcoins.monto
FROM usuarios
LEFT JOIN bitcoins ON usuarios.email = bitcoins.email; --Selecciona los datos de ambas tablas utilizando LEFT JOIN y tomando como primera la tabla de usuarios

-- En la primera consulta (FROM bitcoins), la tabla principal es bitcoins, lo que significa que verás todos los registros de bitcoins, incluso si no hay un usuario asociado.
-- En la segunda consulta (FROM usuarios), la tabla principal es usuarios, por lo que verás todos los usuarios, incluso si no han realizado transacciones de bitcoins.

--Diferencias con LEFT JOIN: El RIGHT JOIN asegura que todos los registros de usuarios se incluyan, mientras que en un LEFT JOIN (con bitcoins primero) se incluyen todos los registros de bitcoins.
SELECT bitcoins.email, bitcoins.bitcoinAdress, bitcoins.monto, usuarios.nombre
FROM bitcoins
RIGHT JOIN usuarios ON bitcoins.email = usuarios.email; 

--El FULL JOIN es útil cuando necesitas combinar todos los registros de ambas tablas y ver las coincidencias, así como los registros que no tienen correspondencia en la otra tabla.
SELECT usuarios.email, usuarios.nombre, bitcoins.bitcoinAdress, bitcoins.monto
FROM usuarios
FULL JOIN bitcoins ON usuarios.email = bitcoins.email; 
