/*
    Problem Statement:
    ------------------
    For every month:
    - Find the number of orders that have **even OrderIDs**.
    - Only count those orders for each month.
    - Sort the results by month (January = 1, ... December = 12).

    Requirements:
    - Group by month of order date.
    - Filter only even OrderIDs (OrderID % 2 = 0).
    - Count how many such orders exist each month.
*/

--1️⃣ Drop table if it already exists
DROP TABLE IF EXISTS orders_data;

-- 2️⃣ Create schema
CREATE TABLE orders_data (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    PaymentID INT,
    OrderDate DATE,
    ShipperID INT,
    ShipDate DATE,
    DeliveryDate DATE,
    Total_order_amount DECIMAL(12,2)
);

-- 3️⃣ Insert sample data
INSERT INTO orders_data
(OrderID, CustomerID, PaymentID, OrderDate, ShipperID, ShipDate, DeliveryDate, Total_order_amount) VALUES
(2002, 501, 9001, '2021-01-05', 11, '2021-01-07', '2021-01-12', 1500.00), -- even
(2003, 502, 9002, '2021-01-15', 12, '2021-01-18', '2021-01-25', 2200.00), -- odd
(2004, 503, 9003, '2021-02-01', 13, '2021-02-03', '2021-02-08', 1750.00), -- even
(2006, 504, 9004, '2021-02-20', 14, '2021-02-22', '2021-03-05', 2500.00), -- even
(2008, 505, 9005, '2021-03-10', 15, '2021-03-12', '2021-03-19', 3500.00), -- even
(2009, 506, 9006, '2021-03-15', 16, '2021-03-16', '2021-03-29', 5000.00); -- odd

-- 4️⃣ Query: Count only even OrderIDs grouped by month
SELECT 
    MONTH(OrderDate) AS month,
    COUNT(*) AS even_order_count
FROM orders_data
WHERE OrderID % 2 = 0
GROUP BY MONTH(OrderDate)
ORDER BY month;
