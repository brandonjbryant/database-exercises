-- 1. Create a new file named order_by_exercises.sql and copy in the contents of your exercise from the previous lesson.

USE employees;

-- 2. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name. (709 observations)

SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name;

-- a. In your comments, answer: What was the first and last name in the first row of the results? (10397	1955-11-11	Irena	Reutenauer	M	1993-05-21)

-- b. What was the first and last name of the last person in the table? (497788	1958-11-25	Vidya	Simmen	M	1988-03-25)

SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name DESC, emp_no DESC;

-- 3. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and then last name.  (709 observations)

SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name, last_name;

-- a. In your comments, answer: What was the first and last name in the first row of the results? (46986	1964-10-15	Irena	Acton	M	1992-07-11)

-- b. What was the first and last name of the last person in the table? (97971	1956-07-14	Vidya	Zweizig	M	1986-12-22)

SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name DESC, last_name DESC;

-- 4. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by last name and then first name. (709 observations)

SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY last_name, first_name;

-- a. In your comments, answer: What was the first and last name in the first row of the results? (46986	1964-10-15	Irena	Acton	M	1992-07-11)

-- b. What was the first and last name of the last person in the table? (479435	1959-07-10	Maya	Zyda	M	1987-08-23)

SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY last_name DESC, first_name DESC;

-- 5. Write a query to find all employees whose last name starts AND ends with 'E'. Sort the results by their employee number. 

SELECT *
FROM employees
WHERE last_name LIKE "E%E"
ORDER BY emp_no;

-- a. Enter a comment with the number of employees returned, the first employee number and their first and last name... (899 observations), (10021	1960-02-20	Ramzi	Erde	M	1988-02-10) 

-- b. and the last employee number with their first and last name. (499648	1960-09-03	Tadahiro	Erde	F	1992-08-13)

SELECT *
FROM employees
WHERE last_name LIKE "E%E"
ORDER BY emp_no DESC;

-- 6. Write a query to to find all employees whose last name starts AND ends with 'E'. Sort the results by their hire date, so that the newest employees are listed first. 

SELECT *
FROM employees
WHERE last_name LIKE "E%E"
ORDER BY hire_date DESC;

-- a. Enter a comment with the number of employees returned, the name of the newest employee (899 observations) (67892	1958-08-15	Teiji	Eldridge	M	1999-11-27) 

-- b. and the name of the oldest employee. (899 observations)(67892	1958-08-15	Teiji	Eldridge	M	1999-11-27)

SELECT *
FROM employees
WHERE last_name LIKE "E%E"
ORDER BY hire_date;

-- b. interpreted in another way. (40660	1952-02-02	Piyush	Erbe	F	1988-04-04)

SELECT *
FROM employees
WHERE last_name LIKE "E%E"
ORDER BY birth_date;

-- 7. Find all employees hired in the 90s AND born on Christmas. Sort the results so that the oldest employee who was hired last is the first result. 

SELECT *
FROM employees
WHERE hire_date LIKE '199%'
AND birth_date LIKE '%-12-25'
ORDER BY birth_date, hire_date DESC;

-- a. Enter a comment with the number of employees returned, the name of the oldest employee who was hired last (362 observations)(33936	1952-12-25	Khun	Bernini	M	1999-08-31)


-- b. and the name of the youngest emmployee who was hired first. (362 observations)(412745	1964-12-25	Douadi	Pettis	M	1990-05-04)

SELECT *
FROM employees
WHERE hire_date LIKE '199%'
AND birth_date LIKE '%-12-25'
ORDER BY birth_date DESC, hire_date;

#Copy the order by exercise and save it as functions_exercises.sql.
USE employees;
SELESCT database();

SELESCT *
FROM employees
LIMIT 10;

#Write a query to to find all current employees whose last name starts and ends with 'E'. Use concat() to combine their first and last name together as a single column named full_name.
	SELECT concat(first_name, " ", last_name) AS full_name
	FROM employees
	WHERE last_name LIKE "E%E";

	

#Convert the names produced in your last query to all uppercase.
	SELECT UPPER(concat(first_name, " ", last_name)) AS full_name
	FROM employees
	WHERE last_name LIKE "E%E";
	
	

#Find all previous employees hired in the 90s and born on Christmas. Use datediff() function to find how many days they have been working at the company (Hint: You will also need to use NOW() or CURDATE()),
	SELECT `emp_no`,first_name, last_name,
	DATEDIFF(CURDATE(), hire_date) AS days_employed
	FROM employees
	WHERE hire_date LIKE '199%'
	AND birth_date LIKE '%-12-25';
	
	
#Find the smallest and largest current salary from the salaries table.
#Minimum salary: 38623
#Maximum Salary: 158220
DESCRIBE salaries;

SELECT MAX(salary) AS maximum_current_salary,
	   MIN(salary) AS minimum_current_salary
FROM `salaries`;


#Use your knowledge of built in SQL functions to generate a username for all of the current and previous employees. A username should be all lowercase, and consist of the first character of the employees first name, the first 4 characters of the employees last name, an underscore, the month the employee was born, and the last two digits of the year that they were born. Below is an example of what the first 10 rows will look like:
	SELECT LOWER(
			CONCAT(
				SUBSTR(first_name, 1, 1),
				SUBSTR(last_name, 1, 4),
				'_',
				SUBSTR(birth_date, 6, 2),
				SUBSTR(birth_date, 3, 2)
				)
			) AS username,
	   first_name,
	   last_name,
	   birth_date
FROM employees;