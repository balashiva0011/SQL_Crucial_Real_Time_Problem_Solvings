📝 Question 2: 
"you are a Data Analyst, tasked with identifying which premium products (priced over $50) are also popular (sold at least 50 units per order). Your objective is to determine the total revenue generated from these products."

Solution2:(
SELECT SUM(total_revenue) AS overall_revenue
FROM (
 SELECT 
 p.product_id,
 p.product_name,
 p.price,
 SUM(S.quantity * p.price) AS total_revenue
 FROM products p
 JOIN product_sales S ON p.product_id = S.product_id
 WHERE p.price > 50 AND S.quantity >= 50
 GROUP BY p.product_id, p.product_name, p.price
) AS revenue_info;
)


"This query calculates the overall revenue from products priced above 50 units, with at least 50 units sold.
- The inner query (`SELECT ...`) calculates the **total revenue** for each product by multiplying the quantity sold (`S.quantity`) with the product's price (`p.price`). It only includes products with a price greater than 50 and a minimum sales quantity of 50.
- The `GROUP BY` groups this data by product to calculate individual product revenues.
- The outer query then sums up these individual revenues (`SUM(total_revenue)`) to provide the **overall revenue** across all qualifying products."
