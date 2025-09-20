/*
===============================================================================
Ranking Analysis
===============================================================================
Purpose:
    - To rank items (e.g., products, customers) based on performance or other metrics.
    - To identify top performers or laggards.

SQL Functions Used:
    - Window Ranking Functions: RANK(), DENSE_RANK(), ROW_NUMBER(), TOP
    - Clauses: GROUP BY, ORDER BY
===============================================================================
*/

-- Cumulative analysis
-- Aggregate the data progressively over time
-- Helps to understand whether our business is growing or declining


-- Calculate the total sales per month
-- and the running total of sales over time

SELECT
	order_date,
	total_sales,
	SUM(total_sales) OVER (PARTITION BY order_date ORDER BY order_date) AS running_total_sales,
	AVG(avg_price) OVER (PARTITION BY order_date ORDER BY order_date) AS moving_avg_price
FROM
(
	SELECT
		DATETRUNC(month, order_date) AS order_date,
		SUM(sales_amount) AS total_sales,
		AVG(price) AS avg_price
	FROM gold.fact_sales
	WHERE order_date IS NOT NULL
	GROUP BY DATETRUNC(month, order_date)

) t;
