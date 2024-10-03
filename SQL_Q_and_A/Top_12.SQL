📝 Question 12: 
"""Imagine you are a data analyst at Atliq Exclusive. Your task is to analyze the quarterly total sold quantities for the fiscal year 2020. This analysis will pinpoint the quarter with the highest total sold quantities, crucial for understanding peak sales periods and informing future inventory and marketing strategies.
Note: The fiscal year at AtliQ starts in September and ends in August."""

Solution 12: SELECT 
 CONCAT('Q', CEILING(month_num / 3)) AS quarter, 
 SUM(sold_quantity) AS total_sold_quantity 
FROM 
 (SELECT 
 MONTH(DATE_ADD(date, INTERVAL 4 MONTH)) AS month_num, 
 fiscal_year, 
 sold_quantity 
 FROM 
 fact_sales_monthly 
 WHERE 
 fiscal_year = 2020
 ) AS sales_data
GROUP BY 
 quarter
ORDER BY 
 total_sold_quantity DESC;

"""This query calculates the total quantity of products sold for each fiscal quarter of 2020.

- It starts by adjusting the date to align with the fiscal calendar using DATE_ADD to shift the month by 4 months. Then, it extracts the month number (MONTH()) and calculates the corresponding fiscal quarter using CONCAT('Q', CEILING(month_num / 3)), grouping months into quarters.

- The query selects the sold_quantity from fact_sales_monthly for the fiscal year 2020 and groups the data by quarter.

- Finally, the total sold quantity is summed (SUM(sold_quantity)) for each quarter and results are ordered by total_sold_quantity in descending order.

This query helps identify which fiscal quarter had the highest sales in 2020."""

