📝 Question 13: 
"""Imagine you are a data analyst at Atliq Exclusive. Your task is to identify the top 3 products in each division with the highest total sold quantities for the fiscal year 2021. This analysis is crucial for understanding product performance across divisions, facilitating informed decision-making."""

Solution 13: 
WITH division_rank AS (
 SELECT 
 p.division,
 f.product_code,
 p.product,
 SUM(f.sold_quantity) AS sold_quantity,
 RANK() OVER (PARTITION BY p.division ORDER BY SUM(f.sold_quantity) DESC) AS rank_order
 FROM 
 fact_sales_monthly f
 JOIN 
 dim_product p ON f.product_code = p.product_code
 WHERE 
 fiscal_year = 2021
 GROUP BY 
 p.division, f.product_code, p.product
)

SELECT 
 division,
 product_code,
 product,
 sold_quantity,
 rank_order
FROM 
 division_rank
WHERE 
 rank_order <= 3;

"""This query ranks the top 3 best-selling products in each division for the year 2021.

- In the division_rank CTE, it calculates the total sold quantity of each product per division, assigning a rank to each product using the RANK() function, ordered by sold quantity in descending order (PARTITION BY p.division).
- The main query retrieves the division, product details, sold quantity, and rank from the CTE.
- The WHERE rank_order <= 3 filter limits the result to the top 3 products in each division.

This query helps identify the highest-selling products across divisions for the specified year."""
 