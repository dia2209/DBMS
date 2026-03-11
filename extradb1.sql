CREATE DATABASE company_db;
USE company_db;

CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

CREATE TABLE Salary (
    salary_id INT PRIMARY KEY,
    emp_id INT,
    salary INT,
    FOREIGN KEY (emp_id) REFERENCES Employee(emp_id)
);
SELECT * FROM Salary
DROP TABLE Salary

INSERT INTO Department VALUES
(101,'IT'),
(102,'HR'),
(103,'Finance');

INSERT INTO Employee VALUES
(1,'Ram',101),
(2,'Sita',102),
(3,'Hari',103);

SELECT * FROM Department
SELECT * FROM Employee
SELECT * FROM Salary
INSERT INTO Salary VALUES
(111,1,50000),
(222,2,45000),
(333,3,48000);

--1--
CREATE VIEW EmployeeBasicView AS
SELECT emp_id AS EmployeeID, emp_name AS EmployeeName
FROM Employee;
DROP VIEW EmployeeBasicView

SELECT * FROM EmployeeBasicView;

INSERT INTO EmployeeBasicView VALUES(4,'Diya');

UPDATE EmployeeBasicView
SET EmployeeName='Riya'
WHERE EmployeeID=4;

DELETE FROM EmployeeBasicView
WHERE EmployeeID=4

--2--
CREATE VIEW Employee_Department_Salary AS
SELECT 
E.emp_id,
E.emp_name,
D.dept_name,
S.salary
FROM Employee E
INNER JOIN Department D
ON E.dept_id = D.dept_id
INNER JOIN Salary S
ON E.emp_id = S.emp_id;

INSERT INTO Employee_Department_Salary VALUES(5,'Priya','IT',30000);

UPDATE Employee_Department_Salary
SET emp_name='Diya'
WHERE emp_id=3;

DELETE FROM Employee_Department_Salary
WHERE emp_id=4

SELECT * FROM Employee_Department_Salary;

--3--
CREATE VIEW EmployeeSameColView AS
SELECT emp_id,emp_name,dept_id 
FROM Employee;

SELECT * FROM EmployeeSameColView;

INSERT INTO EmployeeSameColView VALUES(5,'Priya',101);

UPDATE EmployeeSameColView
SET emp_name='Piya'
WHERE emp_id=3;

DELETE FROM EmployeeSameColView
WHERE emp_id=5
SELECT * FROM EmployeeSameColView
SELECT * FROM Employee

--4--
CREATE VIEW EmployeeMainFocusedView AS
SELECT E.emp_id,
E.emp_name,
E.dept_id
FROM Employee E
INNER JOIN Department D
ON E.dept_id=D.dept_id
INNER JOIN Salary S
ON S.emp_id=E.emp_id

INSERT INTO EmployeeMainFocusedView VALUES(9,'Jung',101)

UPDATE EmployeeMainFocusedView
SET emp_name='Min'
WHERE emp_id=9

DELETE FROM EmployeeMainFocusedView
WHERE emp_id=9

--5--
CREATE VIEW DepartmentEarning AS
SELECT d.dept_name AS DepartmentName,
SUM(s.salary) AS TotalSalary,
AVG(s.salary) AS AverageSalary,
COUNT(e.emp_id) AS TotalEmployees
FROM Department d
INNER JOIN Employee e
ON d.dept_id=e.dept_id
INNER JOIN Salary s
ON s.emp_id=e.emp_id
GROUP BY d.dept_name
 
SELECT * FROM DepartmentEarning