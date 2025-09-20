-- This is a dimension, as the output shows the values which aren't numericSELECT DISTINCT

category
FROM gold.dim_products;


-- This is a measure
-- because the values in the output are numeric
-- and it makes sense to aggregate those values
SELECT DISTINCT
sales_amount
FROM gold.fact_sales;


-- This is a dimension
SELECT DISTINCT
product_name
FROM gold.dim_products;


-- This is a measure
SELECT DISTINCT
quantity
FROM gold.fact_sales;


-- This is a dimension
SELECT DISTINCT
birthdate
FROM gold.dim_customers;


-- Calculating age from birth date
-- This is a measure
SELECT DISTINCT
DATEDIFF(year, birthdate, GETDATE()) AS Age
FROM gold.dim_customers;


-- This is a dimension
SELECT DISTINCT
customer_id

FROM gold.dim_customers
