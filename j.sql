-- Create Database
CREATE DATABASE RetailLabDB;
GO

USE RetailLabDB;
GO

-- Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(20),
    City VARCHAR(50) DEFAULT 'Kathmandu',
    RegistrationDate DATE DEFAULT GETDATE()
);

-- Employees Table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    FullName VARCHAR(100) NOT NULL,
    Position VARCHAR(50),
    Salary DECIMAL(10,2) CHECK (Salary > 10000),
    HireDate DATE
);

-- Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName VARCHAR(100) NOT NULL,
    Category VARCHAR(50),
    Price DECIMAL(10,2) CHECK (Price > 0),
    StockQuantity INT CHECK (StockQuantity >= 0)
);

-- Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT,
    EmployeeID INT,
    OrderDate DATE DEFAULT GETDATE(),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- OrderDetails Table
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT,
    ProductID INT,
    Quantity INT CHECK (Quantity > 0),
    UnitPrice DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


-- Insert Customers
INSERT INTO Customers (FullName, Email, Phone, City)
VALUES 
('Aarav Sharma', 'aarav@gmail.com', '9800000001', 'Kathmandu'),
('Sita Rai', 'sita@gmail.com', '9800000002', 'Lalitpur'),
('Ram Thapa', 'ram@gmail.com', '9800000003', 'Bhaktapur'),
('Nabin Karki', 'nabin@gmail.com', '9800000004', 'Kathmandu'),
('Priya Shrestha', 'priya@gmail.com', '9800000005', 'Pokhara');

-- Insert Employees
INSERT INTO Employees (FullName, Position, Salary, HireDate)
VALUES
('Ramesh Adhikari', 'Manager', 60000, '2021-01-10'),
('Sunita Lama', 'Sales Executive', 35000, '2022-05-12'),
('Bikash Gurung', 'Sales Executive', 32000, '2023-02-15'),
('Anita KC', 'Cashier', 25000, '2024-01-01');

-- Insert Products
INSERT INTO Products (ProductName, Category, Price, StockQuantity)
VALUES
('Laptop', 'Electronics', 80000, 10),
('Mobile', 'Electronics', 30000, 25),
('Headphones', 'Electronics', 2000, 50),
('Office Chair', 'Furniture', 7000, 15),
('Desk', 'Furniture', 12000, 5),
('Notebook', 'Stationery', 100, 200);

-- Insert Orders
INSERT INTO Orders (CustomerID, EmployeeID, OrderDate)
VALUES
(1, 2, '2025-01-10'),
(2, 3, '2025-01-12'),
(3, 2, '2025-02-01'),
(1, 1, '2025-02-10');

-- Insert OrderDetails
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice)
VALUES
(1, 1, 1, 80000),
(1, 3, 2, 2000),
(2, 2, 1, 30000),
(3, 4, 2, 7000),
(4, 6, 10, 100);

SELECT FullName,City,RegistrationDate
FROM Customers

SELECT o.OrderID, c.FullName AS CustomerName, e.FullName AS EmployeeName, o.OrderDate
FROM Orders o
INNER JOIN Customers c
ON c.CustomerId=o.CustomerId
INNER JOIN Employees e
ON e.EmployeeId=o.EmployeeId

SELECT p.ProductName, p.Category, od.Quantity, od.UnitPrice, (od.Quantity * od.UnitPrice) AS TotalPrice
FROM OrderDetails od
INNER JOIN Products p
ON p.ProductId=od.ProductId

SELECT c.FullName
FROM Customers c
LEFT JOIN Orders o
ON o.CustomerId=c.CustomerId
WHERE o.CustomerID IS NULL

SELECT p.ProductName
FROM Products p
LEFT JOIN OrderDetails od
ON od.ProductID=p.ProductId
WHERE od.ProductId IS NULL

SELECT OrderId ,SUM(Quantity*UnitPrice) AS TotalSales
FROM OrderDetails
GROUP BY OrderId

SELECT e.FullName AS EmployeeName,SUM(od.Quantity*od.UnitPrice) AS TotalRevenue
FROM Employees e
INNER JOIN Orders o
ON o.EmployeeId=e.EmployeeId
INNER JOIN OrderDetails od
ON od.OrderID=o.OrderId
GROUP BY e.FullName

SELECT p.ProductName,SUM(od.Quantity) AS TotalQty
FROM Products p
INNER JOIN OrderDetails od
ON od.ProductID=p.ProductId
GROUP BY p.ProductName
ORDER BY TotalQty desc

SELECT Position, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY Position

SELECT c.City,SUM(od.Quantity*od.UnitPrice) AS TotalSales
FROM Orders o
INNER JOIN OrderDetails od 
ON od.OrderId=o.OrderId
INNER JOIN Customers c
ON c.CustomerId=o.CustomerId
GROUP BY c.City


SELECT e.FullName AS EmployeeName
FROM Employees e
INNER JOIN Orders o
ON o.EmployeeID=e.EmployeeID
INNER JOIN OrderDetails od
ON od.OrderID=o.OrderId
GROUP BY e.FullName
HAVING SUM(od.Quantity*od.UnitPrice)>50000

SELECT p.ProductName
FROM Products p
INNER JOIN OrderDetails od
ON od.ProductID=p.ProductID
GROUP BY p.ProductName
HAVING SUM(Quantity)>10

SELECT ProductName
FROM Products
WHERE Price>(
SELECT AVG(Price) FROM Products))

SELECT FullName
FROM Customers 
WHERE COUNT(OrderId)>(SELECT AVG(OrderId) FROM Orders))

SELECT TOP FullName FROM
Employees WHERE ..

SELECT FullName
FROM Customers
LIKE 'A%'

CREATE VIEW vw_OrderSummary
SELECT oRDERiDCUSTOMERNme