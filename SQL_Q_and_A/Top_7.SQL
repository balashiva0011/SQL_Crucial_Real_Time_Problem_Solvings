📝 Question 7: 
"You are a data analyst tasked with understanding customer loyalty at a retail company. You are specifically asked to analyze the second quarter of 2024 to identify the monthly customer retention rates. Your goal is to determine how many customers continue to make purchases month over month during this period."

Solution 7: WITH monthly_purchases AS (
 SELECT
 customer_id,
 EXTRACT(MONTH FROM transaction_date) AS purchase_month,
 EXTRACT(YEAR FROM transaction_date) AS purchase_year
 FROM customer_transactions
 WHERE EXTRACT(YEAR FROM transaction_date) = 2024 AND EXTRACT(MONTH FROM transaction_date) BETWEEN 3 AND 6
),
retained_customers AS (
 SELECT
 a.customer_id,
 a.purchase_month AS current_month,
 b.purchase_month AS previous_month
 FROM monthly_purchases a
 JOIN monthly_purchases b ON a.customer_id = b.customer_id AND a.purchase_month = b.purchase_month + 1
),
retention_rates AS (
 SELECT
 current_month,
 COUNT(DISTINCT customer_id) AS retained_customers
 FROM retained_customers
 GROUP BY current_month
)
SELECT
 CASE
 WHEN current_month = 4 THEN 'April-24'
 WHEN current_month = 5 THEN 'May-24'
 WHEN current_month = 6 THEN 'June-24'
 END AS Month,
 retained_customers
FROM retention_rates
ORDER BY current_month;

"This query tracks customer retention from April to June 2024 by identifying customers who made purchases in consecutive months.

- The monthly_purchases CTE extracts customer purchases by month and year, filtered for transactions between March and June 2024.
- The retained_customers CTE finds customers who made purchases in consecutive months by joining purchases from one month (a.purchase_month) with the previous month (b.purchase_month).
- The retention_rates CTE calculates the number of distinct customers retained from one month to the next, grouping by the current_month.
- The final SELECT maps the months (April, May, June) and displays the number of retained customers for each."
