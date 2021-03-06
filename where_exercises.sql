
#Create a file named where_exercises.sql. Make sure to use the employees database.
	USE employees;
#Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. Enter a comment with the number of records returned.
#709
	SELECT *
	FROM employees
	WHERE first_name IN ('Irena', 'Vidya','Maya');

#Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. Enter a comment with the number of records returned. Does it match number of rows from Q2?(709)
#709
	SELECT *
	FROM employees
	WHERE first_name = 'Irena'
	 OR first_name ='Vidya'
	 OR first_name ='Maya';

#Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. Enter a comment with the number of records returned.(441)
	SELECT *
	FROM employees
	WHERE gender = 'M'
	AND (first_name = 'Irena'
     OR first_name = 'Vidya'
     OR first_name = 'Maya');
#Find all current or previous employees whose last name starts with 'E'. Enter a comment with the number of employees whose last name starts with E. (7330)
	select * 
	FROM employees
	WHERE last_name LIKE 'e%';

#Find all current or previous employees whose last name starts or ends with 'E'. Enter a comment with the number of employees whose last name starts or ends with E. How many employees have a last name that ends with E, but does not start with E?(30723/24292)
	SELECT *
	FROM employees
	WHERE LAST_NAME LIKE '%E';

#Find all current or previous employees employees whose last name starts and ends with 'E'. Enter a comment with the number of employees whose last name starts and ends with E. How many employees' last names end with E, regardless of whether they start with E?(899/24292)
	SELECT * 
	FROM employees
	WHERE last_name LIKE '%E';

#Find all current or previous employees hired in the 90s. Enter a comment with the number of employees returned.(135214)
	SELECT *
	FROM employees
	WHERE hire_date LIKE '199%';
#Find all current or previous employees born on Christmas. Enter a comment with the number of employees returned.(842)
	SELECT * 
	FROM employees
	WHERE birth_date LIKE '%-12-25';
#Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment with the number of employees returned.(362)
	SELECT * 
	FROM employees 
	WHERE birth_date LIKE '%-12-25'
	AND hire_date LIKE '199%';
#Find all current or previous employees with a 'q' in their last name. Enter a comment with the number of records returned.(1873)
	SELECT *
	FROM employees 
	WHERE last_name LIKE '%Q%';
	
#Find all current or previous employees with a 'q' in their last name but not 'qu'. How many employees are found?(547)
	SELECT * 
	FROM employees
	WHERE last_name LIKE '%Q%'
	AND NOT last_name LIKE '%QU%';
	