CREATE DATABASE SalesManagement;
USE SalesManagement;

CREATE TABLE Customer (
    CustomerID VARCHAR(10) PRIMARY KEY,
    CustomerName NVARCHAR(100),
    Address NVARCHAR(100),
    Phone VARCHAR(15)
);

CREATE TABLE Product (
    ProductID VARCHAR(10) PRIMARY KEY,
    ProductName NVARCHAR(100),
    HangSanXuat NVARCHAR(100),
    Price FLOAT
);

CREATE TABLE Orders (
    OrderID VARCHAR(10) PRIMARY KEY,
    CustomerID VARCHAR(10),
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE Order_Detail (
    OrderID VARCHAR(10),
    ProductID VARCHAR(10),
    Quantity INT,
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

ALTER TABLE Orders ADD GhiChu NVARCHAR(255);

ALTER TABLE Product RENAME COLUMN HangSanXuat TO NhaSanXuat;

DROP TABLE Order_Detail;
DROP TABLE Orders;

INSERT INTO Customer VALUES 
('KH001', N'Nguyen Van A', N'TPHCM', '0901'),
('KH002', N'Tran Thi B', N'Hanoi', '0902'),
('KH003', N'Le Van C', N'TPHCM', NULL),
('KH004', N'Pham Thi D', N'Danang', '0904'),
('KH005', N'Hoang Van E', N'TPHCM', '0905');

INSERT INTO Product VALUES
('SP001', N'iPhone 13', N'Apple', 15000000),
('SP002', N'iPhone 14', N'Apple', 20000000),
('SP003', N'Samsung S22', N'Samsung', 12000000),
('SP004', N'Oppo Reno', N'Oppo', 8000000),
('SP005', N'Xiaomi 12', N'Xiaomi', 10000000);

INSERT INTO Orders VALUES
('DH001', 'KH001', '2024-01-01', NULL),
('DH002', 'KH002', '2024-01-02', NULL),
('DH003', 'KH001', '2024-01-03', NULL),
('DH004', 'KH004', '2024-01-04', NULL),
('DH005', 'KH005', '2024-01-05', NULL);

INSERT INTO Order_Detail VALUES
('DH001', 'SP001', 1),
('DH001', 'SP003', 2),
('DH002', 'SP002', 1),
('DH003', 'SP004', 3),
('DH004', 'SP005', 2);

UPDATE Product
SET Price = Price * 1.1
WHERE NhaSanXuat = 'Apple';

DELETE FROM Customer
WHERE Phone IS NULL;

SELECT * FROM Product
WHERE Price BETWEEN 10000000 AND 20000000;

SELECT * FROM Orders
WHERE OrderID = 'DH001';

SELECT o.OrderID, o.OrderDate
FROM Orders o
JOIN Customer c ON o.CustomerID = c.CustomerID
WHERE c.Address = N'TPHCM';