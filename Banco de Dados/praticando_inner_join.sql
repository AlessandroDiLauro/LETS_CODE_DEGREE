---Praticando INNER JOIN 

---1 
SELECT o.order_id, ROUND((SUM((dt.unit_price * dt.quantity)* (1- dt.discount)) + o.freight)::numeric,2) AS order_total
FROM order_details AS dt
INNER JOIN orders AS o ON dt.order_id = o.order_id
GROUP BY 1
ORDER BY 2 DESC


---2
SELECT cus.contact_name, COUNT(o.order_id)
FROM customers AS cus
INNER JOIN orders AS o ON cus.customer_id = o.customer_id
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10

---3 
SELECT o.order_id, ROUND((SUM((dt.unit_price * dt. quantity) * (1- discount))+ o.freight)::numeric,2) AS "VALOR_TOTAL", 
       cust.contact_name, o.freight
FROM orders AS o 
INNER JOIN order_details AS dt ON o.order_id = dt.order_id
INNER JOIN customers AS cust ON o.customer_id = cust.customer_id
GROUP BY 3,1,4
ORDER BY 2 DESC


---4 
---volor total de cada order_id pra cada customer (830 rows) #Não precisa AVG freight
SELECT o.order_id, cust.contact_name, ROUND((SUM((dt.unit_price * dt. quantity) * (1- discount))+ o.freight)::numeric,2) AS "VALOR_TOTAL_ORD",
       cust.country
FROM orders AS o 
INNER JOIN order_details AS dt ON o.order_id = dt.order_id
INNER JOIN customers AS cust ON o.customer_id = cust.customer_id
GROUP BY 1,2,4
ORDER BY 3 DESC



---valor de cada order_detail(2155 rows) 
SELECT dt.order_id, cust.contact_name, ROUND(((dt.unit_price * dt. quantity) * (1- discount))::numeric,2) AS "VALOR_TOTAL_ORD",
       cust.country
FROM orders AS o 
INNER JOIN order_details AS dt ON o.order_id = dt.order_id
INNER JOIN customers AS cust ON o.customer_id = cust.customer_id
ORDER BY 3 DESC


---valor total de todas as compras (de todos os order_id) de cada customer 
---#Precisa SUM(DISTINCT o.freight) (89 rows)
SELECT cust.contact_name, ROUND((SUM((dt.unit_price * dt. quantity) * (1- discount))+ SUM(DISTINCT o.freight))::numeric,2) AS "VALOR_TOTAL",
       cust.country
FROM orders AS o 
INNER JOIN order_details AS dt ON o.order_id = dt.order_id
INNER JOIN customers AS cust ON o.customer_id = cust.customer_id
GROUP BY 1,3
ORDER BY 2  


--- 5 paises total compras
SELECT  ROUND(SUM(dt.unit_price * dt. quantity)::numeric,2) AS "TOTAL", cust.country
FROM orders AS o 
INNER JOIN order_details AS dt ON o.order_id = dt.order_id
INNER JOIN customers AS cust ON o.customer_id = cust.customer_id
GROUP BY 2
ORDER BY 1 DESC

SELECT DISTINCT country FROM customers

---6
---Order By media_valor_total
SELECT COUNT(ord.order_id) AS vendas,  ROUND((AVG(((det.unit_price * det.quantity)
			* (1- det.discount))))::numeric,2) "MEAN", TO_CHAR(ord.order_date,'YYYYMM') 
			AS mes_pedidos
FROM order_details AS det
INNER JOIN orders AS ord ON det.order_id = ord.order_id
GROUP BY 3
ORDER BY 2 DESC

---Order By vendas_totais 
SELECT COUNT(ord.order_id) AS vendas,  ROUND((AVG(((det.unit_price * det.quantity)* 
			(1- det.discount))))::numeric,2) "MEAN", TO_CHAR(ord.order_date,'YYYYMM') 
			AS mes_pedidos
FROM order_details AS det
INNER JOIN orders AS ord ON det.order_id = ord.order_id
GROUP BY 3
ORDER BY 1 DESC


--- testar par ex 4 total compras para cada cliente
SELECT 
  m.date, 
  m.home_goal, 
  m.away_goal
FROM match AS m
WHERE (home_goal + away_goal) > 
  (SELECT AVG(m1.home_goal + m1.away_goal) * 3
   FROM match AS m1
   WHERE m.
 = 
)
LIMIT 3;
date
2012-12-09
2013-01-19
2008-10-29
home_goal
1
2
4
away_goal
7
6
4
Fill in the blanks



