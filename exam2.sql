CREATE DATABASE EXAM1
USE EXAM1

CREATE TABLE Student (
    RollNo INT PRIMARY KEY,
    Name VARCHAR(30),
    Age INT
);
--DML Commands--
INSERT INTO Student VALUES (1, 'Ram', 20);
SELECT * FROM Student;
UPDATE Student SET Age = 21 WHERE RollNo = 1;
DELETE FROM Student WHERE RollNo = 1;
