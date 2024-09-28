📝 Question 8: 
"Determine the most popular product in each store by identifying which product has the highest sales amount. This query is useful for analyzing product performance and store productivity."

Solution 8: WITH store_product_sales AS (
 SELECT s.store_name, p.product_name, sl.store_id, SUM(sl.quantity * p.price) AS total_sales
 FROM product_sales sl
 JOIN products p ON sl.product_id = p.product_id
 JOIN product_stores s ON sl.store_id = s.store_id
 GROUP BY s.store_name, p.product_name, sl.store_id
),
ranked_products AS (
 SELECT store_name, product_name, total_sales,
 RANK() OVER (PARTITION BY store_id ORDER BY total_sales DESC) AS sales_rank
 FROM store_product_sales
)
SELECT store_name, product_name, total_sales
FROM ranked_products
WHERE sales_rank = 1;
 
"This query identifies the best-selling product for each store based on total sales.

- The store_product_sales CTE calculates the total sales for each product in every store by multiplying the quantity sold (sl.quantity) by the product price (p.price), and groups the data by store and product.
- The ranked_products CTE ranks products within each store (PARTITION BY store_id) by total sales in descending order.
- The final query selects the product with the highest sales (sales_rank = 1) for each store, showing the top-selling product and its total sales in every store."