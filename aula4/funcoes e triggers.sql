DROP TRIGGER empregado_trigger_log

CREATE TABLE empregado 
(
    id_empregado SERIAL PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	email VARCHAR(40) NOT NULL UNIQUE,
	CARGO VARCHAR(50),
	salario NUMERIC
	
);

INSERT INTO empregado (nome,email,cargo,salario)
  
  VALUES ('Adriana','ciclano@teste.com', 'Programador', 5000),
         ('Antonio', 'silva@gmail.com', 'Analista de Sistema', 6500);
		 
CREATE TABLE empregado_log
(
    id_empregado_log SERIAL PRIMARY KEY,
	id_empregado INT,
	nome VARCHAR(50),
	email VARCHAR(40),
	cargo VARCHAR(50),
	salario NUMERIC,
	data_modificacao TIMESTAMP,
	acao VARCHAR(20)	
);

create or replace function empregado_log_fun()
returns trigger as $$
begin 
	insert into empregado_log(id_empregado,nome,salario,data_modificacao,acao)	
			values(new.id_empregado,new.nome,new.salario,now(),'update');
return new;		
end;
$$
language 'plpgsql';

create trigger empregado_trigger_log
after update 
on empregado 
for each row 
execute procedure empregado_log_fun();

update empregado 
set nome ='Ana Luiza',salario=6800 
where id_empregado = 1;


create or replace function empregado_log_fun_delete()
returns trigger as $$
begin 
	insert into empregado_log(id_empregado,nome,salario,data_modificacao,acao)	
			values(old.id_empregado,old.nome,old.salario,now(),'delete');
return new;		
end;
$$
language 'plpgsql';

create trigger empregado_trigger_log_delete
after delete
on empregado 
for each row 
execute procedure empregado_log_fun_delete();

DELETE FROM empregado WHERE id_empregado = 1;

SELECT * FROM empregado_log