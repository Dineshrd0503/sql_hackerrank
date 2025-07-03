-- SQL File: Customers Never Ordered Analysis
-- Generated on: July 02, 2025 at 09:26 PM IST

-- Problem Statement:
-- The task is to find all customers from the Customers table who never order anything, based on the Orders table. This analysis is useful for identifying inactive customers for marketing outreach or account reviews, ensuring focus on engagement strategies.

-- Table Schemas:
-- Table: Customers
-- Columns:
--   id (int): Primary key, unique identifier for each customer.
--   name (varchar): The name of the customer.
-- Table: Orders
-- Columns:
--   id (int): Primary key, unique identifier for each order.
--   customerId (int): Foreign key referencing Customers.id, indicating the customer who placed the order.

-- Sample Data:
-- Inserting sample data into the Customers table
INSERT INTO Customers (id, name) VALUES
(1, 'Joe'),
(2, 'Henry'),
(3, 'Sam'),
(4, 'Max');

-- Inserting sample data into the Orders table
INSERT INTO Orders (id, customerId) VALUES
(1, 3),
(2, 1);

-- SQL Code:
SELECT name AS Customers
FROM Customers
WHERE id NOT IN (SELECT customerId FROM Orders);

-- Order of Execution:
-- 1. FROM: Accesses the 'Customers' table as the data source.
-- 2. Subquery (SELECT customerId FROM Orders): Retrieves all customer IDs that have placed orders.
-- 3. WHERE id NOT IN: Filters the 'Customers' table to exclude rows where the 'id' matches any value from the subquery, identifying customers with no orders.
-- 4. SELECT name AS Customers: Retrieves the 'name' column, aliased as 'Customers', for the filtered rows.
-- Note: The logical order differs from the written order due to SQL's declarative nature, where the subquery is evaluated first, followed by the filter and projection, optimized by the database.