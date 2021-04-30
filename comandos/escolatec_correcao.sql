1.	Desenvolva o comando necessário para criação do banco de dados escolatec.
CREATE DATABASE ESCOLATEC;

2.	Desenvolva os comandos necessários para criação das tabelas do modelo de dados escolatec (curso, aula, turma, aluno, turma_componente e componente).
USE ESCOLATEC;

CREATE TABLE CURSO(
   ID_CURSO        INT         NOT NULL,
   NOME_CURSO      VARCHAR(50) NOT NULL,
   DATA_CADASTRO   DATE        NOT NULL,
   VALOR_INSCRICAO DOUBLE      NOT NULL,
   VALOR_MATRICULA DOUBLE      NOT NULL,
   VALOR_DESCONTO  DOUBLE      NOT NULL,
   PRIMARY KEY(ID_CURSO)
);
DESC CURSO;

CREATE TABLE COMPONENTE(
   ID_COMPONENTE   INT         NOT NULL,
   NOME_COMPONENTE VARCHAR(50) NOT NULL,
   PRIMARY KEY(ID_COMPONENTE)
);
DESC COMPONENTE;

CREATE TABLE TURMA(
   ID_TURMA   INT         NOT NULL,
   NOME_TURMA VARCHAR(50) NOT NULL,
   ID_CURSO   INT         NOT NULL,
   PRIMARY KEY(ID_TURMA),
   FOREIGN KEY(ID_CURSO) REFERENCES CURSO(ID_CURSO)
);
DESC TURMA;

CREATE TABLE ALUNO(
   ID_ALUNO   INT         NOT NULL,
   NOME_ALUNO VARCHAR(50) NOT NULL,
   ID_CURSO   INT         NOT NULL,
   PRIMARY KEY(ID_ALUNO),
   FOREIGN KEY(ID_CURSO) REFERENCES CURSO(ID_CURSO)
);
DESC ALUNO;

CREATE TABLE AULA(
   ID_AULA   INT    NOT NULL,
   DATA_AULA DATE   NOT NULL,
   QTD_AULA  DOUBLE NOT NULL,
   QTD_ALUNO DOUBLE NOT NULL,
   ID_TURMA  INT    NOT NULL,
   PRIMARY KEY(ID_AULA),
   FOREIGN KEY(ID_TURMA) REFERENCES TURMA(ID_TURMA)
);
DESC TURMA;

CREATE TABLE TURMA_COMPONENTE(
   ID_TURMA      INT NOT NULL,
   ID_COMPONENTE INT NOT NULL,
   PRIMARY KEY(ID_TURMA, ID_COMPONENTE),
   FOREIGN KEY(ID_TURMA) REFERENCES TURMA(ID_TURMA),
   FOREIGN KEY(ID_COMPONENTE) REFERENCES COMPONENTE(ID_COMPONENTE)
);
DESC TURMA_COMPONENTE;

SHOW TABLES;

5.	Desenvolva o comando necessário para adicionar o campo data_nascimento date not null na tabela aluno.
ALTER TABLE ALUNO ADD COLUMN DATA_NASCIMENTO DATE NOT NULL;

6.	Desenvolva o comando necessário para alterar o campo nome_aluno para um varchar(100).
ALTER TABLE ALUNO MODIFY NOME_ALUNO VARCHAR(100) NOT NULL;

7.	Desenvolva os comandos necessários para cadastrar 2 registros nas tabelas do modelo de dados escolatec (curso, aula, turma, aluno, turma_componente e componente).
# dados da tabela curso
INSERT INTO curso(ID_CURSO,NOME_CURSO,DATA_CADASTRO,VALOR_INSCRICAO,VALOR_MATRICULA,VALOR_DESCONTO) VALUES (1, 'Desenvolvimento de Sistemas', '20210429', 100.50, 0, 0);
INSERT INTO curso(ID_CURSO,NOME_CURSO,DATA_CADASTRO,VALOR_INSCRICAO,VALOR_MATRICULA,VALOR_DESCONTO) VALUES (2, 'Engenharia de Dados', '20210429', 0, 150, 0);          

# dados da tabela aluno
INSERT INTO aluno(ID_ALUNO,NOME_ALUNO,ID_CURSO,DATA_NASCIMENTO) VALUES(1, 'Alex Sandro', 1, '1978/03/30');
INSERT INTO aluno(ID_ALUNO,NOME_ALUNO,ID_CURSO,DATA_NASCIMENTO) VALUES(2, 'Ricardo Costa', 2, '1980/03/01');

# dados da tabela turma
INSERT INTO turma(id_turma, nome_turma, id_curso) VALUES (1, '1 Modulo', 1);
INSERT INTO turma(id_turma, nome_turma, id_curso) VALUES (2, '1 Modulo', 2);

# dados da tabela aula
INSERT INTO aula(ID_AULA,DATA_AULA,QTD_AULA,QTD_ALUNO,ID_TURMA) VALUES(1, '2021/04/29', 5, 20, 1);
INSERT INTO aula(ID_AULA,DATA_AULA,QTD_AULA,QTD_ALUNO,ID_TURMA) VALUES(2, '2021/04/29', 3, 30, 2);

# dados da tabela componente
INSERT INTO componente(id_componente, nome_componente) VALUES(1, 'Banco de Dados I');
INSERT INTO componente(id_componente, nome_componente) VALUES(2, 'Banco de Dados Avançado');

# dados da tabela turma_componente
INSERT INTO turma_componente(id_turma, id_componente) VALUES(1,1);
INSERT INTO turma_componente(id_turma, id_componente) VALUES(2,2);

8.	Desenvolva o comando necessário para alterar um campo(de sua escolha) de um registro na aula.
UPDATE aula SET qtd_aula = 5, qtd_aluno = 20 WHERE id_aula = 2;

9.	Desenvolva o comando necessário para alterar dois campos(valor_inscricao e valor_desconto) de um registro na curso.
UPDATE curso SET valor_inscricao = 0, valor_desconto = 100 WHERE id_curso = 1;

10.	Desenvolva o comando necessário para remover um registro na curso.
DELETE FROM turma_componente WHRE id_turma = 2;
DELETE FROM aula WHERE id_turma  = 2;
DELETE FROM turma WHERE id_curso = 2
DELETE FROM aluno WHERE id_curso = 2;
DELETE FROM curso WHERE id_curso = 2;