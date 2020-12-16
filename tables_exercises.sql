
#Use employees database/ List all tables in Database
SHOW Databases;

#Explore the employees table. What different data types are present on this table?
SHOW TABLES;

#Which table(s) do you think contain a numeric type column?
Salaries, dept_emp_latest_date, titles, employees

#Which table(s) do you think contain a string type column?
`current_dept_emp` `departments` `dept_emp` `dept_manager` titles

#Which table(s) do you think contain a date type column?
`dept_emp_latest_date` 

#What is the relationship between the employees and the departments tables?
DESCrIBE `departments`;
employees are assigned to departments.

#Show the SQL that created the dept_manager table.
SHOW CREATE TABLE `dept_manager`
