# comando para pesquisar dados	
SELECT * FROM gravadora;

#Operadores aritmeticos +,-,*,/
SELECT 1 + 1;
SELECT 10 - 5;
SELECT 10 * 10;
SELECT 100 / 10;

# Operadores relacionais <, > <=, >= != <>, =
SELECT codigo_gravadora
     , nome_gravadora
	 , contato_gravadora
	 , endereco_gravadora 
  FROM gravadora
 WHERE codigo_gravadora <> 2;	
 
# Operadores logicos AND, OR, NOT
SELECT *
  FROM gravadora
 WHERE codigo_gravadora > 0
   OR (nome_gravadora = 'EMI' 
	     OR contato_gravadora = 'joãoo' 
		 AND url_gravadora = 'www.emi-music.com.br');  
  
 # operadores de conjunto IN, NOT IN - BETWEEN
 SELECT * 
  FROM gravadora
 WHERE codigo_gravadora IN (1, 4, 3, 2, 1000, 5000); 
 
 SELECT * 
  FROM gravadora
 WHERE codigo_gravadora NOT IN (1, 2, 1000, 5000); 
 
  SELECT * 
  FROM gravadora
 WHERE codigo_gravadora  BETWEEN 1 AND 200; 

# NULL
SELECT *
  FROM gravadora
 WHERE gravadora.endereco_Gravadora is not null;

# Operador LIKE 
 SELECT *
   FROM gravadora
  WHERE gravadora.Nome_Gravadora LIKE '%ale%sandro%';	  