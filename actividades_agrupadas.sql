//ACTIVIDAD 1
"C:\Program Files\PostgreSQL\16\bin\psql.exe" -U postgres // este es para la terminal

create DATABASE actividades_grupales; // creamos nuestra DB(base de datos) 

\c actividades_grupales; // entramos a la DB

create table bitcoins (
    email varchar(50),
    bitcoinAdress TEXT,
    monto decimal(10,2)
);              //creamos nuestra tabla

insert into bitcoins (email, bitcoinAdress, monto) values
('jaime@email.com', '1HB8RTKNzFAQZ5LtLFRL3R7rbaLGuJt5Un', 0.32),
('diego@email.com', '15z6eAp7GGforurLkgntSLocJvTafMPThp', 0.08),
('francisca@email.com', '1NumuVDAuyYGy7b5G19X47dpvYRzRCCc4a', 0.04),
('francisca@email.com', '1NQpZnNzJL2ntadzXj2PbN9nGgEj8zeHVP', 0.28),
('jaime@email.com', '1NtsgLEjo3wXNH8ZSfQrF6CY3WRau3ic5Y', 0.53),
('camila@email.com', '1HbvwhvxXqSUB5FZGZjjrJzi7Y9SpUy4LW', 0.65),
('francisca@email.com', '14uX7dNXuU657AbNz3fh5K17UZYfmETidb', 0.38),
('diego@email.com', '18RfzSJsJJej9mzwFNoRs8hpg5tR8bmKim', 0.73),
('camila@email.com', '115A5LUmNVsjREzCHKbpuec2XueBViJG86', 0.19),
('jaime@email.com', '1DVP9ATi1H3QUcp7PQcSsTEJdMab1ZM78Q', 0.93),
('jaime@email.com', '1LcB8bsqyqRmJV8BSFdXMxFwnCWmKj3P7B', 0.83),
('diego@email.com', '1CNXt7BL8Cm5o8zd7jriC2bUoHmyVUENF7', 0.89),
('francisca@email.com', '17o3MhRdGL2e5uBUTCiH5mLbVxQ7JHbuck', 0.82),
('francisca@email.com', '1HtutwGyd573w1a8MB99yU3qZY2uUmvb5V', 0.18),
('camila@email.com', '12ZDMxk73Ej6zJZJ2XwnfmGUr4jBUDHmk9', 0.96),
('jaime@email.com', '13L3hqtQbAzVWbu5zhnMM7v6y7kEM4wW3K', 0.2),
('jaime@email.com', '14obJfGmgqFQeVeqBtpCWc7YE1r138djQt', 0.55),
('camila@email.com', '1MggBaGyQGDgSUcb63g4Pqb3FTUg3VQawy', 0.21),
('camila@email.com', '1L3281ktysdWfdkfGhq5SrmLkrwvTMdozS', 0.07),
('francisca@email.com', '19CLwEhWsVW2oHUC6Dy66abetBbqB4qTiQ', 0.53),
('jaime@email.com', '1A5oc25Q2Kj36aVT5JN3FBkXaHHrcKAR81', 0.43),
('francisca@email.com', '14qXaaDbKMiTbovAd8772uZ6YDy2bWeGZm', 0.04),
('jaime@email.com', '1M3dMYYngXbfbbjympmZAP57CaVDcx8Ffx', 0.95),
('diego@email.com', '16WDsrHZ375PKBCdYLhhxrGFtguDQtJDSq', 0.61),
('jaime@email.com', '1Jq2d8qk6a5p35Y3eqnrsgzDMdzTTCWUXv', 0.41),
('diego@email.com', '15CBFjbUw46xH2md5eEeFpzaLHRZgATuT7', 0.72),
('jaime@email.com', '1AFXgLKNCwPVTxVuHedTQrQY65yrAmyst5', 0.98),
('camila@email.com', '19iMdr6JK6HgarHsebHmMMVjdxnNbybG6L', 0.8),
('jaime@email.com', '1EL98fxNT1LyS6C8ckFBqocTho9NsEQATS', 0.96),
('camila@email.com', '1B8xZAcBbU3mTfb6bNJvGtLdPanyAK9kN6', 0.79);

select count(*) from bitcoins;

SELECT MAX(monto) FROM bitcoins;

SELECT MIN(monto) FROM bitcoins;

SELECT AVG(monto) FROM bitcoins; //solicitamos el promedio de monto de bitcoins

SELECT SUM(monto) FROM bitcoins; //sumamos todo el monto de bitcoins

SELECT DISTINCT(email) From bitcoins;

SELECT COUNT(DISTINCT(email)) From bitcoins;

//ACTIVIDAD 2

SELECT DISTINCT(email) From bitcoins;     //selecciona las categorias sin repetirlas y las muestra

SELECT COUNT(DISTINCT(email)) From bitcoins;  // esto es lo mismo pero solo te muestra el numero

SELECT DISTINCT(monto) From bitcoins;

SELECT COUNT(DISTINCT(monto)) From bitcoins;

//ACTIVIDAD 3

CREATE TABLE ventas (
    categoria varchar(50),
    monto NUMERIC              // se crea con numeric para que acepte tanto decimal como entero
);

INSERT INTO ventas (categoria, monto) VALUES
('Books', 214),
('Games', 293),
('Baby', 241),
('Tools', 719),
('Tools', 385),
('Movies', 882),
('Outdoors', 654),
('Baby', 332),
('Grocery', 332),
('Toys', 952),
('Games', 682),
('Books', 527),
('Kids', 980),
('Grocery', 300);

SELECT categoria FROM ventas GROUP by categoria; //agrupa las categorias y muestra las mismas

SELECT distinct(categoria) FROM ventas; // esto igual

SELECT categoria, count(categoria) FROM ventas GROUP by categoria; //aqui agregamos una columna que nos enumera cuantas veces se repite ese dato

SELECT categoria, SUM(monto) FROM ventas GROUP BY categoria; // aqui estamos sumando los monto de los datos repetidos

// ACTIVIDAD 4.

SELECT categoria, SUM(monto) FROM ventas GROUP BY categoria; // aqui estamos sumando los monto de los datos repetidos

SELECT categoria, count(categoria) FROM ventas GROUP by categoria; //aqui agregamos una columna que nos enumera cuantas veces se repite ese dato

SELECT categoria, AVG(monto) FROM ventas GROUP by categoria; // aqui calculamos el promedio de venta de cada categoria

SELECT categoria, MIN(monto) FROM ventas GROUP by categoria; //seleccionamos el min vendido de cada categoria

SELECT categoria, MAX(monto) FROM ventas GROUP by categoria; //seleccionamos el monto maximo de cada categoria

SELECT email, count(monto) from bitcoins group by email; //  Seleccionar la cantidad total de depósitos recibidos por cada usuario.

SELECT email, SUM(monto) from bitcoins group by email; //Seleccionar el monto total de bitcoins de cada usuario.

SELECT email, MIN(monto) from bitcoins group by email; //Seleccionar el menor depósito recibido por cada usuario

SELECT email, MAX(monto) from bitcoins group by email; //Seleccionar el mayor depósito recibido por cada usuario.

SELECT categoria, 
COUNT(categoria) FROM ventas 
GROUP BY categoria 
HAVING COUNT(categoria)>= 2; //nos permite filtrar el resultado y colocar la condicion para ver quienes tienen mas de dos ventas en este cambiamos

SELECT categoria, 
SUM(monto) FROM ventas 
GROUP BY categoria 
HAVING COUNT(categoria) > 3; //aqui condicionamos para que solo me sume las ventas del la misma categoria si tiene mas de 3 ventas(ejemplo)

SELECT categoria, 
COUNT(categoria) FROM ventas 
GROUP BY categoria 
HAVING SUM(monto) > 500; //o podemos contar solo si el monto total es mayor 

//ACTIVIDAD 5

SELECT email, 
COUNT(email) FROM bitcoins
GROUP BY email 
HAVING COUNT(email) <= 1;  //Listar todos los correos de los usuarios que hayan recibido un solo depósito

SELECT email
FROM bitcoins
GROUP BY email
HAVING COUNT(*) = 1;//Listar todos los correos de los usuarios que hayan recibido un solo depósito

SELECT email, SUM(monto) AS total_depositos
FROM bitcoins
GROUP BY email
HAVING SUM(monto) > 1.5;//Listar todos los correos de los usuarios que hayan recibido un total de depósitos mayor a 1.5 bitcoins.


// ACTIVIDAD 6

SELECT * 
FROM bitcoins
WHERE monto >= 0.9; // Listar todas las transacciones de la tabla bitcoin que sean mayores o iguales a 0.9 btc.

SELECT * 
FROM bitcoins
WHERE monto <= 0.5; //Listar todas las transacciones de la tabla bitcoin, exceptuando aquellos que de monto superior a 0.5 bitcoins.

select * from ventas where monto > (select avg(monto) from ventas); //hacer una consulta dentro de otra

//ACTIVIDAD 7

select * from bitcoins where monto > (select avg(monto) from bitcoins);

select * from bitcoins where monto > (select monto from bitcoins limit 1);





