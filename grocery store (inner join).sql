-- Създай нова база
DROP DATABASE IF EXISTS w3schools;
CREATE DATABASE w3schools;
USE w3schools;

-- Таблица: Customers
CREATE TABLE Customers (
  CustomerID INT PRIMARY KEY,
  CustomerName VARCHAR(255),
  ContactName VARCHAR(255),
  Address VARCHAR(255),
  City VARCHAR(100),
  PostalCode VARCHAR(20),
  Country VARCHAR(100)
);

INSERT INTO Customers VALUES
(1,'Alfreds Futterkiste','Maria Anders','Obere Str. 57','Berlin','12209','Germany'),
(2,'Ana Trujillo Emparedados y helados','Ana Trujillo','Avda. de la Constitución 2222','México D.F.','05021','Mexico'),
(3,'Antonio Moreno Taquería','Antonio Moreno','Mataderos 2312','México D.F.','05023','Mexico');

-- Таблица: Categories
CREATE TABLE Categories (
  CategoryID INT PRIMARY KEY,
  CategoryName VARCHAR(100),
  Description TEXT
);

INSERT INTO Categories VALUES
(1,'Beverages','Soft drinks, coffees, teas, beers, and ales'),
(2,'Condiments','Sweet and savory sauces, relishes, spreads, and seasonings');

-- Таблица: Products
CREATE TABLE Products (
  ProductID INT PRIMARY KEY,
  ProductName VARCHAR(255),
  SupplierID INT,
  CategoryID INT,
  Unit VARCHAR(100),
  Price DECIMAL(10,2)
);

INSERT INTO Products VALUES
(1,'Chais',1,1,'10 boxes x 20 bags',18.00),
(2,'Chang',1,1,'24 - 12 oz bottles',19.00),
(3,'Aniseed Syrup',1,2,'12 - 550 ml bottles',10.00);

-- Таблица: Orders
CREATE TABLE Orders (
  OrderID INT PRIMARY KEY,
  CustomerID INT,
  EmployeeID INT,
  OrderDate DATE,
  ShipperID INT
);

INSERT INTO Orders VALUES
(10308,2,7,'1996-09-18',3),
(10309,37,3,'1996-09-19',1),
(10310,77,8,'1996-09-20',2);

-- Таблица: OrderDetails
CREATE TABLE OrderDetails (
  OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
  OrderID INT,
  ProductID INT,
  Quantity INT
);

INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES
(10308,1,12),
(10308,2,10),
(10309,3,5);

-- Таблица: Employees
CREATE TABLE Employees (
  EmployeeID INT PRIMARY KEY,
  LastName VARCHAR(100),
  FirstName VARCHAR(100),
  BirthDate DATE,
  Photo VARCHAR(255),
  Notes TEXT
);

INSERT INTO Employees VALUES
(1,'Davolio','Nancy','1968-12-08','nancy.jpg','Experienced sales representative.'),
(2,'Fuller','Andrew','1952-02-19','andrew.jpg','Vice president, sales.');

-- Таблица: Shippers
CREATE TABLE Shippers (
  ShipperID INT PRIMARY KEY,
  ShipperName VARCHAR(100),
  Phone VARCHAR(50)
);

INSERT INTO Shippers VALUES
(1,'Speedy Express','(503) 555-9831'),
(2,'United Package','(503) 555-3199'),
(3,'Federal Shipping','(503) 555-9931');

SELECT ProductID, ProductName, CategoryName
FROM Products
INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID;