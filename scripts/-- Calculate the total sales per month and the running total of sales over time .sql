-- Calculate the total sales per month and the running total of sales over time 

SELECT 
order_date,
total_sales,  
SUM(total_sales) OVER (PARTITION BY order_date ORDER BY order_date) AS running_total,
AVG(avg_price) OVER (ORDER BY avg_price) AS average_running_total
FROM 
(
SELECT 
	DATETRUNC(year,order_date) AS order_date,
	SUM(sales) AS total_sales,
	AVG(price) AS avg_price
FROM gold.fact_sales 
WHERE order_date IS NOT NULL 
GROUP BY DATETRUNC(year,order_date)
)t