CREATE DATABASE Extradb1;
USE Extradb1;

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    department_id INT,
    age INT
);
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    department_id INT
);
CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT
);

INSERT INTO Departments VALUES
(1,'IT'),
(2,'Management'),
(3,'Engineering');

INSERT INTO Students VALUES
(1,'Ram',1,20),
(2,'Sita',2,21),
(3,'Hari',1,22),
(4,'Gita',3,20),
(5,'Shyam',2,23);

INSERT INTO Courses VALUES
(101,'Database',1),
(102,'Marketing',2),
(103,'Programming',1),
(104,'Mechanics',3);

INSERT INTO Enrollments VALUES
(1,1,101),
(2,1,103),
(3,2,102),
(4,3,101),
(5,4,104);

SELECT department_id,COUNT(*) AS total_students
FROM Students
GROUP BY department_id
--students in IT
SELECT name FROM Students
WHERE department_id=(SELECT department_id FROM Departments WHERE
department_name='IT')
--students in atleast 1 course
SELECT name FROM Students s WHERE EXISTS(SELECT * FROM Enrollments e
WHERE e.student_id=s.student_id)