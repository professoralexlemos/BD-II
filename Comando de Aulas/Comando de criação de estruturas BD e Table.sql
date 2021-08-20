Comando para conectar com o MySQL
mysql -u root -p

Comando para exibir os Banco de Dados
show databases;

Comando para criar um Bancos de Dados
create database pessoa;

Comando para selecionar o Banco de Dados
use pessoa;

Comando para exibir as tabelas
show tables;

Comando para criação de tabela
create table Pessoa(
	id int not null,
	nome varchar(50) not null,
	cpf varchar(11) not null,
	dt_nascimento date not null,
	primary key (id)
);

Comando para ver a estrutura da tabela
describe pessoa;

Comando para excluir a tabela
drop table pessoa;




