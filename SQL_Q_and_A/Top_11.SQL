📝 Question 11: 
"""you are a data analyst at Atliq Exclusive. Your task is to identify the products with the highest and lowest manufacturing costs. This information is crucial for optimizing cost-efficiency and pricing strategies across the product line."""

Solution 11: 

SELECT p.product,p.product_code,f.manufacturing_cost 
FROM fact_manufacturing_cost f 
JOIN dim_product p ON f.product_code=p.product_code
WHERE f.manufacturing_cost IN 
(
SELECT MAX(manufacturing_cost) FROM fact_manufacturing_cost
UNION
SELECT MIN(manufacturing_cost) FROM fact_manufacturing_cost
)
ORDER BY f.manufacturing_cost DESC;
 
"""This query retrieves products with either the highest or lowest manufacturing cost.

- It selects the product, product_code, and manufacturing_cost from the fact_manufacturing_cost table, joined with the dim_product table on product_code to get product details.
- The WHERE clause filters the results to include only those products whose manufacturing cost is either the maximum or minimum, determined using a UNION of two subqueries.
- The results are then ordered by manufacturing cost in descending order (ORDER BY f.manufacturing_cost DESC).

This query helps in identifying the products with extreme manufacturing costs (both highest and lowest)."""