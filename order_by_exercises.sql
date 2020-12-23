#Create a new file named order_by_exercises.sql and copy in the contents of your exercise from the previous lesson.
	USE employees;
#Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?(709. Irena Reutenauer. Vidya Simmen)
	SELECT *
	FROM employees
	WHERE first_name IN ('Irena', 'Vidya', 'Maya')
	ORDER BY first_name;

	
#Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and then last name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?(709 Irena Acton,Vidya Zweizig)
SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name, last_name;

#Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by last name and then first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?(709 Irena Acton. Maya Zyda)
	SELECT * 
	FROM employees
	WHERE first_name IN ('Irena','Vidya','Maya')
	ORDER BY last_name, first_name;

#Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their employee number. Enter a comment with the number of employees returned, the first employee number and their first and last name, and the last employee number with their first and last name.(899:10021 Ramzi Erde.499648 Tadahiro Erde)
	SELECT *
	FROM employees
	WHERE last_name LIKE 'E%E'
	ORDER BY emp_no;
#Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their hire date, so that the newest employees are listed first. Enter a comment with the number of employees returned, the name of the newest employee, and the name of the oldest emmployee.(899 Sergi Erde. Teiji Eldridge)
	SELECT *
	FROM employees 
	WHERE last_name LIKE 'E%E'
	ORDER BY hire_date;
#Find all employees hired in the 90s and born on Christmas. Sort the results so that the oldest employee who was hired last is the first result. Enter a comment with the number of employees returned, the name of the oldest employee who was hired last, and the name of the youngest emmployee who was hired first.(362. Khun Bernini. Douadi Pettis)
	SELECT *
	FROM employees 
	WHERE birth_date LIKE '%-12-25'
	AND hire_date LIKE '199%'
	ORDER BY birth_date DESC, hire_date ;