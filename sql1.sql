CREATE DATABASE bank;

USE bank;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    city VARCHAR(50),
    salary INT
);

SELECT * FROM employees

INSERT INTO employees VALUES
(1,'Adam','IT','New York',78000),
(2,'Brian','HR','Boston',72000),
(3,'Clara','Finance','New York',80000),
(4,'Daniel','IT','Boston',76000),
(5,'Eva','HR','Chicago',70000),
(6,'Frank','IT','New York',69000),
(7,'Grace','HR','Boston',75000),
(8,'Hannah','IT','Chicago',82000);





--🧠 Question 1
--Display the top 3 highest-paid employees who work in IT or HR, live in New York or Boston, and whose name contains the letter ‘a’. Sort the result by salary descending.
SELECT TOP 3 *
FROM employees
WHERE department IN ('IT','HR')
AND city IN ('New York','Boston')
AND emp_name LIKE '%a%'
ORDER BY salary desc
 
--🧠 Question 2
--Display distinct department names where employees earn more than 70,000, are not from Chicago, and whose name starts with ‘A’ or ‘D’. Order the departments alphabetically.
SELECT distinct department
FROM employees
WHERE salary>70000 AND city <> 'Chicago'
AND (emp_name LIKE 'a%' or emp_name LIKE 'd%')
ORDER BY department asc

 
🧠 Question 3
Display employees who work in Finance, have a salary between 70,000 and 85,000, and whose name ends with ‘n’. Sort the result by salary ascending.
 
🧠 Question 4
Display the top 2 distinct cities where employees work in IT and earn more than 70,000. Order the cities alphabetically.
 
🧠 Question 5
Display employees whose department is in (IT, Finance), city is not in (‘Chicago’), name starts with ‘J’, and salary is greater than 75,000. Order the result by salary descending.*/