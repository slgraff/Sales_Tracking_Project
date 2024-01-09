-- Dias da semana com maior número de visitas ao site
-- Colunas: dia_semana, dia da semana, visitas (#)

SELECT
	extract('dow' FROM visit_page_date) AS dia_semana,
	CASE 
		WHEN extract('dow' FROM visit_page_date)=0 THEN 'domingo'
		WHEN extract('dow' FROM visit_page_date)=1 THEN 'segunda'
		WHEN extract('dow' FROM visit_page_date)=2 THEN 'terça'
		WHEN extract('dow' FROM visit_page_date)=3 THEN 'quarta'
		WHEN extract('dow' FROM visit_page_date)=4 THEN 'quinta'
		WHEN extract('dow' FROM visit_page_date)=5 THEN 'sexta'
		WHEN extract('dow' FROM visit_page_date)=6 THEN 'sábado'
		ELSE NULL END AS "dia da semana",
	count(*) AS "visitas (#)"

FROM sales.funnel
WHERE visit_page_date BETWEEN '2021-08-01' AND '2021-08-31'
GROUP BY dia_semana
ORDER BY dia_semana