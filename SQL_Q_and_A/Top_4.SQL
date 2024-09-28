📝 Question 4: 
"As a data analyst preparing inventory analysis for a retail company, you're tasked with identifying products in the inventory that have never been sold. This information is critical for making decisions about discontinuing products or initiating promotions."

Solution 4:( 
select p.product_name 
from products p
left join product_sales s
on p.product_id = s.product_id
where s.sale_id is null
group by  p.product_name
) 

"This query retrieves the names of products that have not been sold.
- It uses a LEFT JOIN to combine the products table (p) with the product_sales table (s), matching rows based on product_id.
- The WHERE s.sale_id IS NULL condition filters for products where no matching sale entry exists in product_sales, meaning these products have never been sold.
- The GROUP BY p.product_name ensures each product is listed only once."