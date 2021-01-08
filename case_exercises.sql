

-- Write a query that returns all employees (emp_no), their department number, their start date, their end date, and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not.

   	
   		use employees;
   		SELECT emp_no, dept_no, hire_date, to_date, 
   			IF(to_date > curdate(), TRUE ,FALSE) AS is_current_employee 
   		FROM employees
   			JOIN dept_emp USING(emp_no);
   		
   		
   		
-- Write a query that returns all employee names (previous and current), and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.
  SELECT first_name, last_name,
  	CASE
  		WHEN substr(last_name, 1, 1)
  			IN ('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H')
  			THEN 'A-H'
  		WHEN substr(last_name,1, 1)
  			IN('I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q')
  			THEN 'I-Q'
  		ELSE 'R-Z'
  	END AS alpha_group
  	FROM employees
  	ORDER BY last_name; 
-- How many employees (current or previous) were born in each decade?

-- BONUS

-- What is the current average salary for each of the following department groups: R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?