#--- Create a file named subqueries_exercises.sql and craft queries to return the results for the following criteria:
use employees;
#--- 1. Find all the current employees with the same hire date as employee 101010 using a sub-query.
	SELECT * FROM dept_emp;
	SELECT * 
	FROM employees
	WHERE emp_no = '101010' ;
	
	SELECT first_name , last_name , hire_date
	FROM employees WHERE hire_DATE in(
			SELECT hire_date
			FROM employees 
			WHERE hire_date = '1990-10-22')
			AND to_date > curdate();
#--- 2. Find all the titles ever held by all current employees with the first name Aamod.
	SELECT first_name, last_name, title 
	FROM employees
	WHERE 

#--- 3. How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.

#--- 4. Find all the current department managers that are female. List their names in a comment in your code.

#--- 5. Find all the employees who currently have a higher salary than the companies overall, historical average salary.

#--- 6. How many current salaries are within 1 standard deviation of the current highest salary? (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this?

#--- BONUS

#--- Find all the department names that currently have female managers.

#--- Find the first and last name of the employee with the highest salary.

#--- Find the department name that the employee with the highest salary works in.