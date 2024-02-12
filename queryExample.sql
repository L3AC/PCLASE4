Drop database Ejemplos;

CREATE DATABASE Ejemplos;

USE Ejemplos;

CREATE TABLE usuarios (
  ID int not null primary key auto_increment,
  username varchar(50) not null
);


CREATE TABLE juegos (
  ID int  not null primary key auto_increment,
  juegoname varchar(50) not null
);


CREATE TABLE juegousuario (
  ID_usuario int not null,
  ID_juego int not null,
  foreign key (ID_usuario) references usuarios(ID) on delete cascade on update cascade,
  foreign key (ID_juego) references juegos(ID) on delete cascade on update cascade
);


INSERT INTO usuarios (username) VALUES
('vichaunter'),
('pepito'),
('jaimito'),
('ataulfo');


INSERT INTO juegos (juegoname) VALUES
('Final Fantasy VII'),
('Zelda: A link to the past'),
('Crazy Taxy'),
('Donkey Kong Country'),
('Saints Row III'),
('Fallout 4'),
('La taba');


INSERT INTO juegousuario (ID_usuario, ID_juego) VALUES
(1, 1),(1, 2),(1, 3),(1, 4),(1, 5),(1, 7),
(2, 3),(2, 7),(3, 7),(4, 1),(4, 2),(4, 4),(4, 7);

/*--------------------------------- JOINS ----------------------------------------*/
/*INNER JOIN*/
SELECT usuarios.username, juegos.juegoname
FROM usuarios
INNER JOIN juegousuario ON usuarios.ID = juegousuario.ID_usuario
INNER JOIN juegos ON juegousuario.ID_juego = juegos.ID;

/*LEFT JOIN*/
SELECT usuarios.username, juegos.juegoname
FROM usuarios
LEFT JOIN juegousuario ON usuarios.ID = juegousuario.ID_usuario
LEFT JOIN juegos ON juegousuario.ID_juego = juegos.ID;

/*RIGHT JOIN*/
SELECT usuarios.username, juegos.juegoname
FROM usuarios
RIGHT JOIN juegousuario ON usuarios.ID = juegousuario.ID_usuario
RIGHT JOIN juegos ON juegousuario.ID_juego = juegos.ID;


/* ----------------------------------- SUBCONSULTA ---------------------------------*/
SELECT username
FROM usuarios
WHERE ID IN (
  SELECT ID_usuario
  FROM juegousuario
  WHERE ID_juego = 3
);

