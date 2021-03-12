Comando para acessar o MySQL
mysql -u root -p

Listar os banco de dados do MySQL
show databases;

Comando para criar um Banco de Dados
create database cliente;

Selecionar o Banco de Dados
use cliente;

Listar as tabelas do Bando de Dados
show tables;

Comando para criar a tabela
create table cliente (
    codigo int,
    nome varchar(50),
    idade int,
    dt_nasc date,
    telefone varchar(12)
);

Comando para ver a estrutura interna tabela
describe cliente;

Comando para apagar uma tabela
drop table cliente;

Adicionar os campos obrigatórios
create table cliente (
    codigo int not null,
    nome varchar(50) not null,
    idade int null default 0,
    dt_nasc date null,
    telefone varchar(12)
);

Adicionar chave primária
drop table cliente;
create table cliente (
    codigo int not null auto_increment,
    nome varchar(50) not null,
    idade int null default 0,
    dt_nasc date null,
    telefone varchar(12),
    primary key(codigo, nome)
);
describe cliente;


remover o campo com o telefone
drop table cliente;

create table cliente (
    codigo int not null auto_increment,
    nome varchar(50) not null,
    idade int null default 0,
    dt_nasc date null,
    primary key(codigo, nome)
);

describe cliente;

Criar uma tabela para telefone
create table telefone(
    codigo int not null,
    ddd int not null,
    numero int null,
    codigo_cliente int not null,
    primary key(codigo),
    foreign key(codigo_cliente) references cliente(codigo)
);
describe telefone;