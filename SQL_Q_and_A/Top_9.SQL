📝 Question 9: 
" You are tasked with identifying all the markets in the APAC region where the company operates. This information will be used to tailor marketing strategies and evaluate market penetration."

Solution 9: SELECT DISTINCT market
FROM dim_customer
WHERE customer = 'Prashu Exclusive' AND region = 'APAC'

