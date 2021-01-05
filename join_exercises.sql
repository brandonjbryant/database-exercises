# Join Example Database
use join_example_db;
#Use the join_example_db. Select all the records from both the users and roles tables.
	SELECT *
	FROM users;
	
	SELECT *
	FROM roles;
	


##Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson. Before you run each query, guess the expected number of results.

SELECT users.name as user_name, roles.name as role_name
FROM users
RIGHT JOIN roles ON users.role_id = roles.id;

#Use count and the appropriate join type to get a list of roles along with the number of users that has the role. Hint: You will also need to use group by in the query.
	SELECT roles.name AS role_name, COUNT(users.name) AS user_name
		FROM users
		right JOIN roles ON users.role_id = roles.id
		GROUP BY role_name;

#Employees Database
#Use the employees database.
	USE employees;
	select *
	From employees;
#write a query that shows each department along with the name of the current manager for that department.
	USE employees;
	SELECT dept_name	