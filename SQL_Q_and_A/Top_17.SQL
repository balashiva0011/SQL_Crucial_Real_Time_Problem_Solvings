📝 Question 17: 
"""You are tasked with identifying the percentage increase in unique products between 2021 and 2020. This information will be used to evaluate product diversification over the years."""

Solution 17: SELECT 
 unique_product_count_2020 AS unique_product_2020, 
 unique_product_count_2021 AS unique_product_2021, 
 ((unique_product_count_2021 - unique_product_count_2020) / unique_product_count_2020 * 100) AS percentage_change
FROM
 (
 SELECT 
 COUNT(DISTINCT product_code) AS unique_product_count_2020
 FROM 
 fact_sales_monthly 
 WHERE 
 fiscal_year = 2020
 ) AS products_2020,
 (
 SELECT 
 COUNT(DISTINCT product_code) AS unique_product_count_2021
 FROM 
 fact_sales_monthly 
 WHERE 
 fiscal_year = 2021
 ) AS products_2021;
 
"""This query calculates the percentage change in the number of unique products sold between 2020 and 2021.

- It retrieves the count of distinct products sold in 2020 and 2021 using two subqueries (products_2020 and products_2021).
- The main query compares the two counts and calculates the percentage change between 2021 and 2020, using the formula: ((unique_product_count_2021 - unique_product_count_2020) / unique_product_count_2020 * 100).
- The result shows the unique product counts for both years and the percentage change.

This query helps assess the growth or decline in product diversity over the two years."""