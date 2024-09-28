"📝 Question 6: 
"you are a data analyst tasked with identifying key customers for a targeted marketing campaign. Your objective is to determine the top 3 customers based on their average purchase amounts (round the decimals to two points), considering only those customers who have engaged in frequent transactions (at least 5 purchases).

Solution 6: (
Select 
Customer_name, round(avg(amount),2) as Avg_purchase
from customers c
join customer_transactions s
on c.customer_id = s.customer_id
group by Customer_name
HAVING COUNT(*) >= 5
ORDER BY avg_purchase DESC
LIMIT 3;
)
"This query retrieves the top 3 customers with the highest average purchase amount, considering only those who made at least 5 transactions.
- It selects the Customer_name and the average transaction amount (AVG(amount)), rounded to two decimal places.
- The JOIN links the customers and customer_transactions tables based on customer_id.
- The GROUP BY Customer_name ensures the calculation is done per customer.
- The HAVING COUNT(*) >= 5 filters for customers with 5 or more transactions.
- Finally, the results are ordered by average purchase (avg_purchase DESC), and the top 3 are displayed."

