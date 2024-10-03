📝 Question 15: 
"""Imagine you are a data analyst at Atliq Exclusive. You are tasked with determining which segment experienced the greatest increase in unique products from 2020 to 2021. This analysis is crucial for refining marketing strategies and assessing market expansion within the APAC region."""

Solution 15: 
WITH ProductCounts2020 AS (
 SELECT 
 P.segment AS segment,
 COUNT(DISTINCT FS.product_code) AS product_count_2020
 FROM 
 dim_product P
 INNER JOIN fact_sales_monthly FS ON P.product_code = FS.product_code
 WHERE 
 FS.fiscal_year = '2020'
 GROUP BY 
 P.segment
),
ProductCounts2021 AS (
 SELECT 
 P.segment AS segment,
 COUNT(DISTINCT FS.product_code) AS product_count_2021
 FROM 
 dim_product P
 INNER JOIN fact_sales_monthly FS ON P.product_code = FS.product_code
 WHERE 
 FS.fiscal_year = '2021'
 GROUP BY 
 P.segment
)

SELECT 
 pc20.segment,
 pc20.product_count_2020,
 pc21.product_count_2021,
 (pc21.product_count_2021 - pc20.product_count_2020) AS difference
FROM 
 ProductCounts2020 pc20
 INNER JOIN ProductCounts2021 pc21 ON pc20.segment = pc21.segment
ORDER BY 
 difference DESC;

"""This query compares the number of distinct products sold in 2020 and 2021 across different market segments.

- The ProductCounts2020 and ProductCounts2021 CTEs calculate the number of distinct products sold in each segment for the fiscal years 2020 and 2021, respectively.
- The main query then joins the two CTEs based on the product segment and calculates the difference in product count between 2021 and 2020 for each segment.
- The result shows the segment, the product counts for both years, and the difference, ordered by the highest increase in product count (difference DESC).

This analysis helps to identify which segments saw the most growth or decline in product variety between the two years."""