#Open Sequel Pro and login to the database server
#Save your work in a file named tables_exercises.sql
#Use the employees database
#List all the tables in the database
	SHOW TABLES;
#Explore the employees table. What different data types are present on this table?
#int, date, varchar, enum
	DESCRIBE employees;
#Which table(s) do you think contain a numeric type column?
	#dept_emp_lastest_date, employees, employees_with_departments, salaries
	
#Which table(s) do you think contain a string type column?
	#all
#Which table(s) do you think contain a date type column?
	#dept_emp_latest_date, current_dept_emp
	
#What is the relationship between the employees and the departments tables?
	#Employes are categorized by department.

#Show the SQL that created the dept_manager table.
	SHOW CREATE TABLE dept_manager;
