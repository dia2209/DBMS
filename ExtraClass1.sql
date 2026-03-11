CREATE DATABASE AceCollegeDB;

USE AceCollegeDB;


CREATE TABLE Students(
StudentID INT PRIMARY KEY,
FullName VARCHAR(150) NOT NULL,
Email VARCHAR(150) UNIQUE,
DOB DATE,
Gender VARCHAR(10))

CREATE TABLE Courses(
CourseID INT PRIMARY KEY,
CourseName VARCHAR(150) NOT NULL,
CreditHours INT DEFAULT 3)

CREATE TABLE Enrollments(
EnrollmentID INT PRIMARY KEY,
StudentID INT,
CourseID INT,
EnrollDate DATE,
FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
)

INSERT INTO Students(StudentID,FullName,Email,DOB,Gender)
VALUES
(1,'Diya','diamanandhar@gmail.com','22 Sep','F'),
(2,'Avash','avs@gmail.com','28 Mar','M'),
(3,'Ocean','ocii@gmail.com','9 Apr','F'),
(4,'Krishala','krii@gmail.com','1 Aug','F'),
(5,'Riya','riyamanandhar@gmail.com','30 Nov','F')

INSERT INTO Courses(CourseID,CourseName,CreditHours)
VALUES
(101,'DBMS',6),
(102,'OOAD',3),
(103,'Stats',5)

INSERT INTO Enrollments(EnrollmentID,StudentID,CourseID,EnrollDate) 
VALUES
(111,1,101,'10-01-2025'),
(112,1,102,'12-01-2025'),
(113,2,101,'15-01-2025'),
(114,2,103,'18-01-2025'),
(115,3,102,'20-01-2025'),
(116,4,101,'22-01-2025')

UPDATE Students
SET Email='ocean@gmail.com'
WHERE StudentID=3

DELETE FROM Enrollments
WHERE StudentID=3 AND CourseID=102;

--Queries--
SELECT s.FullName, c.CourseName, e.EnrollDate
FROM Enrollments e
JOIN Students s ON e.StudentID=s.StudentID
JOIN Courses c ON e.CourseID=c.CourseID

--Display all students(even if not enrolled)
SELECT s.FullName, c.CourseName
FROM Students s
LEFT JOIN Enrollments e ON s.StudentID=e.StudentID
LEFT JOIN Courses c ON e.CourseID= c.CourseID

--Courses with no enrolled students--
SELECT c.CourseName
FROM Courses c
LEFT JOIN Enrollments e ON c.CourseID=e.CourseID
WHERE e.CourseID IS NULL

--Total students in each course--
SELECT c.CourseName,COUNT(e.StudentID) AS TotalStudents
FROM Courses c
LEFT JOIN Enrollments e ON c.CourseID=e.CourseID
GROUP BY c.CourseName

--Students born after 2002--
SELECT *
FROM Students
WHERE DOB>'2002-12-31';

--Students whose name starts with 'A'
SELECT *
FROM Students
WHERE FullName LIKE 'A%';

--Courses with CreditHours>=3
SELECT *
FROM Courses
WHERE CreditHours>=3;

--Students enrolled in more than one course--
SELECT StudentID, COUNT(CourseID) AS CourseCount
FROM Enrollments
GROUP BY StudentID
HAVING COUNT(CourseID)>1


--Latest Enrollment Date--
SELECT MAX(EnrollDate) AS LatestEnrollment
FROM Enrollments;




