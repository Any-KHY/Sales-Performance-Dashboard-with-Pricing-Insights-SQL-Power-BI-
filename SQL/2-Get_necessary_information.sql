USE sale_project;

-- Combine necessary information from different order tables

WITH all_orders AS (
SELECT 
	OrderID, 
	CustomerID, 
	ProductID, 
    Order_Date, 
    Quantity, 
    Revenue, 
    COGS
FROM order2023
UNION ALL
SELECT 
	OrderID, 
	CustomerID, 
	ProductID, 
    Order_Date, 
    Quantity, 
    Revenue, 
    COGS
FROM order2024
UNION ALL
SELECT 
	OrderID, 
	CustomerID, 
	ProductID, 
    Order_Date, 
    Quantity, 
    Revenue, 
    COGS
FROM order2025)

-- Building the main dataset query
SELECT 
Orders.OrderID,
Orders.CustomerID, 
customers.Region,
Orders.ProductID,
products.Product_Name,
products.Product_Category,
products.Price,
products.Base_Cost,
Orders.Order_Date, 
DAYNAME(Orders.Order_Date) AS Weekday,
DATE_SUB(Orders.Order_Date, INTERVAL WEEKDAY(Orders.Order_Date) DAY) AS Week_Date,
customers.Customer_Join_Date,
Orders.Quantity,
Orders.Revenue,
CASE WHEN Orders.Revenue = 0 THEN ROUND(products.Price*Orders.Quantity,2) ELSE Orders.Revenue END AS Cleaned_Revenues,
ROUND(products.Price*Orders.Quantity-Orders.COGS,2) AS Profit,
Orders.COGS 
FROM all_orders AS Orders

LEFT JOIN customers
ON Orders.CustomerID = customers.CustomerID

LEFT JOIN products
ON Orders.ProductID = products.ProductID

WHERE Orders.CustomerID != "" -- Drop the one with NO customerID
;


