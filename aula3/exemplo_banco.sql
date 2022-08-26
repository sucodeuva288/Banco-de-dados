CREATE TABLE agencia
(
   numero_banco INT PRIMARY KEY,
   numero_agencia INT NOT NULL,
   banco_nome VARCHAR(40) NOT NULL
);

CREATE TABLE conta
(
   numero_conta INT PRIMARY KEY,
   saldo NUMERIC,
   titular VARCHAR(40) NOT NULL,
   numero_banco INT, FOREIGN KEY(numero_banco)
	                   REFERENCES agencia(numero_banco)
	                   ON UPDATE CASCADE
	                   ON DELETE CASCADE
);

INSERT INTO agencia(numero_banco,numero_agencia,banco_nome)
  VALUES (5555,123,'BRADESCO'),
         (4444,456,'ITAU'),
		 (9999,789,'NUBANK');
		 
INSERT INTO conta(numero_conta,saldo,titular,numero_banco)
  VALUES (11111,5432,'JOÃO',5555),
         (22222,6000,'ANA',9999);

DELETE FROM agencia WHERE numero_banco = 5555

SELECT * FROM conta;

  
SELECT * FROM setor;
SELECT * FROM empregado;


SELECT * FROM agencia ORDER BY numero_banco DESC LIMIT 3;

SELECT * FROM conta WHERE saldo in (320, 321);

SELECT c.titular,c.saldo,c.numero_conta, a.banco_nome FROM conta AS c, agencia AS a
WHERE c.numero_banco = a.numero_banco ORDER BY a.banco_nome DESC;