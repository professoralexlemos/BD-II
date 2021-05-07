DROP DATABASE IF EXISTS cadastro_veiculo;

CREATE DATABASE if NOT EXISTS cadastro_veiculo;

USE cadastro_veiculo;

CREATE TABLE categoria (
  idCategoria int(11) NOT NULL DEFAULT '0',
  categoria_veiculo varchar(45) NOT NULL,
  PRIMARY KEY (idCategoria)
);
DESC categoria;

CREATE TABLE estado (
  idEstado int(11) NOT NULL DEFAULT '0',
  nomeEstado varchar(45) NOT NULL,
  PRIMARY KEY (idEstado)
);
DESC estado;

CREATE TABLE marca (
  idMarca int(11) NOT NULL DEFAULT '0',
  marca varchar(45) NOT NULL,
  PRIMARY KEY (idMarca)
);
DESC marca;

CREATE TABLE proprietario (
  idDono int(11) NOT NULL DEFAULT '0',
  nomeDono varchar(50) NOT NULL,
  endereco varchar(100) NOT NULL,
  bairro varchar(45) NOT NULL,
  cpf varchar(45) NOT NULL,
  telefone varchar(45) DEFAULT NULL,
  dataNascimentoProp date NOT NULL,
  PRIMARY KEY (idDono)
);
DESC proprietario;

CREATE TABLE municipio (
  idMunicipio int(11) NOT NULL DEFAULT '0',
  nomeDoMunicipio varchar(150) DEFAULT NULL,
  estado_idEstado int(11) DEFAULT NULL,
  PRIMARY KEY (idMunicipio),
  KEY estado_idEstado (estado_idEstado),
  CONSTRAINT municipio_ibfk_1 FOREIGN KEY (estado_idEstado) REFERENCES estado (idEstado)
);
DESC municipio;

CREATE TABLE veiculo (
  idVeiculo int(11) NOT NULL DEFAULT '0',
  placaVeiculo varchar(10) NOT NULL,
  anoVeiculo date NOT NULL,
  proprietario_idDono int(11) NOT NULL,
  marca_idMarca int(11) NOT NULL,
  municipio_idMunicipio int(11) NOT NULL,
  categoria_idCategoria int(11) NOT NULL,
  PRIMARY KEY (idVeiculo),
  KEY proprietario_idDono (proprietario_idDono),
  KEY marca_idMarca (marca_idMarca),
  KEY municipio_idMunicipio (municipio_idMunicipio),
  KEY categoria_idCategoria (categoria_idCategoria),
  CONSTRAINT veiculo_ibfk_1 FOREIGN KEY (proprietario_idDono) REFERENCES proprietario (idDono),
  CONSTRAINT veiculo_ibfk_2 FOREIGN KEY (marca_idMarca) REFERENCES marca (idMarca),
  CONSTRAINT veiculo_ibfk_3 FOREIGN KEY (municipio_idMunicipio) REFERENCES municipio (idMunicipio),
  CONSTRAINT veiculo_ibfk_4 FOREIGN KEY (categoria_idCategoria) REFERENCES categoria (idCategoria)
);
DESC veiculo;