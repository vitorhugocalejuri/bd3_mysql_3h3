select * from empregado;
select * from departamento;
select * from dependente;

/*Query com Chaves Estrangeiras*/
select
	e.nome as empregado,
    d.nome as dependente
from
	empregado e,
    dependente d
where 
	e.cod_eno = d.cod_emp;
    
/*Quey com SubQuery*/

select 
	d.*,
    e.nome as empregado,
   (format((datediff(now(), e.dt_nascimento) / 365), 0)) as idade,
      (format((datediff(now(), e.dt_admissao) / 365), 0)) as tempo_empresa
from	
	dependente d,
    empregado e
where
	d.cod_emp in(
    select cod_emp from empregado where (format((datediff(now(), dt_admissao) / 365), 0) <22)	
    )
and
e.cod_emp = d.cod_emp;
    