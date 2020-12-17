#Create a file named where_exercises.sql. Make sure to use the employees database.
	USE employees;
#Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. Enter a comment with the number of records returned.
	SELECT `emp_no`,`first_name`,`last_name`
	FROM employees 
	WHERE first_name IN ('Irena', 'Vidya', 'Maya');
	#Returns 709 Rows


#Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. Enter a comment with the number of records returned. Does it match number of rows from Q2?
	SELECT `emp_no`,`first_name`,`last_name`
	FROM employees 
	WHERE first_name = 'Irena' 
	OR first_name = 'Vidya' 
	OR first_name = 'Maya';
	#709 rows returned

#Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. Enter a comment with the number of records returned.
SELECT *
	FROM employees 
	WHERE (first_name = 'Irena' 
	OR first_name='Vidya' 
	OR first_name ='Maya')
	AND gender = 'M';
	#441 Rows

#Find all current or previous employees whose last name starts with 'E'. Enter a comment with the number of employees whose last name starts with E.
	SELECT * FROM employees WHERE last_name LIKE 'E%';
	#7330 rows


#Find all current or previous employees whose last name starts or ends with 'E'. Enter a comment with the number of employees whose last name starts or ends with E. How many employees have a last name that ends with E, but does not start with E?
SELECT * FROM employees
 WHERE last_name LIKE 'E%'
  OR last_name LIKE  '%E';
  #30723 Rows
  #23393
 

#Find all current or previous employees employees whose last name starts and ends with 'E'. Enter a comment with the number of employees whose last name starts and ends with E. How many employees' last names end with E, regardless of whether they start with E?
	SELECT * FROM employees
	WHERE last_name LIKE 'E%' 
	AND last_name LIKE '%E';
	#899 Rows
	#24292 Rows


#Find all current or previous employees hired in the 90s. Enter a comment with the number of employees returned.
	SELECT * FROM employees
	WHERE hire_date LIKE '199%';
	#135214
	
	
	


#Find all current or previous employees born on Christmas. Enter a comment with the number of employees returned.
SELECT *
FROM employees 
WHERE birth_date LIKE '%-12-25';


#Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment with the number of employees returned.
SELECT *
FROM employees 
WHERE birth_date LIKE '%-12-25'
AND hire_date LIKE '199%';
#362


#Find all current or previous employees with a 'q' in their last name. Enter a comment with the number of records returned.
SELECT *
FROM employees
WHERE last_name LIKE '%q%';
#1873

#Find all current or previous employees with a 'q' in their last name but not 'qu'. How many employees are found?
SELECT *
FROM employees
WHERE last_name LIKE '%q%'
AND NOT last_name LIKE '%qu%';
#547
