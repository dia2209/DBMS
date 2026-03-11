CREATE DATABASE CollegeDB;

USE CollegeDB;

CREATE TABLE Student(
StudentID INT PRIMARY KEY,
StudentName VARCHAR(150) NOT NULL,
Email VARCHAR(150) UNIQUE,
Age INT CHECK(Age>=18),
Program VARCHAR(150) NOT NULL,
City VARCHAR(30) DEFAULT 'Kathmandu');

INSERT INTO Student(StudentID, StudentName,Email,Age, Program,City) VALUES
(1, 'Amit Sharma', 'amit@gmail.com', 20, 'BCA', 'Kathmandu'),
(2, 'Suman Thapa', 'suman@gmail.com', 22, 'BSc.CSIT', 'Biratnagar'),
(3, 'Anita Koirala', 'anita@gmail.com', 21, 'BIM', 'Pokhara'),
(4, 'Rohit Puri', 'rohit@gmail.com', 19, 'BCA', 'Hetauda'),
(5, 'Arjun Shrestha', 'arjun@gmail.com', 23, 'BSc.CSIT', 'Dharan');

SELECT * FROM Student
WHERE Program='BCA';

SELECT * FROM Student
WHERE Age>20;

SELECT * FROM Student
WHERE StudentName LIKE 'A%';

SELECT * FROM Student
WHERE StudentName LIKE '%pur%';

SELECT * FROM Student
WHERE Program IN ('BCA','BSc.CSIT');

SELECT * FROM Student
WHERE Program NOT IN ('BCA','BIM');

SELECT * FROM Student
WHERE StudentName NOT LIKE 'S%';

UPDATE Student
SET City='Pokhara'
WHERE StudentID=2;

SELECT * FROM Student;

DELETE Student
WHERE AGE<19;


SELECT * FROM Student;

INSERT INTO Student
VALUES(6,'Diya Manandhar','diyamdr1@gmail.com',16,'BIM');

INSERT INTO Student
VALUES(7,'Avash Shrestha','avs@gmail.com',19,'BIM'),
(8,'Avash Tamang','avs@gmail.com',19,'BIM');