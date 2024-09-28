📝 Question 10: 
" You are tasked with identifying the unique product counts for each segment and sorting them in descending order of product counts."

Solution 10: (
select segment , count(*) as number
from
dim_product
group by segment
order by number desc
)
