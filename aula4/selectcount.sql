SELECT * FROM conta;
INSERT INTO conta(numero_conta,titular,numero_banco)
  values (202022,'MARIA',9999);
  
SELECT COUNT(saldo) FROM conta;

SELECT MAX(saldo) FROM conta;

SELECT MIN(saldo) FROM conta;

SELECT SUM(saldo) AS TOTAL FROM conta;

SELECT AVG(saldo) FROM conta;

SELECT ROUND(AVG(saldo),2) AS MEDIA FROM conta;