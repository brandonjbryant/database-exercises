#1. Using the example from the lesson, re-create the employees_with_departments table.
USE easley_1267;

CREATE TEMPORARY TABLE employees_with_departments_copy (select *
from employees.employees_with_departments);

SELECT * 
from employees_with_departments_copy;#verify

#a. Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns
ALTER TABLE ADD full_name VARCHAR(30);

#b. Update the table so that full name column contains the correct data
UPDATE employees_with_departments_copy
SET full_name = CONCAT(first_name,' ',last_name); 

#c. Remove the first_name and last_name columns from the table.
ALTER TABLE employees_with_departments_copy DROP COLUMN first_name;
ALTER TABLE employees_with_departments_copy DROP COLUMN last_name;



#d. What is another way you could have ended up with this same table?
DROP TEMPORARY TABLE employees_with_departments_copy;

CREATE TEMPORARY TABLE employees_with_departments_copy (SELECT emp_no, dept_no, dept_name, 	CONCAT(first_name,' ',last_name) AS full_name
FROM employees.employees_with_departments);

SELECT *
FROM employees_with_departments_copy;

#2. Create a temporary table based on the payment table from the sakila database.Write the SQL necessary to transform the amount column such that it is stored as an integer representing the number of cents of the payment. For example, 1.99 should become 199.
CREATE TEMPORARY TABLE sakila_payments (SELECT * 
	from sakila.payment);

SELECT *
FROM sakila_payments;

ALTER TABLE sakila_payments ADD new_amount INT;


UPDATE sakila_payments 
SET new_amount = amount * 100;

SELECT * 
FROM sakila_payments;





#3. Find out how the current average pay in each department compares to the overall, historical average pay. In order to make the comparison easier, you should use the Z-score for salaries. In terms of salary, what is the best department right now to work for? The worst?


























#temp table for single value used later in z-score calc
create temporary table historical_avg_salary (select avg(salary) 
from employees.salaries); #$63810.7448

#sanity check
select *
from historical_avg_salary;

#temp table with dept_name and avg_salary grouped by dept_name
create temporary table department_avg_salary (select dept_name, avg(salary) as avg_salary
from employees.salaries
join employees.dept_emp using (emp_no)
join employees.departments using (dept_no)
where employees.salaries.to_date > curdate()
group by dept_name
ORDER BY avg_salary Desc);

#sanity check
select * 
from department_avg_salary;


#added z-score column using z=(x-u)/stddev
select *, round(
				(avg_salary - (select * from historical_avg_salary))
			                         /
				(select stddev(salary)from employees.salaries)
				
				,3) as z_score
				
from department_avg_salary;
					
/*					Current
Dept_name			Avg_salary  Z-score
Sales				88842.1590	 1.481
Marketing			80014.6861	 0.959
Finance				78644.9069	 0.878
Research			67932.7147	 0.244
Production			67841.9487	 0.238
Development			67665.6241	 0.228
Customer Service	66971.3536	 0.187
Quality Management	65382.0637	 0.093
Human Resources		63795.0217	-0.001
*/

#Sales department is best currently with an average salary 1.48 standard deviations above the historical mean salary for the entire company and HR is the worst which is slightly below the historical mean salary.
