
CREATE DATABASE IF NOT EXISTS CarShowroomDB;
USE CarShowroomDB;

DROP TABLE IF EXISTS ServiceRecords;
DROP TABLE IF EXISTS Sales;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Cars;
DROP TABLE IF EXISTS Salespersons;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(100) NOT NULL,
    City VARCHAR(50),
    State VARCHAR(50),
    JoinDate DATE
);

CREATE TABLE Cars (
    CarID INT PRIMARY KEY AUTO_INCREMENT,
    Model VARCHAR(50) NOT NULL,
    Brand VARCHAR(50) NOT NULL,
    Year INT,
    Price DECIMAL(10,2),
    Color VARCHAR(30),
    InventoryCount INT
);

CREATE TABLE Salespersons (
    SalespersonID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Department VARCHAR(50),
    HireDate DATE
);

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    CarID INT,
    SaleDate DATE,
    SalePrice DECIMAL(10,2),
    SalespersonID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (CarID) REFERENCES Cars(CarID),
    FOREIGN KEY (SalespersonID) REFERENCES Salespersons(SalespersonID)
);

CREATE TABLE ServiceRecords (
    RecordID INT PRIMARY KEY AUTO_INCREMENT,
    CarID INT,
    ServiceDate DATE,
    ServiceType VARCHAR(50),
    Cost DECIMAL(8,2),
    TechnicianID INT,
    FOREIGN KEY (CarID) REFERENCES Cars(CarID)
);

-- sample data
INSERT INTO Customers (CustomerName, City, State, JoinDate) VALUES
('Alex Rivera', 'New York', 'NY', '2023-01-15'),
('Maya Patel', 'Los Angeles', 'CA', '2023-02-20'),
('Jordan Chen', 'Chicago', 'IL', '2023-03-10'),
('Zara Thompson', 'Houston', 'TX', '2023-04-05'),
('Blake Morgan', 'Phoenix', 'AZ', '2023-05-12'),
('Nova Singh', 'Philadelphia', 'PA', '2023-06-18'),
('Casey Brooks', 'San Antonio', 'TX', '2023-07-22'),
('Riley Kumar', 'San Diego', 'CA', '2023-08-30'),
('Phoenix Reed', 'Dallas', 'TX', '2023-09-14'),
('Quinn Foster', 'San Jose', 'CA', '2023-10-25'),
('Sage Williams', 'Austin', 'TX', '2023-11-08'),
('River Martinez', 'Jacksonville', 'FL', '2023-12-03'),
('Rowan Clarke', 'Indianapolis', 'IN', '2024-01-17'),
('Sky Rodriguez', 'Columbus', 'OH', '2024-02-21'),
('Storm Bailey', 'Fort Worth', 'TX', '2024-03-15');


INSERT INTO Cars (Model, Brand, Year, Price, Color, InventoryCount) VALUES
('Camry', 'Toyota', 2023, 28500.00, 'Silver', 15),
('Corolla', 'Toyota', 2023, 24800.00, 'White', 20),
('RAV4', 'Toyota', 2023, 32400.00, 'Blue', 12),
('Highlander', 'Toyota', 2023, 38900.00, 'Black', 8),
('Prius', 'Toyota', 2023, 31200.00, 'Green', 10),
('Sienna', 'Toyota', 2023, 39800.00, 'Gray', 5),
('Tacoma', 'Toyota', 2023, 35600.00, 'Red', 7),

('Civic', 'Honda', 2023, 26300.00, 'White', 18),
('Accord', 'Honda', 2023, 31700.00, 'Black', 14),
('CR-V', 'Honda', 2023, 33200.00, 'Silver', 16),
('Pilot', 'Honda', 2023, 42500.00, 'Blue', 6),
('Odyssey', 'Honda', 2023, 40800.00, 'Gray', 4),
('Ridgeline', 'Honda', 2023, 44200.00, 'Red', 3),

('F-150', 'Ford', 2023, 45200.00, 'Blue', 12),
('Escape', 'Ford', 2023, 29800.00, 'Red', 11),
('Explorer', 'Ford', 2023, 38400.00, 'White', 9),
('Mustang', 'Ford', 2023, 42600.00, 'Yellow', 6),
('Edge', 'Ford', 2023, 37900.00, 'Black', 8),
('Fusion', 'Ford', 2023, 27500.00, 'Silver', 13),

('3 Series', 'BMW', 2023, 52800.00, 'White', 5),
('X3', 'BMW', 2023, 58900.00, 'Black', 4),
('5 Series', 'BMW', 2023, 68400.00, 'Gray', 3),
('X5', 'BMW', 2023, 72300.00, 'Blue', 2),

('C-Class', 'Mercedes', 2023, 54700.00, 'Silver', 6),
('E-Class', 'Mercedes', 2023, 71200.00, 'Black', 4),
('GLE', 'Mercedes', 2023, 78900.00, 'White', 3),

('A4', 'Audi', 2023, 48600.00, 'Gray', 7),
('Q5', 'Audi', 2023, 55800.00, 'Blue', 5),
('A6', 'Audi', 2023, 64300.00, 'Black', 4);

-- Insert Salespersons
INSERT INTO Salespersons (Name, Department, HireDate) VALUES
('Robert Johnson', 'Sales', '2020-03-15'),
('Maria Rodriguez', 'Sales', '2021-07-22'),
('James Wilson', 'Sales', '2019-11-08'),
('Linda Davis', 'Sales', '2022-01-12'),
('Mark Thompson', 'Sales', '2020-09-30'),
('Patricia Brown', 'Sales', '2021-05-18'),
('Thomas Anderson', 'Sales', '2019-08-25'),
('Nancy Martinez', 'Sales', '2022-04-07');

-- Insert Sales (ensuring some models are sold more than 10 times and creating monthly patterns)
INSERT INTO Sales (CustomerID, CarID, SaleDate, SalePrice, SalespersonID) VALUES
-- January 2024 (25 sales - more than 20)
(1, 1, '2024-01-05', 28000.00, 1), (2, 2, '2024-01-08', 24500.00, 2),
(3, 1, '2024-01-10', 27800.00, 3), (4, 3, '2024-01-12', 32000.00, 1),
(5, 1, '2024-01-15', 28200.00, 4), (6, 4, '2024-01-18', 38500.00, 2),
(7, 1, '2024-01-20', 27900.00, 5), (8, 5, '2024-01-22', 31000.00, 3),
(9, 1, '2024-01-25', 28100.00, 6), (10, 8, '2024-01-27', 26000.00, 1),
(11, 1, '2024-01-28', 28300.00, 7), (12, 9, '2024-01-29', 31400.00, 2),
(13, 1, '2024-01-30', 27700.00, 8), (14, 10, '2024-01-31', 33000.00, 3),
(1, 1, '2024-01-03', 28050.00, 4), (2, 1, '2024-01-06', 27950.00, 5),
(3, 8, '2024-01-09', 26100.00, 6), (4, 1, '2024-01-11', 28150.00, 7),
(5, 8, '2024-01-13', 26200.00, 8), (6, 1, '2024-01-16', 27850.00, 1),
(7, 8, '2024-01-19', 25900.00, 2), (8, 1, '2024-01-21', 28250.00, 3),
(9, 8, '2024-01-23', 26050.00, 4), (10, 1, '2024-01-26', 28000.00, 5),
(11, 8, '2024-01-24', 26150.00, 6),

(12, 2, '2024-02-01', 24600.00, 7), (13, 2, '2024-02-03', 24700.00, 8),
(14, 2, '2024-02-05', 24550.00, 1), (15, 2, '2024-02-07', 24650.00, 2),
(1, 2, '2024-02-09', 24750.00, 3), (2, 2, '2024-02-11', 24500.00, 4),
(3, 2, '2024-02-13', 24800.00, 5), (4, 2, '2024-02-15', 24450.00, 6),
(5, 2, '2024-02-17', 24900.00, 7), (6, 2, '2024-02-19', 24400.00, 8),
(7, 2, '2024-02-21', 24850.00, 1), (8, 2, '2024-02-23', 24350.00, 2),
(9, 2, '2024-02-25', 24950.00, 3), (10, 15, '2024-02-27', 45000.00, 4),
(11, 16, '2024-02-28', 29500.00, 5), (12, 17, '2024-02-26', 38200.00, 6),
(13, 18, '2024-02-24', 42400.00, 7), (14, 19, '2024-02-22', 37700.00, 8),
(15, 20, '2024-02-20', 27300.00, 1), (1, 21, '2024-02-18', 52600.00, 2),
(2, 22, '2024-02-16', 58700.00, 3), (3, 23, '2024-02-14', 68200.00, 4),

(4, 24, '2024-03-01', 72100.00, 5), (5, 25, '2024-03-03', 54500.00, 6),
(6, 26, '2024-03-05', 71000.00, 7), (7, 27, '2024-03-07', 78700.00, 8),
(8, 28, '2024-03-09', 48400.00, 1), (9, 29, '2024-03-11', 55600.00, 2),
(10, 30, '2024-03-13', 64100.00, 3), (11, 3, '2024-03-15', 32200.00, 4),
(12, 4, '2024-03-17', 38700.00, 5), (13, 5, '2024-03-19', 31100.00, 6),
(14, 6, '2024-03-21', 39600.00, 7), (15, 7, '2024-03-23', 35400.00, 8),
(1, 9, '2024-03-25', 31500.00, 1), (2, 10, '2024-03-27', 33100.00, 2),
(3, 11, '2024-03-29', 42300.00, 3),

(4, 12, '2024-04-01', 40600.00, 4), (5, 13, '2024-04-03', 44000.00, 5),
(6, 14, '2024-04-05', 38100.00, 6), (7, 1, '2024-04-07', 28400.00, 7),
(8, 2, '2024-04-09', 24900.00, 8), (9, 8, '2024-04-11', 26300.00, 1),
(10, 8, '2024-04-13', 26150.00, 2), (11, 8, '2024-04-15', 26250.00, 3),
(12, 8, '2024-04-17', 26100.00, 4), (13, 8, '2024-04-19', 26350.00, 5),
(14, 8, '2024-04-21', 26050.00, 6), (15, 8, '2024-04-23', 26400.00, 7),
(1, 8, '2024-04-25', 26000.00, 8), (2, 8, '2024-04-27', 26450.00, 1),
(3, 8, '2024-04-29', 25950.00, 2), (4, 9, '2024-04-28', 31600.00, 3),
(5, 10, '2024-04-26', 33200.00, 4), (6, 11, '2024-04-24', 42400.00, 5),
(7, 12, '2024-04-22', 40700.00, 6), (8, 13, '2024-04-20', 44100.00, 7),
(9, 14, '2024-04-18', 38000.00, 8);

INSERT INTO ServiceRecords (CarID, ServiceDate, ServiceType, Cost, TechnicianID) VALUES
(1, '2024-01-15', 'Oil Change', 75.00, 101),
(2, '2024-01-20', 'Oil Change', 80.00, 102),
(3, '2024-02-10', 'Oil Change', 85.00, 103),
(4, '2024-02-15', 'Oil Change', 90.00, 101),
(5, '2024-03-05', 'Oil Change', 70.00, 102),

(6, '2024-01-25', 'Brake Service', 320.00, 104),
(7, '2024-02-05', 'Brake Service', 380.00, 105),
(8, '2024-02-20', 'Brake Service', 340.00, 104),
(9, '2024-03-10', 'Brake Service', 360.00, 105),
(10, '2024-03-25', 'Brake Service', 350.00, 104),

(11, '2024-01-30', 'Transmission Repair', 750.00, 106),
(12, '2024-02-25', 'Transmission Repair', 850.00, 107),
(13, '2024-03-15', 'Transmission Repair', 820.00, 106),
(14, '2024-03-30', 'Transmission Repair', 780.00, 107),

(15, '2024-02-08', 'Engine Service', 580.00, 108),
(16, '2024-02-28', 'Engine Service', 620.00, 109),
(17, '2024-03-18', 'Engine Service', 600.00, 108),

(18, '2024-01-12', 'AC Repair', 420.00, 110),
(19, '2024-02-12', 'AC Repair', 480.00, 111),
(20, '2024-03-12', 'AC Repair', 450.00, 110),

(21, '2024-01-08', 'Major Service', 680.00, 112),
(22, '2024-02-18', 'Major Service', 720.00, 113),
(23, '2024-03-28', 'Major Service', 700.00, 112);


-- PART 1: Basic Aggregate Functions
-- 1. Find the total number of customers in the database
SELECT COUNT(*) AS TotalCustomers
FROM Customers;

-- 2. Calculate the average sale price of all car sales
SELECT AVG(SalePrice) AS AverageSalePrice
FROM Sales;

-- 3. Find the most expensive car ever sold
SELECT MAX(SalePrice) AS MostExpensiveCarSold
FROM Sales;

-- 4. Determine the total inventory count of all cars in the showroom
SELECT SUM(InventoryCount) AS TotalInventoryCount
FROM Cars;

-- 5. Find the earliest and most recent sale dates
SELECT MIN(SaleDate) AS EarliestSaleDate, 
       MAX(SaleDate) AS MostRecentSaleDate
FROM Sales;

-- PART 2: GROUP BY Exercises

-- 1. Group cars by brand and count how many models each brand has
SELECT Brand, COUNT(*) AS ModelCount
FROM Cars
GROUP BY Brand;

-- 2. Calculate the total sales amount for each salesperson
SELECT s.Name, SUM(sa.SalePrice) AS TotalSalesAmount
FROM Salespersons s
JOIN Sales sa ON s.SalespersonID = sa.SalespersonID
GROUP BY s.SalespersonID, s.Name;

-- 3. Find the average sale price for each car model
SELECT c.Model, AVG(s.SalePrice) AS AverageSalePrice
FROM Cars c
JOIN Sales s ON c.CarID = s.CarID
GROUP BY c.CarID, c.Model;

-- 4. For each service type, find the average service cost
SELECT ServiceType, AVG(Cost) AS AverageServiceCost
FROM ServiceRecords
GROUP BY ServiceType;

-- 5. Find the count of cars by brand and color combination from the cars table
SELECT Brand, Color, COUNT(*) AS CarCount
FROM Cars
GROUP BY Brand, Color;

-- PART 3: HAVING Clause Exercises

-- 1. Identify brands that offer more than five different car models
SELECT Brand, COUNT(*) AS ModelCount
FROM Cars
GROUP BY Brand
HAVING COUNT(*) > 5;

-- 2. List car models that have been sold more than 10 times
SELECT c.Model, COUNT(s.SaleID) AS SalesCount
FROM Cars c
JOIN Sales s ON c.CarID = s.CarID
GROUP BY c.CarID, c.Model
HAVING COUNT(s.SaleID) > 10;

-- 3. Find salespersons whose average sale price is greater than 50,000
SELECT sp.Name, AVG(s.SalePrice) AS AverageSalePrice
FROM Salespersons sp
JOIN Sales s ON sp.SalespersonID = s.SalespersonID
GROUP BY sp.SalespersonID, sp.Name
HAVING AVG(s.SalePrice) > 50000;

-- 4. Identify months that had more than 20 sales
SELECT YEAR(SaleDate) AS SaleYear, 
       MONTH(SaleDate) AS SaleMonth,
       MONTHNAME(SaleDate) AS MonthName,
       COUNT(*) AS SalesCount
FROM Sales
GROUP BY YEAR(SaleDate), MONTH(SaleDate)
HAVING COUNT(*) > 20;

-- 5. Find service types where the average cost is greater than 500
SELECT ServiceType, AVG(Cost) AS AverageServiceCost
FROM ServiceRecords
GROUP BY ServiceType
HAVING AVG(Cost) > 500;
