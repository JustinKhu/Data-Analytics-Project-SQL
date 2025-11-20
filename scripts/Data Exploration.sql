-- Finding the date of the first and last order
-- How many years of sales are available

SELECT 
MIN(order_date) AS first_order_date,
MAX(order_date) AS last_order_date,
DATEDIFF(YEAR, MIN(order_date), MAX(order_date)) AS order_range
FROM gold.fact_sales


-- Find the youngest and oldest customer 

SELECT 
MIN(birthdate) AS youngest_customer,
DATEDIFF(YEAR, MIN(birthdate), GETDATE()) AS oldest_customer,
MAX(birthdate) AS oldest_customer,
DATEDIFF(YEAR, MAX(birthdate), GETDATE()) AS youngest_customer
FROM gold.dim_customers