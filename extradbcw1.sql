CREATE DATABASE college_db;
USE college_db;

CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    department VARCHAR(50)
);

CREATE TABLE Marks (
    student_id INT,
    subject VARCHAR(50),
    marks INT
);

CREATE TABLE Course (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    department VARCHAR(50)
);

INSERT INTO Student VALUES
(1,'Ram','IT'),
(2,'Sita','HR'),
(3,'Hari','Finance');

INSERT INTO Marks VALUES
(1,'DBMS',85),
(2,'Marketing',78),
(3,'Statistics',90);

INSERT INTO Course VALUES
(101,'DBMS','IT'),
(102,'Marketing','HR'),
(103,'Statistics','Finance');

--1--
CREATE VIEW StudentView AS
SELECT student_id AS StudentID,
student_name AS StudentName,
department AS DepartmentName
FROM Student

INSERT INTO StudentView VALUES(4,'Riyesh','DBMS')

UPDATE StudentView
SET StudentName='Liyan'
WHERE STUDENTID=4

DELETE FROM StudentView
WHERE STUDENTID=4


--2--
DROP VIEW Student_Marks_Course
CREATE VIEW Student_Marks_Course AS
SELECT s.student_id,
s.student_name,
m.marks,
c.course_name
FROM Student s
INNER JOIN Marks m
ON s.student_id=m.student_id
INNER JOIN Course c
ON c.course_name=m.subject


INSERT INTO Student_Marks_Course VALUES(7,'MinMin',99,'DBMS')

UPDATE Student_Marks_Course
SET student_name='BongBong'
WHERE student_id=1

DELETE FROM Student_Marks_Course
WHERE student_id=4

--3--
CREATE VIEW StudentSameColView AS
SELECT student_id, student_name,
    department
FROM Student

INSERT INTO StudentSameColView VALUES(6,'Rupesh','DBMS')

UPDATE StudentSameColView
SET student_name='Riyan'
WHERE student_id=6

DELETE FROM StudentSameColView
WHERE student_id=6