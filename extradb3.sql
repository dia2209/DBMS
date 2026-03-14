CREATE DATABASE COMPANY
USE COMPANY

--Table Creation
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    Salary INT,
    Department VARCHAR(50)
);

--DROP TABLE Employees

--Creating AuditTable
CREATE TABLE EmployeeAudit (
    AuditID INT IDENTITY(1,1) PRIMARY KEY,
    EmpID INT,
    ActionType VARCHAR(10),
    OldName VARCHAR(50),
    NewName VARCHAR(50),
    OldSalary INT,
    NewSalary INT,
    ActionDate DATETIME
);

--DROP TABLE EmployeeAudit

--Creating Insert Trigger
CREATE TRIGGER trg_InsertAudit
ON Employees
AFTER INSERT
AS
BEGIN
    INSERT INTO EmployeeAudit
    (EmpID, ActionType, NewName, NewSalary, ActionDate)

    SELECT 
        EmpID,
        'INSERT',
        Name,
        Salary,
        GETDATE()
    FROM inserted
END;

--DROP TRIGGER trg_UpdateAudit

--Creating Update Trigger
CREATE TRIGGER trg_UpdateAudit
ON Employees
AFTER UPDATE
AS
BEGIN
    INSERT INTO EmployeeAudit
    (EmpID, ActionType, OldName, NewName, OldSalary, NewSalary, ActionDate)

    SELECT
        d.EmpID,
        'UPDATE',
        d.Name,
        i.Name,
        d.Salary,
        i.Salary,
        GETDATE()
    FROM deleted d
    INNER JOIN inserted i
    ON d.EmpID = i.EmpID
END;

--Creating Delete Trigger
CREATE TRIGGER trg_DeleteAudit
ON Employees
AFTER DELETE
AS
BEGIN
    INSERT INTO EmployeeAudit
    (EmpID, ActionType, OldName, OldSalary, ActionDate)

    SELECT
        EmpID,
        'DELETE',
        Name,
        Salary,
        GETDATE()
    FROM deleted d
END;

--Testing
INSERT INTO Employees VALUES (1,'Ram',20000,'IT');

UPDATE Employees
SET Salary = 30000
WHERE EmpID = 1;

DELETE FROM Employees
WHERE EmpID = 1;

SELECT * FROM EmployeeAudit;

--Creating Insert,Update Trigger
CREATE TRIGGER trg_InsertUpdateAudit
ON Employees
AFTER INSERT, UPDATE
AS
BEGIN
    INSERT INTO EmployeeAudit(EmpID, ActionType, ActionDate)

    SELECT EmpID,'INSERT',GETDATE()
    FROM inserted
    WHERE EmpID NOT IN (SELECT EmpID FROM deleted)

    UNION

    SELECT EmpID,'UPDATE',GETDATE()
    FROM inserted
    WHERE EmpID IN (SELECT EmpID FROM deleted)
END;

--Alt for Before 
CREATE TRIGGER trg_Test
ON Employees
AFTER INSERT
AS
PRINT 'Record inserted'

--Before condition trigger(CANNOT RUN IN sqlserver)
CREATE TRIGGER trg_Test
ON Employees
BEFORE INSERT
AS
PRINT 'Record inserted'