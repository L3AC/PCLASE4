Drop database Joins;

CREATE DATABASE Joins;

USE Joins;

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
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 7),
(2, 3),
(2, 7),
(3, 7),
(4, 1),
(4, 2),
(4, 4),
(4, 7);
