#Create a new file named group_by_exercises.sql
USE employees;
#In your script, use DISTINCT to find the unique titles in the titles table. How many unique titles have there ever been? Answer that in a comment in your SQL file.(7 Titles)
	SELECT DISTINCT title
	FROM titles;
 
#Write a query to to find a list of all unique last names of all employees that start and end with 'E' using GROUP BY.
	SELECT last_name
	FROM employees
	WHERE last_name LIKE 'E%E'
	GROUP BY Last_Name;

#Write a query to to find all unique combinations of first and last names of all employees whose last names start and end with 'E'.(846)
	SELECT first_name, last_name
	FROM employees 
	WHERE last_name LIKE 'E%E'
	GROUP BY first_name, last_name;

#Write a query to find the unique last names with a 'q' but not 'qu'. Include those names in a comment in your sql code.
#Chleq
#Lindqvist
#Qiwen
	SELECT last_name
	FROM employees 
	WHERE last_name LIKE '%q%'
	AND  last_name NOT LIKE '%QU%'
	GROUP BY last_name;
	
#Add a COUNT() to your results (the query above) and use ORDER BY to make it easier to find employees whose unusual name is shared with others.
	SELECT last_name, COUNT(*)
	FROM employees 
	WHERE last_name LIKE '%q%'
	AND NOT last_name LIKE '%QU%'
	GROUP BY last_name 
    ORDER BY COUNT(*);
	 

#Find all all employees with first names 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names.
		SELECT
	gender,
	COUNT(first_name) AS number_of_employees,
	first_name
FROM employees
WHERE first_name IN('Irena', 'Vidya', 'Maya')
GROUP BY gender, first_name
ORDER BY first_name;
/*
M	144	Irena
F	97	Irena
M	146	Maya
F	90	Maya
F	81	Vidya
M	151	Vidya
*/


#Using your query that generates a username for all of the employees, generate a count employees for each unique username. Are there any duplicate usernames? BONUS: How many duplicate usernames are there?
	SELECT 
		LOWER(
				CONCAT(
					SUBSTR(first_name, 1, 1),
					SUBSTR(last_name, 1, 4),
					'_',
					SUBSTR(birth_date, 6, 2),
					SUBSTR(birth_date, 3, 2)
					)
				) AS username,
		COUNT(*) AS number_of_duplicates
	FROM employees
	GROUP BY username
	HAVING number_of_duplicates > 1;
