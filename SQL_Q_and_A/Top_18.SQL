📝 Question 18: 
"""Imagine you are a data analyst at Atliq Exclusive. Your task is to identify the top 5 customers in the Indian market who received the highest average pre-invoice discount percentages for the fiscal year 2021. This information is crucial for understanding customer behavior and optimizing discount."""

Solution 18: SELECT 
 c.customer AS customer_name,
 c.customer_code,
 ROUND(AVG(f.pre_invoice_discount_pct),4) AS average_discount_percentage
FROM 
 fact_pre_invoice_deductions f
JOIN 
 dim_customer c 
ON 
 f.customer_code = c.customer_code
WHERE 
 f.fiscal_year = 2021 
 AND c.market = 'India'
GROUP BY 
 c.customer,
 c.customer_code
ORDER BY 
 average_discount_percentage DESC
LIMIT 5;

"""This query calculates the average pre-invoice discount percentage for Indian customers in the fiscal year 2021.

- It joins the fact_pre_invoice_deductions table with the dim_customer table to retrieve customer information.
- The query calculates the average discount percentage (AVG(f.pre_invoice_discount_pct)) for each customer, rounding it to four decimal places.
- It filters the data to include only customers in the Indian market for the fiscal year 2021.
- The results are grouped by customer and sorted by the highest average discount percentage, displaying the top 5 customers.

This query provides insight into which Indian customers received the highest average discounts in 2021."""

