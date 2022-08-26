CREATE TABLE producao.categoria
(
	codigo_categoria SERIAL PRIMARY KEY,
	
	descricao VARCHAR(30)
)

CREATE TABLE producao.produto
(
	codigo_produto SERIAL PRIMARY KEY,
	
	nome VARCHAR(40) NOT NULL UNIQUE,
	descricao TEXT,
	preco NUMERIC CHECK(preco > 0) NOT NULL,
	quantidade_estoque SMALLINT DEFAULT 0, 
	codigo_categoria INT,
	
	FOREIGN KEY(codigo_categoria) REFERENCES producao.categoria(codigo_categoria)
);

INSERT INTO producao.categoria (descricao) VALUES('Remédio');					
INSERT INTO producao.categoria (descricao) VALUES('Alimentos');
INSERT INTO producao.PRODUTO (nome, descricao, preco, quantidade_estoque,codigo_categoria) 
  VALUES ('Arroz','Tio João',7.5,40,2);
         ('Feijão','Carreteiro',8.5,30,2);
         ('Feijão Fradinho','Granfino',8.5,30,2);
		 
         ('Macarrão','Adria',6.65,10,2);
         ('Farinha de Trigo','Boa Sorte',2.5,8,2);
         ('Sal','Cisne',2.5,100,2);
		 
         ('Atum','Gomes da Costa',6.8,42,2);
         ('Leite Condensado','Nestle',5.9,40,2);
         ('Creme de Leite','Pirancajuba',2.8,15,2);
		 
         ('Arroz Integral','Carreteiro',7.5,4,2);
         ('Neosoro','EMS',17.5,4,1);
		 
SELECT * FROM producao.produto

SELECT descricao, SUM(quantidade_estoque) FROM producao.produto 
  GROUP BY descricao
  ORDER BY descricao;
  
SELECT descricao, COUNT(quantidade_estoque) FROM producao.produto 
  GROUP BY descricao
  HAVING descricao='Carreteiro'
  ORDER BY descricao;
