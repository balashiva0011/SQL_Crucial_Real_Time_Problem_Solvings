📝 Question 1: 
"As a data analyst for a retail chain, you are tasked to find out the total product sold quantity of the store which is located at Bangalore."

Solution1:(
SELECT s.store_name, SUM(sl.quantity) AS total_product_sold
FROM product_stores P
JOIN product_sales S 
ON P.store_id = S.store_id
WHERE s.city = 'Bangalore'
GROUP BY P.store_name;
)


"This SQL query retrieves the total quantity of products sold by each store located in Bangalore.
- It starts by selecting the store name (s.store_name) and the total number of products sold (SUM(S.quantity)).
- The JOIN clause combines data from the product_stores table (P) and the product_sales table (S) based on the matching store_id.
- The WHERE clause filters the data to include only stores in the city of Bangalore.
- Finally, the results are grouped by each store's name (GROUP BY P.store_name), providing the total sales for each store."