📝 Question 10: 
" You are tasked with identifying the unique product counts for each segment and sorting them in descending order of product counts."

<<<<<<< HEAD
Solution 10:(
=======
Solution 10: (
>>>>>>> 809c9943ce110d11f888b1c19f2a918f08c63a75
select segment , count(*) as number
from
dim_product
group by segment
order by number desc
)
<<<<<<< HEAD

=======
>>>>>>> 809c9943ce110d11f888b1c19f2a918f08c63a75
