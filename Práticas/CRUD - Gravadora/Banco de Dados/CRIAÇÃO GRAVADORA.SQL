DROP DATABASE IF EXISTS gravadora;

CREATE DATABASE gravadora;

USE gravadora;


CREATE TABLE gravadora (
       codigo_gravadora     INT         NOT NULL,
       nome_gravadora       VARCHAR(60) NOT NULL,
       endereco_gravadora   VARCHAR(60) NULL,
       telefone_gravadora   VARCHAR(20) NULL,
       contato_gravadora    VARCHAR(20) NULL,
       url_gravadora        VARCHAR(80) NULL);


ALTER TABLE gravadora
       ADD  ( CONSTRAINT xpkgravadora PRIMARY KEY (codigo_gravadora) );


CREATE TABLE cd (
       codigo_cd            INT           NOT NULL,
       codigo_gravadora     INT           NOT NULL,
       nome_cd              VARCHAR(60)   NOT NULL,
       preco_venda_cd       NUMERIC(14,2) NULL,
       data_lancamento_cd   DATE          NULL,
       cd_indicado          INT           NULL);

CREATE INDEX xif6cd ON cd
(
       codigo_gravadora
);


ALTER TABLE cd
       ADD  ( CONSTRAINT xpkcd PRIMARY KEY (codigo_cd) );


CREATE TABLE musica (
       codigo_musica        INT          NOT NULL,
       nome_musica          VARCHAR(60)  NOT NULL,
       duracao_musica       TIME         NULL);


ALTER TABLE musica
       ADD  ( CONSTRAINT xpkmusica PRIMARY KEY (codigo_musica) );


CREATE TABLE autor (
       codigo_autor         INT         NOT NULL,
       nome_autor           VARCHAR(60) NOT NULL);


ALTER TABLE autor
       ADD  ( CONSTRAINT xpkautor PRIMARY KEY (codigo_autor) );


CREATE TABLE musica_autor (
       codigo_musica        INT NOT NULL,
       codigo_autor         INT NOT NULL);

CREATE INDEX xif11musica_autor on musica_autor
(
       codigo_musica
);

CREATE INDEX xif12musica_autor on musica_autor
(
       codigo_autor
);


ALTER TABLE musica_autor
       ADD  ( CONSTRAINT xpkmusica_autor PRIMARY KEY (codigo_musica, 
              codigo_autor) );


CREATE TABLE faixa (
       codigo_musica        int NOT NULL,
       codigo_cd            int NOT NULL,
       numero_faixa         int NOT NULL);

CREATE INDEX xif13faixa ON faixa
(
       codigo_musica
);

CREATE INDEX xif14faixa ON faixa
(
       codigo_cd
);


ALTER TABLE faixa
       ADD  ( CONSTRAINT xpkfaixa PRIMARY KEY (codigo_musica, 
              codigo_cd) );


CREATE TABLE cd_categoria(
       codigo_categoria   INT           NOT NULL,
       menor_preco        NUMERIC(14,2) NOT NULL,
       maior_preco        NUMERIC(14,2) NOT NULL,
       codigo_cd          INT           NOT NULL);


ALTER TABLE cd_categoria
       ADD  ( CONSTRAINT xpkcd_categoria PRIMARY KEY (codigo_categoria) );


ALTER TABLE cd
       ADD  ( CONSTRAINT gravadora_cd
              foreign key (codigo_gravadora)
                             REFERENCES gravadora (codigo_gravadora));

ALTER TABLE cd_categoria
       ADD  ( CONSTRAINT cd_categoria_cd
              foreign key (codigo_cd)
                             REFERENCES cd (codigo_cd));

ALTER TABLE musica_autor
       ADD  ( CONSTRAINT autor_musica_autor
              foreign key (codigo_autor)
                             REFERENCES autor (codigo_autor));


ALTER TABLE musica_autor
       ADD  ( CONSTRAINT musica_musica_autor
              foreign key (codigo_musica)
                             REFERENCES musica (codigo_musica));


ALTER TABLE faixa
       ADD  ( CONSTRAINT cd_faixa
              foreign key (codigo_cd)
                             REFERENCES cd (codigo_cd));


ALTER TABLE faixa
       ADD  ( CONSTRAINT musica_faixa
              foreign key (codigo_musica)
                             REFERENCES musica (codigo_musica));
