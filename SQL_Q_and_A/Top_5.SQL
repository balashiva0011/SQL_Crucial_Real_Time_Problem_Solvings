📝 Question 5: 
"Analyze the payroll of a company to determine how many employees in each department are earning above the average salary. Order the departments in descending order, starting with the highest count of employees and followed by lower counts. This analysis will help in assessing the distribution of salaries and identify departments with significant discrepancies in pay scales."

Solution 5: WITH dept_averages AS (
 SELECT 
 department,
 AVG(salary) AS avg_salary
 FROM 
 employee_salaries
 GROUP BY 
 department
)

SELECT 
 es.department,
 COUNT(es.employee_name) AS number_of_employees
FROM 
 employee_salaries es
JOIN 
 dept_averages da ON es.department = da.department
WHERE 
 es.salary > da.avg_salary
GROUP BY es.department


"This query identifies departments where employees earn above the average salary for that department.
- The CTE (dept_averages) first calculates the average salary (AVG(salary)) for each department from the employee_salaries table.
- The main query then selects departments and counts the number of employees (COUNT(es.employee_name)) whose salary exceeds the department's average salary.
- A JOIN is used to compare each employee's salary to the average salary of their department, and the GROUP BY es.department groups the results by department."