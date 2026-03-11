CREATE DATABASE Business;

USE Business;

DROP TABLE IF EXISTS RetailSales;

CREATE TABLE RetailSales(
    SaleID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    City VARCHAR(50),
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    SaleDate DATE
);

INSERT INTO RetailSales VALUES
(1, 'Amit Sharma', 'Kathmandu', 'Laptop', 'Electronics', 1, 80000, '2025-01-10'),
(2, 'Amit Sharma', 'Kathmandu', 'Mobile Phone', 'Electronics', 2, 40000, '2025-01-12'),
(3, 'Rina Thapa', 'Pokhara', 'Mobile Phone', 'Electronics', 1, 40000, '2025-01-15'),
(4, 'Suman Karki', 'Kathmandu', 'Office Chair', 'Furniture', 4, 15000, '2025-01-20'),
(5, 'Suman Karki', 'Kathmandu', 'Table', 'Furniture', 1, 20000, '2025-01-22'),
(6, 'Anil Gurung', 'Butwal', 'Laptop', 'Electronics', 2, 80000, '2025-01-25'),
(7, 'Rina Thapa', 'Pokhara', 'Table', 'Furniture', 3, 20000, '2025-01-26');

INSERT INTO RetailSales VALUES
(8,  'Amit Sharma',  'Kathmandu', 'Mouse',        'Electronics', 3, 1200,  '2025-02-01'),
(9,  'Rina Thapa',   'Pokhara',   'Keyboard',     'Electronics', 2, 2500,  '2025-02-02'),
(10, 'Anil Gurung',  'Butwal',    'Office Chair', 'Furniture',   1, 15000, '2025-02-03'),
(11, 'Suman Karki',  'Kathmandu', 'Laptop',       'Electronics', 1, 80000, '2025-02-04'),
(12, 'Bikash Rana',  'Biratnagar','Mobile Phone', 'Electronics', 2, 40000, '2025-02-05'),
(13, 'Bikash Rana',  'Biratnagar','Table',        'Furniture',   1, 20000, '2025-02-06'),
(14, 'Nisha Adhikari','Kathmandu','Keyboard',     'Electronics', 3, 2500,  '2025-02-07'),
(15, 'Nisha Adhikari','Kathmandu','Mouse',        'Electronics', 5, 1200,  '2025-02-07'),
(16, 'Anil Gurung',  'Butwal',    'Table',        'Furniture',   2, 20000, '2025-02-08'),
(17, 'Rina Thapa',   'Pokhara',   'Office Chair', 'Furniture',   2, 15000, '2025-02-09'),
(18, 'Amit Sharma',  'Kathmandu', 'Table',        'Furniture',   1, 20000, '2025-02-10'),
(19, 'Bikash Rana',  'Biratnagar','Laptop',       'Electronics', 1, 80000, '2025-02-11'),
(20, 'Suman Karki',  'Kathmandu', 'Mouse',        'Electronics', 4, 1200,  '2025-02-12');

--Display total qty sold for each ProductName
SELECT ProductName,SUM(Quantity) AS Unit_Sold FROM RetailSales GROUP BY ProductName

--Show total sales amount(Quantity*UnitPrice) for each ProductName
SELECT ProductName, SUM(Quantity*UnitPrice) AS Sales_Amount FROM RetailSales GROUP BY ProductName

--Find the total number of sales record for each City
SELECT City, COUNT(*) AS Number_Of_Sales FROM RetailSales  GROUP BY City

--Display the total quantity sold by each CustomerName
SELECT CustomerName,SUM(Quantity) AS Total_Qty FROM RetailSales GROUP BY CustomerName

--Find the minimum unit price for each Category
SELECT Category, MIN(UnitPrice) AS MinimumUnit FROM RetailSales GROUP BY Category

--Count how many times each ProductName was sold
SELECT ProductName, COUNT(*) AS ProductNameSales FROM RetailSales GROUP BY ProductName

--Find the total number of sales record for each City where Sales>3
SELECT City, COUNT(*) AS Number_Of_Sales  FROM RetailSales GROUP BY City HAVING COUNT(*)>3

--Find customers whose total purchase amount exceeds 100,000
SELECT CustomerName,SUM(Quantity*UnitPrice) AS PurchaseAmount FROM RetailSales GROUP BY CustomerName HAVING SUM(Quantity*UnitPrice)>100000 ORDER BY PurchaseAmount asc

--Show cities where total sales amount is more than 150,000.
SELECT City,SUM(Quantity*UnitPrice) AS SalesAmount FROM RetailSales GROUP BY City HAVING SUM(Quantity*UnitPrice)>150000

--Display categories having more than 5 items sold in total.
SELECT Category, SUM(Quantity) AS NoOfItemsSold FROM RetailSales GROUP BY Category HAVING SUM(Quantity)>5

--Find products that were sold more than 2 times.
SELECT ProductName, COUNT(*) FROM RetailSales GROUP BY ProductName HAVING COUNT(*)>2

--Display customers who purchased more than 5 items in total.
SELECT CustomerName, SUM(Quantity) AS TotalItems FROM RetailSales GROUP BY CustomerName Having SUM(Quantity)>5;

--Show categories whose average unit price is greater than 20,000.
SELECT Category,AVG(UnitPrice) AS AveragePrice FROM RetailSales GROUP BY Category HAVING AVG(UnitPrice)>20000

--Display cities having more than 3 sales records.
SELECT City FROM RetailSales GROUP BY City HAVING COUNT(*)>3

--Find products whose total sales amount exceeds 50,000.
SELECT ProductName,SUM(Quantity*UnitPrice) AS TotalSales FROM RetailSales GROUP BY ProductName HAVING SUM(Quantity*UnitPrice)>50000

--Show customers who have made more than one purchase.
SELECT CustomerName,COUNT(*) AS Purchase FROM RetailSales GROUP BY CustomerName HAVING COUNT(*)>1

--Display customers who purchased products from more than one category.
SELECT CustomerName FROM RetailSales GROUP BY CustomerName HAVING COUNT(DISTINCT Category)>1

--Find products that were sold in more than one city.
SELECT ProductName FROM RetailSales GROUP BY ProductName HAVING COUNT(DISTINCT City)>1

--Display cities where more than 2 different products were sold.
SELECT City FROM RetailSales GROUP BY City HAVING COUNT(DISTINCT ProductName)>2

--Find categories having more than 2 different products sold.
SELECT Category FROM RetailSales GROUP BY Category HAVING COUNT(DISTINCT ProductName)>2

--Display customers whose average purchase amount per sale is greater than 30,000.
SELECT CustomerName,AVG(Quantity*UnitPrice) AS AveragePurchase FROM RetailSales GROUP BY CustomerName HAVING AVG(Quantity*UnitPrice)>30000

--Show products where average quantity per sale is greater than 2.
SELECT ProductName FROM RetailSales GROUP BY ProductName HAVING AVG(Quantity)>2
--Find customers who made purchases on more than one date.
SELECT CustomerName FROM RetailSales GROUP BY CustomerName HAVING COUNT(DISTINCT SaleDate)>1

--Display products sold on more than 3 different days.
SELECT ProductName FROM RetailSales GROUP BY ProductName HAVING COUNT(DISTINCT SaleDate)>3

--Show cities where customers purchased both Electronics and Furniture.
SELECT City FROM RetailSales WHERE Category IN('Electronics','Furniture') GROUP BY City HAVING COUNT(DISTINCT Category)=2;

--Find customers who bought the same product more than once.
SELECT CustomerName, ProductName FROM RetailSales GROUP BY CustomerName,ProductName HAVING COUNT(*) >1


--Find the top 3 products based on total sales amount
SELECT TOP 3 ProductName, SUM(Quantity*UnitPrice) AS SalesAmount FROM RetailSales GROUP BY ProductName order by 2 desc

--first ma from and then group by and then select and then order by--

--Display customers whose total electronics spending is greater than furniture spending
SELECT TOP 2 CustomerName, SUM(CASE WHEN Category='Electronics' THEN Quantity*UnitPrice ELSE 0 END) AS Electronics_Spending, SUM(CASE WHEN Category='Furniture' THEN Quantity*UnitPrice ELSE 0 END) AS Furniture_Spending  FROM RetailSales GROUP BY CustomerName HAVING SUM(CASE WHEN Category='Electronics' THEN Quantity*UnitPrice ELSE 0 END)>
SUM(CASE WHEN Category='Furniture' THEN Quantity*UnitPrice ELSE 0 END) ORDER BY 2 DESC

--Display cities whose highest single sale amount is greater than 80,000
SELECT City FROM RetailSales GROUP BY City HAVING MAX(Quantity*UnitPrice)>80000

--Display total quantity sold for each ProductName in each city
SELECT ProductName, City, SUM(Quantity) AS TotalQtySold FROM RetailSales GROUP BY ProductName,City 

--Find customers and categories where total spending exceeds 50,000
SELECT CustomerName, Category, SUM(Quantity*UnitPrice) AS TotalSpending FROM RetailSales GROUP BY CustomerName,Category HAVING SUM(Quantity*UnitPrice)>50000

--Show cities and products sold on more than one different day
SELECT City,ProductName FROM RetailSales GROUP BY City,ProductName HAVING COUNT(DISTINCT SaleDate)>1