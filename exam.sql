CREATE DATABASE EXAM;

USE EXAM;

CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(30),
    LastName VARCHAR(30),
    DOB DATE
);

CREATE TABLE Student_Phone (
    StudentID INT,
    PhoneNumber VARCHAR(15),
    PRIMARY KEY (StudentID, PhoneNumber),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
);

CREATE TABLE Teacher (
    TeacherID INT PRIMARY KEY,
    Name VARCHAR(50),
    Email VARCHAR(50)
);

CREATE TABLE Course (
    CourseID VARCHAR(5) PRIMARY KEY,
    CourseName VARCHAR(50),
    Credits INT,
    TeacherID INT,
    FOREIGN KEY (TeacherID) REFERENCES Teacher(TeacherID)
);

CREATE TABLE Course_Registration (
    RegistrationID INT PRIMARY KEY,
    StudentID INT,
    CourseID VARCHAR(5),
    Semester VARCHAR(10),
    RegistrationDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

INSERT INTO Student VALUES
(1, 'Ram', 'Sharma', '2003-05-10');

INSERT INTO Student_Phone VALUES
(1, '9811111111'),
(1, '9803333333');

INSERT INTO Teacher VALUES
(10, 'Mr. Singh', 'singh@college.edu');

INSERT INTO Course VALUES
('C1', 'DBMS', 3, 10);

INSERT INTO Course_Registration VALUES
(101, 1, 'C1', 'Fall', '2025-01-10');


UPDATE Course
SET Credits = 4
WHERE CourseID = 'C1';

DELETE FROM Course_Registration
WHERE RegistrationID = 101;

SELECT * FROM Student;
SELECT * FROM Teacher;
SELECT * FROM Course;
SELECT * FROM Course_Registration;
SELECT * FROM Student_Phone;



