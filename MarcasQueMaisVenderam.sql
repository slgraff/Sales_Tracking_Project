-- Marcas que mais venderam no mês
-- Colunas: marca, vendas (#)

SELECT
	pro.brand AS marca,
	count(fun.paid_date) AS "vendas (#)"

FROM sales.funnel AS fun
LEFT JOIN sales.products AS pro
	ON fun.product_id = pro.product_id
WHERE paid_date BETWEEN '2021-08-01' AND '2021-08-31'
GROUP BY marca
ORDER BY "vendas (#)" desc
LIMIT 5