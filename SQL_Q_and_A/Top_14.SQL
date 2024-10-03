📝 Question 14: 
"""As a data analyst, your task is to analyze the gross sales by each sales channel for the fiscal year 2021. Identify the channel with the highest sales and calculate its percentage contribution to the total gross sales, rounding this figure to two decimal places. This detailed insight will aid in strategic planning for the upcoming fiscal year."""

Solution 14:
 WITH sales_summary AS (
 SELECT 
 c.channel,
 SUM(f.sold_quantity * g.gross_price) AS gross_sales
 FROM 
 dim_customer c
 JOIN fact_sales_monthly f ON f.customer_code = c.customer_code
 JOIN fact_gross_price g ON g.product_code = f.product_code
 WHERE 
 f.fiscal_year = 2021
 GROUP BY 
 c.channel
)

SELECT 
 channel,
 ROUND(gross_sales / 1000000, 2) AS gross_sales_mln,
 ROUND((gross_sales * 100) / SUM(gross_sales) OVER(), 2) AS percentage
FROM 
 sales_summary
ORDER BY 
 gross_sales DESC;

"""This query calculates the gross sales and percentage contribution of each sales channel for the fiscal year 2021.

- The sales_summary CTE computes the total gross sales for each channel by multiplying the quantity sold (f.sold_quantity) with the gross price (g.gross_price), grouped by the sales channel.
- In the main query, it selects each channel and displays the gross sales in millions (gross_sales_mln), along with the percentage contribution of each channel to the total gross sales, using the SUM(gross_sales) OVER() window function.
- The results are then ordered by gross sales in descending order, showing the most significant channels first.

This provides insight into the performance of each sales channel, aiding strategic planning for future sales efforts."""