-- Use SQL script to bulid database and extract data we needed
-- Step 1 Create database

CREATE DATABASE sale_project;	# 1-1 Create Schema
USE sale_project;	# 1-2 Select Schema

-- 1-3 Create table and Import data from csv file
-- 1-3-0 Turn on local infile
SHOW VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;
SHOW VARIABLES LIKE 'local_infile';

-- 1-3-1 Customer table
DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
	CustomerID VARCHAR(500),
    Region VARCHAR(100),
    Customer_Join_Date DATE);

LOAD DATA LOCAL INFILE 'C:/Users/any31/Desktop/Data_Analysis_Project/customers.csv'
INTO TABLE customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(CustomerID, Region, Customer_Join_Date);

-- 1-3-2 Products table
DROP TABLE IF EXISTS products;
CREATE TABLE products (
	ProductID VARCHAR(20),
    Product_Name VARCHAR(100),
    Product_Category VARCHAR(100),
    Price DOUBLE,
    Base_Cost DOUBLE);
    
LOAD DATA LOCAL INFILE 'C:/Users/any31/Desktop/Data_Analysis_Project/products.csv'
INTO TABLE products
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(ProductID, Product_Name, Product_Category, Price, Base_Cost);


-- 1-3-3 Order tables(2023-205)
DROP TABLE IF EXISTS order2023;
CREATE TABLE order2023 (
	OrderID VARCHAR(200),
    CustomerID VARCHAR(500),
    ProductID VARCHAR(20),
    Order_Date DATE,
    Quantity INT,
    Revenue DOUBLE,
    COGS DOUBLE,
    Source_File VARCHAR(500));
    
LOAD DATA LOCAL INFILE 'C:/Users/any31/Desktop/Data_Analysis_Project/Orders_2023.csv'
INTO TABLE order2023
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(OrderID, CustomerID, ProductID, Order_Date, Quantity, Revenue, COGS, Source_File); 

SHOW WARNINGS; -- Warning cause by blank revenue

DROP TABLE IF EXISTS order2024;
CREATE TABLE order2024 (
	OrderID VARCHAR(200),
    CustomerID VARCHAR(500),
    ProductID VARCHAR(20),
    Order_Date DATE,
    Quantity INT,
    Revenue DOUBLE,
    COGS DOUBLE,
    Source_File VARCHAR(500));
    
LOAD DATA LOCAL INFILE 'C:/Users/any31/Desktop/Data_Analysis_Project/Orders_2024.csv'
INTO TABLE order2024
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(OrderID, CustomerID, ProductID, Order_Date, Quantity, Revenue, COGS, Source_File); 

DROP TABLE IF EXISTS order2025;
CREATE TABLE order2025 (
	OrderID VARCHAR(200),
    CustomerID VARCHAR(500),
    ProductID VARCHAR(20),
    Order_Date DATE,
    Quantity INT,
    Revenue DOUBLE,
    COGS DOUBLE,
    Source_File VARCHAR(500));
    
LOAD DATA LOCAL INFILE 'C:/Users/any31/Desktop/Data_Analysis_Project/Orders_2025.csv'
INTO TABLE order2025
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(OrderID, CustomerID, ProductID, @Order_Date, Quantity, Revenue, COGS, Source_File)
SET Order_Date = STR_TO_DATE(@Order_Date, '%m/%d/%Y'); 

    


