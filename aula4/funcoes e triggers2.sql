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