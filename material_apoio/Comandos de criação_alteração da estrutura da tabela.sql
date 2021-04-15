***********************************************************
--Comando para conexão com Banco de Dados
***********************************************************

-----------------------------------------------------------

--Comando para conectar
mysql -u root -p (-u = usuário do banco de dados, -p = senha do banco de dados)

-----------------------------------------------------------

***********************************************************
--Comando para a criação das estruturas em Banco de Dados
***********************************************************

-----------------------------------------------------------

--Comando para criar um banco de dados
create database <nome do banco de dados>;

--Comando para excluir o banco de dados
drop database <nome do banco de dados>

--Comando para ver a estrutura da tabela
describe nome_da_tabela;

--Comando para listar os banco de dados
show databases;

--Comando para listar as tabelas
show tables;

-----------------------------------------------------------

***********************************************************
--Comando para criação de tabela
***********************************************************

-----------------------------------------------------------
--Comando de criação da tabela de exemplo pessoa
CREATE TABLE pessoa (
  cpf      CHAR(11)    NOT NULL,
  nome     VARCHAR(50) NOT NULL,
  idade    INT(11)     NOT NULL,
  endereco VARCHAR(80) NOT NULL,
  rg       CHAR(15)    NOT NULL,
  telefone VARCHAR(15) DEFAULT NULL,
  PRIMARY KEY (cpf)
);
DESCRIBE pessoa;
***********************************************************
--Comando para a alteração das estruturas em Banco de Dados
***********************************************************

-----------------------------------------------------------

--Comando para a alteração do nome da tabela.
alter table <nome_da_tabela> rename to <novo_nome_da_tabela>;
--Exemplo
alter table pessoa rename to pessoas

-----------------------------------------------------------

--comando para a inclusão da primary key na tabela pessoa
alter table <nome_da_tabela> add primary key(<campo>)
--Exemplo
alter table pessoa add primary key(cpf)

--comando para excluir primary key
alter table <nome_da_tabela> drop primary key nome da chave primária
--Exemplo
alter table pessoa drop primary key; 

-----------------------------------------------------------

--Comando para a inclusão de foreign key
alter table t2 add foreign key (codigo_t1) references t1(codigo_t1);

--Comando para excluir uma foreign key
alter table t2 drop foreign key t2_ibfk_1(nome da foreign key )
'information_schema.TABLE_CONSTRAINTS'
'drop index t2_ibfk_1 on t2' -- temos que remover o índice criado automaticamente pelo MySQL

-----------------------------------------------------------

--comando para adicionar uma coluna na tabela
alter table <nome_da_tabela> add column <nome_campo> <tipo_campo> <caracteristica_do_campo>
alter table pessoa add column data_nascimento datetime null

-----------------------------------------------------------

--adiciona como PRIMEIRO campo da tabela
alter table pessoa add column data_nascimento datetime first

-----------------------------------------------------------

--adiciona DEPOIS de um determinado campo
alter table pessoa add column data_nascimento datetime after rg

-----------------------------------------------------------

--comando para excluir uma coluna na tabela pessoa
alter table pessoa drop column data_nascimento

-----------------------------------------------------------

--comando para a alteração do nome e tipo de dado da coluna(para a mudança de tipo de dado precisa alterar o nome com change)
alter table pessoa change idade idadenova int

-----------------------------------------------------------

--comando para a alteração de todas as caracteisticas das colunas
alter table pessoa modify idade int not null

-----------------------------------------------------------