Comando para acessar o MySQL
mysql -u root -p

Comando listar os banco de dados
show databases;

Comando para selecionar o banco de dados
use cliente;

Comando listar as tabelas
show tables;

Comando para ver a estrutura interna da tabela
describe cliente;

Comando para criação de banco de dados
create database nota_fiscal;

[
    nota nota fiscal
    numero int PK not null
    data_emissao date not null
    valor_total double not null
    peso double not null
    volume double not null
]

create table nota_fiscal(
    numero int not null,
    data_emissao date not null,
    valor_total double not null,
    peso double not null,
    volume double not null,
    primary key(numero)
);

produto
[
    codigo int PK not null,
    descricao varchar(50) not null,
    preço double not null,
    desconto double null,
    data_validade date null
]

create table produto(
    codigo    int         not null,
    descricao varchar(50) not null,
    preco     double      not null,
    desconto  double      null,
    data_validade date    null,
    primary key(codigo) 
);

item[
    numero_nota_fiscal
    codigo_produto
    qtd
    valor_unitario
]

create table item(
    codigo int not null,
    numero_nota_fiscal int    not null,
    codigo_produto     int    not null,
    quantidade         int    not null,
    valor_unitario     double not null,
    primary key(codigo),
    foreign key(numero_nota_fiscal) references nota_fiscal(numero),
    foreign key(codigo_produto) references produto(codigo)
);


nota_fiscal[N] <----[possui]---->  [N]produto

                     item[
                         numero_nota_fiscal
                         codigo_produto
                         qtd
                         valor_unitario
                     ]

Estrutura                       Dados (informação)
CREATE [CRIÇÃO]                 INSERT [CADASTRAR]
DROP   [APAGAR]                 DELETE [APAGAR]
ALTER  [ALTERAÇÃO]              UPDATE [ALTERAR]
                                SELECT [PESQUISAR]