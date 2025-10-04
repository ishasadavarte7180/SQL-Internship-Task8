-- schema.sql
CREATE DATABASE IF NOT EXISTS ShopDB;
USE ShopDB;

CREATE TABLE IF NOT EXISTS Customers (
  CustomerID INT AUTO_INCREMENT PRIMARY KEY,
  Name VARCHAR(100),
  Email VARCHAR(150)
);

CREATE TABLE IF NOT EXISTS Orders (
  OrderID INT AUTO_INCREMENT PRIMARY KEY,
  CustomerID INT,
  Amount DECIMAL(10,2),
  OrderDate DATE DEFAULT (CURDATE()),
  FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- some sample data
INSERT INTO Customers (Name, Email) VALUES
('Isha Sadavarte','isha@example.com'),
('Rahul Sharma','rahul@example.com');

INSERT INTO Orders (CustomerID, Amount) VALUES
(1, 120.50),
(1, 80.00),
(2, 200.00);
