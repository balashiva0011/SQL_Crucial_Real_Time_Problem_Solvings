📝 Question 16: 
"""Imagine you are a data analyst at Atliq Exclusive. Your task is to analyze the monthly gross sales amount for the customer "Atliq Exclusive." This analysis will help identify low and high-performing months, enabling strategic decision-making."""

Solution 16: SELECT 
 MONTH(f.date) AS month,
 MONTHNAME(f.date) AS month_name,
 f.fiscal_year AS fiscal_year,
 CONCAT(ROUND(SUM(g.gross_price * f.sold_quantity) / 1000000, 2), 'M') AS gross_sales_amount
FROM 
 fact_gross_price g
RIGHT JOIN 
 fact_sales_monthly f 
 ON f.product_code = g.product_code 
 AND f.fiscal_year = g.fiscal_year
JOIN 
 dim_customer c 
 ON f.customer_code = c.customer_code
WHERE 
 c.customer = 'Atliq Exclusive'
GROUP BY 
 MONTH(f.date), f.fiscal_year
ORDER BY 
 f.fiscal_year; 

"""This query calculates the monthly gross sales for the customer "Atliq Exclusive" across different fiscal years.

- It joins sales and pricing data from fact_sales_monthly and fact_gross_price, as well as customer information from dim_customer.
- The query computes the total gross sales by multiplying gross_price with sold_quantity, then rounds and formats the result in millions (e.g., 'M').
- It groups the sales data by month and fiscal year, and the results are ordered by fiscal year, showing the monthly gross sales for "Atliq Exclusive."

This provides a clear view of how the customer’s sales performance fluctuates month by month across fiscal years."""