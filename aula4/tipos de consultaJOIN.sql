INSERT INTO producao.categoria (descricao) VALUES('Roupas');					
INSERT INTO producao.categoria (descricao) VALUES('Eletrônicos');
INSERT INTO producao.produto (nome, descricao, preco, quantidade_estoque,codigo_categoria) 
  VALUES ('Creme de Leite Fresco','Itambé',2.8,25,null),
         ('Arroz Arbóreo','Princesa',6.5,44,null),
         ('Colírio','EMS',22.5,30,null);

SELECT p.nome, p.descricao, p.preco, c.descricao FROM producao.categoria AS c, producao.produto AS p
  WHERE p.codigo_categoria = c.codigo_categoria;
  
SELECT p.nome, p.descricao, p.preco, c.descricao FROM producao.categoria AS c INNER JOIN producao.produto p
  on c.codigo_categoria = p.codigo_categoria;
  
SELECT p.nome, p.descricao, p.preco, c.descricao FROM producao.categoria AS c LEFT JOIN producao.produto p
  on c.codigo_categoria = p.codigo_categoria;
  
SELECT p.nome, p.descricao, p.preco, c.descricao FROM producao.categoria AS c RIGHT JOIN producao.produto p
  on c.codigo_categoria = p.codigo_categoria;
  
SELECT p.nome, p.descricao, p.preco, c.descricao FROM producao.categoria AS c FULL OUTER JOIN producao.produto p
  on c.codigo_categoria = p.codigo_categoria;
  
SELECT p.nome, p.descricao, p.preco, c.descricao FROM producao.categoria AS FULL JOIN producao.produto p
  on c.codigo_categoria = p.codigo_categoria;
  
CREATE VIEW producao.view_listar_produtos AS SELECT * FROM producao.produto;

CREATE VIEW producao.view_full_join 
  AS SELECT p.nome,p.preco,c.descricao
  FROM producao.categoria c FULL JOIN producao.produto p 
  on c.codigo_categoria = p.codigo_produto;

SELECT * FROM producao.view_listar_produtos

SELECT * FROM producao.view_full_join

SELECT * FROM producao.produto