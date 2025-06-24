-- Problem Statement:
-- Find all orders from the 'orders' table where the quantity is greater than the average quantity of all orders.
-- The result should include the order_id and quantity columns for each qualifying order.

-- Step 1: Create the 'orders' table schema
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    quantity DECIMAL(10, 2) NOT NULL
);

-- Step 2: Insert sample data into the 'orders' table
INSERT INTO orders (order_id, quantity) VALUES
(1, 100.00),
(2, 50.00),
(3, 75.00),
(4, 25.00);

-- Step 3: Query to find orders with quantity greater than the average quantity
SELECT order_id, quantity
FROM orders
WHERE quantity > (SELECT AVG(quantity) FROM orders);

-- Order of Execution:
-- 1. Execute the CREATE TABLE statement to set up the 'orders' table.
-- 2. Execute the INSERT statements to populate the table with sample data.
-- 3. Execute the SELECT query to retrieve orders where quantity exceeds the average quantity.
-- Note: The subquery (SELECT AVG(quantity) FROM orders) calculates the average quantity (e.g., 62.50 for the sample data),
-- and the main query returns orders with quantities greater than this average (e.g., order_id 1 with 100.00 and order_id 3 with 75.00).

-- Expected Output (based on sample data):
-- order_id | quantity
-- 1        | 100.00
-- 3        | 75.00