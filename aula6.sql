CREATE TABLE modelo
(
  cod_modelo SERIAL PRIMARY KEY,
	
    descricao varchar(40),
    preco NUMERIC,
    cod_marca int,
	
	FOREIGN KEY(cod_marca) REFERENCES marca(cod_marca)
	ON UPDATE CASCADE
	ON DELETE CASCADE	
);

insert into modelo (descricao,preco,cod_marca) values('Gol',30000,7);
insert into modelo (descricao,preco,cod_marca) values('HB20',32000,1);
insert into modelo (descricao,preco,cod_marca) values('HB20S',36000,1);
insert into modelo (descricao,preco,cod_marca) values('Cerato',26200,5);
insert into modelo (descricao,preco,cod_marca) values('Ka',23500,2);
insert into modelo (descricao,preco,cod_marca) values('ECO SPORT',5500,2);
insert into modelo (descricao,preco,cod_marca) values('SIENA',45000,6)

SELECT c.nome, p.descricao, p.preco FROM marca c INNER JOIN modelo p
 on c.cod_marca = p.cod_marca
 
SELECT mo.descricao, mo.preco, ma.nome FROM modelo mo, marca ma
WHERE mo.cod_marca = ma.cod_marca

SELECT ROUND(AVG(preco),2) media FROM modelo;

SELECT ROUND(AVG(preco),2) FROM modelo WHERE cod_marca=1

SELECT m.descricao, m.preco FROM modelo m 
WHERE preco >
(

   SELECT ROUND(AVG(preco),2) Media FROM modelo
);

SELECT cod_marca, MIN(preco) FROM modelo GROUP BY cod_marca;

SELECT cod_marca, MIN(preco) FROM modelo GROUP BY cod_marca
HAVING MIN(preco) > 25000;

SELECT * FROM marca WHERE NOT EXISTS
(
SELECT * FROM modelo WHERE modelo.cod_marca = marca.cod_marca
);


SELECT * FROM marca