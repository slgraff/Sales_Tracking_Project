-- Estados que mais venderam
-- Colunas: país, estado, vendas (#)

SELECT
	'Brazil' AS país
	,cus.state AS estado
	,count(fun.paid_date) AS "vendas (#)"

FROM sales.funnel AS fun
LEFT JOIN sales.customers AS cus
	ON fun.customer_id = cus.customer_id
WHERE paid_date BETWEEN '2021-08-01' AND '2021-08-31'
GROUP BY país, estado
ORDER BY "vendas (#)" DESC
LIMIT 5