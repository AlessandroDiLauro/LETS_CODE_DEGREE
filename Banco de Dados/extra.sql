SELECT * FROM cadastro
SELECT PRODUTO, COUNT(*)
FROM cadastro
GROUP BY 1
ORDER BY 2 DESC

SELECT TO_CHAR(CAST(referencia AS date), 'YYYYMM') AS mes_pedidos, ROUND(AVG(dias_atraso),2)
FROM atraso
GROUP BY 1
ORDER BY 1;


SELECT produto, ROUND(AVG(dias_atraso),2)
FROM cadastro AS c
LEFT JOIN atraso USING(num_cpf_cnpj)
GROUP BY 1

SELECT num_cpf_cnpj, referencia,
      CASE WHEN dias_atraso = 0 THEN 0
	  ELSE 1
	  END performance
FROM atraso;

SELECT produto, ROUND(AVG(CASE WHEN dias_atraso = 0 THEN 0
	  ELSE 1
	  END),2) AS performance
FROM cadastro AS c
LEFT JOIN atraso USING(num_cpf_cnpj)
GROUP BY 1

SELECT * FROM cadastro


SELECT p.profissao, ROUND(AVG(CASE WHEN dias_atraso = 0 THEN 0
	  ELSE 1
	  END),2) AS performance 
FROM cadastro AS c
LEFT JOIN profissoes AS p ON c.profissao = p.codigo
LEFT JOIN atraso AS a USING(num_cpf_cnpj)
GROUP BY 1
ORDER  by performance DESC;

SELECT r.regiao, ROUND(AVG(CASE WHEN dias_atraso = 0 THEN 0
	  ELSE 1
	  END),2) AS performance
FROM cadastro AS c
LEFT JOIN regioes AS r ON c.estado = r.codigo
LEFT JOIN atraso AS a USING(NUM_CPF_CNPJ)
GROUP BY 1
ORDER BY 2 DESC



select
	A.produto
	,B.uf
	,B.regiao
	,C.profissao
	,to_char(cast(D.referencia as date), 'YYYY') || to_char(cast(D.referencia as date), 'MM') as anomes
	
	,sum(D.dias_atraso)
	,count(*) as qtd
	,sum(case when D.dias_atraso = 0 then 0	else 1	end) as soma_bad_rate
--	,round(avg(case when D.dias_atraso = 0 then 0	else 1	end), 2) as bad_rate
from cadastro as A
left join regioes as B
on A.estado = B.codigo
left join profissoes as C
on A.profissao = C.codigo
left join atraso as D
on A.num_cpf_cnpj = D.num_cpf_cnpj
WHERE dias_atraso IS NOT NULL
group by 1, 2, 3, 4,5;


select
	A.produto
	,B.uf
	,B.regiao
	,C.profissao
	,to_char(cast(D.referencia as date), 'YYYY') || to_char(cast(D.referencia as date), 'MM') as anomes
	
	,sum(D.dias_atraso)
	,count(*) as qtd
	,sum(case when D.dias_atraso = 0 then 0	else 1	end) as soma_bad_rate
--	,round(avg(case when D.dias_atraso = 0 then 0	else 1	end), 2) as bad_rate
from cadastro as A
inner join regioes as B
on A.estado = B.codigo
inner join profissoes as C
on A.profissao = C.codigo
inner join atraso as D
on A.num_cpf_cnpj = D.num_cpf_cnpj

group by 1, 2, 3, 4,5;




SELECT COUNT(*) FROM atraso
WHERE dias_atraso = 0


