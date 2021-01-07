# When Doing Temp Tables
# 3 Steps to Success w/ Temp Tables
# Step 1: Use your own database as a scratchpad
# Step 2: Write the query you need to, using the database_name.table_name after your FROM or with your JOINS
# Step 3: Wrap your query from above in CREATE TEMPORARY TABLE table_name AS ();

# Start by using your own database (so you can write/edit/delete/whatever)

# Step 1- use your own DB
# use easley_****;
use ryan;

# Step 2 - write whatever query you need, being 100% sure to use database_name.table_name syntax
select *
from employees.employees # database_name.table_name
join employees.salaries using(emp_no) # database_name.table_name
where to_date > curdate()


# Step 3 - wrap the query in a CREATE TEMPORARY TABLE table_name AS ();
# Let's make a temp table of current employees w/ their salary
create temporary table emp_salary as (
	select *
	from employees.employees # database_name.table_name
	join employees.salaries using(emp_no) # database_name.table_name
	where to_date > curdate()
);

select *
from emp_salary;

# After we have a temp table, we can get get to work:
# Querying from it
# Altering data (if we need to)

# Stakeholder says: 
# What would our total salary spend be if everybody gets a 5% raise?
# Technically we don't need a temp table to solve this, so this is a simple example :)
update emp_salary
set salary = salary + salary * .05;

select * from emp_salary;

select sum(salary) from emp_salary;


select *
from emp_salary
where first_name = "Mary"
and salary > 60000;

#Create a file named temporary_tables.sql to do your work for this exercise.

#Using the example from the lesson, re-create the employees_with_departments table.

#Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns
#Update the table so that full name column contains the correct data
#Remove the first_name and last_name columns from the table.
#What is another way you could have ended up with this same table?
#Create a temporary table based on the payment table from the sakila database.

#Write the SQL necessary to transform the amount column such that it is stored as an integer representing the number of cents of the payment. For example, 1.99 should become 199.

#Find out how the current average pay in each department compares to the overall, historical average pay. In order to make the comparison easier, you should use the Z-score for salaries. In terms of salary, what is the best department right now to work for? The worst?;

