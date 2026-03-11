CREATE DATABASE Travel
USE Travel

CREATE TABLE Countries (
CountryID INT PRIMARY KEY,
CountryName VARCHAR(100) NOT NULL,
Continent VARCHAR(100) NOT NULL
);

CREATE TABLE Routes (
RouteID INT PRIMARY KEY,
FromCountryID INT NOT NULL,
ToCountryID INT NOT NULL,
DistanceKM INT NOT NULL,
FOREIGN KEY (FromCountryID) REFERENCES Countries(CountryID),
FOREIGN KEY (ToCountryID) REFERENCES Countries(CountryID)
);

CREATE TABLE TourPackages (
PackageID INT PRIMARY KEY,
PackageName VARCHAR(150) NOT NULL,
Price DECIMAL(10,2) NOT NULL,
DurationDays INT NOT NULL,
RouteID INT NOT NULL,
FOREIGN KEY (RouteID) REFERENCES Routes(RouteID)
);

CREATE TABLE Customers (
CustomerID INT PRIMARY KEY,
FullName VARCHAR(150) NOT NULL,
Email VARCHAR(150) UNIQUE,
CountryID INT,
FOREIGN KEY (CountryID) REFERENCES Countries(CountryID)
);

CREATE TABLE Bookings (
BookingID INT PRIMARY KEY,
CustomerID INT NOT NULL,
PackageID INT NOT NULL,
BookingDate DATE NOT NULL,
NumberOfPeople INT NOT NULL CHECK (NumberOfPeople > 0),
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
FOREIGN KEY (PackageID) REFERENCES TourPackages(PackageID)
);


INSERT INTO Countries VALUES
(1, 'Nepal', 'Asia'),
(2, 'India', 'Asia'),
(3, 'China', 'Asia'),
(4, 'France', 'Europe'),
(5, 'Italy', 'Europe'),
(6, 'USA', 'North America');

INSERT INTO Routes VALUES
(1, 1, 2, 800),
(2, 1, 3, 1200),
(3, 4, 5, 1100),
(4, 6, 4, 7500),
(5, 2, 6, 13000);

INSERT INTO TourPackages VALUES
(1, 'Himalayan Adventure', 1500.00, 7, 1),
(2, 'Everest Base Camp', 2500.00, 12, 2),
(3, 'European Delight', 3000.00, 10, 3),
(4, 'USA to France Explorer', 4000.00, 14, 4),
(5, 'India to USA Grand Tour', 5000.00, 15, 5);

INSERT INTO Customers VALUES
(1, 'Aarav Sharma', 'aarav@gmail.com', 2),
(2, 'Sita Gurung', 'sita@gmail.com', 1),
(3, 'John Smith', 'john@gmail.com', 6),
(4, 'Marie Claire', 'marie@gmail.com', 4),
(5, 'Li Wei', 'li@gmail.com', 3);

INSERT INTO Bookings VALUES
(1, 1, 1, '2025-01-10', 2),
(2, 2, 2, '2025-02-15', 4),
(3, 3, 4, '2025-03-01', 1),
(4, 4, 3, '2025-03-10', 3),
(5, 1, 5, '2025-04-01', 5),
(6, 5, 2, '2025-04-20', 2);

--Find all tour packages whose price is greater than the average package price
SELECT * FROM TourPackages WHERE Price>
(SELECT AVG(Price) FROM TourPackages)

--Customers from Asia Content
SELECT * FROM Customers WHERE CountryID IN(
SELECT CountryID FROM Countries WHERE Continent='Asia')

--
SELECT PackageID,PackageName AS 'Package Name',cast(Price as varchar(100))+'$' AS [Price in Dollar],
CONCAT(Price,'$') as newprice
FROM TourPackages WHERE Price>
(SELECT AVG(Price) FROM TourPackages )

--Find all packages yjay are more expensive than the cheapest package
SELECT * FROM TourPackages WHERE Price>(
SELECT MIN(Price) FROM TourPackages)

--Find customers who have booked at least one package
SELECT * FROM Customers WHERE CustomerID IN(
SELECT CustomerID FROM Bookings)

--Find customers who have not booked any package
SELECT * FROM Customers WHERE CustomerID NOT IN(
SELECT CustomerID FROM Bookings)

--Find tour packages that have been booked by customer 'Aarav Sharma'
SELECT * FROM TourPackages 
WHERE PackageID IN(
	SELECT PackageID from Bookings
	WHERE CustomerID IN(
					SELECT CustomerID from Customers 
					WHERE FullName='Aarav Sharma'))