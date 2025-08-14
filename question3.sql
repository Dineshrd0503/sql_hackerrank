/*
    Problem Statement:
    ------------------
    For every month:
    - Find how many orders are delivered within 10 days or less from the order date.
    - Only include that month in the results if the **average delivery time**
      (across all orders in that month) is less than 14 days.

    Requirements:
    - Group results by the month of the order date.
    - Count total qualifying orders per month (<10 days delivery).
    - Check monthly average delivery time < 14.
    - Sort results by month number (Jan = 1, ... Dec = 12).
*/

-- 1️⃣ Drop table if it already exists
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
(2001, 501, 9001, '2021-01-05', 11, '2021-01-07', '2021-01-12', 1500.00), -- 7 days
(2002, 502, 9002, '2021-01-15', 12, '2021-01-18', '2021-01-25', 2200.00), -- 10 days
(2003, 503, 9003, '2021-01-20', 13, '2021-01-22', '2021-02-10', 1750.00), -- 21 days
(2004, 504, 9004, '2021-02-01', 14, '2021-02-03', '
