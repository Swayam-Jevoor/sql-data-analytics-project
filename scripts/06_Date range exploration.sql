/*
===============================================================================
Date Range Exploration 
===============================================================================
Purpose:
    - To determine the temporal boundaries of key data points.
    - To understand the range of historical data.

SQL Functions Used:
    - MIN(), MAX(), DATEDIFF()
===============================================================================
*/


-- Find the date of first and last order
-- How many years of sales are available

SELECT 
	MIN(order_date) AS first_order_date,
	MAX(order_date) AS last_order_date,
	DATEDIFF(year, MIN(order_date), MAX(order_date)) AS order_range_years,
	DATEDIFF(month, MIN(order_date), MAX(order_date)) AS order_range_month
FROM gold.fact_sales;


-- Find the youngest and the oldest customer

SELECT 
	MIN(birth_date) AS oldest_customer,
	DATEDIFF(year, MIN(birth_date), GETDATE()) AS oldest_age,
	MAX(birth_date) AS youngest_customer,
	DATEDIFF(year, MAX(birth_date), GETDATE()) AS youngest_age
FROM gold.dim_customers;

