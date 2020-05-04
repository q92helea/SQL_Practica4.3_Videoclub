CREATE TABLE director (
Nombre VARCHAR2(30) PRIMARY KEY,
Nacionalidad VARCHAR(15)
);
CREATE TABLE actores (
Nombre VARCHAR2(30) PRIMARY KEY,
Nacionalidad VARCHAR2(15),
Sexo VARCHAR2(1) -- Sexo toma valores H ó M. ¿Restricción?
);
CREATE TABLE película (
ID_Peli VARCHAR2(5)PRIMARY KEY,
Título VARCHAR2(30)NOT NULL,-- ¿Restricción?
Productora VARCHAR2(30),
Nacionalidad VARCHAR2(15),
Fecha DATE,
Nombre VARCHAR2(30),
CONSTRAINT fk_Nombre FOREIGN KEY (Nombre) REFERENCES director(Nombre)
);

CREATE TABLE actua (
Actor VARCHAR2(30),
ID_film VARCHAR2(4),
CONSTRAINT FK_Actor FOREIGN KEY (Actor) REFERENCES Actores (Nombre),
CONSTRAINT FK_ID_film FOREIGN KEY (ID_film) REFERENCES Película(ID_Peli)
);

CREATE TABLE socio (
DNI VARCHAR2(9) PRIMARY KEY,
Nombre VARCHAR2(15)NOT NULL, -- ¿Restricción?
Dirección VARCHAR2(30),
Teléfono VARCHAR2(9),
Avalador VARCHAR2(15),
CONSTRAINT FK_avalador_socio FOREIGN KEY (Avalador) REFERENCES socio(DNI)
);

CREATE TABLE ejemplar (
Numero NUMBER(2) PRIMARY KEY,
codPeli VARCHAR(5),-- codPeli es ID_peli(PK FK1 de la tabla "película")
Estado VARCHAR2(10),
CONSTRAINT FK_codPeli_película FOREIGN KEY (codPeli)REFERENCES película(ID_Peli) 
);

CREATE TABLE alquila (
DNIalq VARCHAR2(9), -- DNIalq es DNI (PK FK1 de la tabla "socio")
ID_Pelialq VARCHAR2(5), -- ID_Pelialq es ID_Peli(PK FK2 de la tabla"ejemplar")
Numalq VARCHAR2(2),-- Numalq es Número (PK FK2 de la tabla"ejemplar")
CONSTRAINT FK_DNIalq_cliente FOREIGN KEY (DNIalq)REFERENCES socio(DNI), 
CONSTRAINT FK_ID_Pelialq_ejemplar FOREIGN KEY (ID_Pelialq)REFERENCES ejemplar(codPeli), -- Es la FK de una FK ¿Es este el error?
CONSTRAINT FK_Numalq_ejemplar FOREIGN KEY (Numalq)REFERENCES ejemplar(Numero) -- Es la FK de una FK ¿Es este el error?
);
