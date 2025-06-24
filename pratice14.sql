-- SQL File: Visits Without Transactions Analysis
-- Generated on: June 21, 2025 at 09:43 PM IST

-- Problem Statement:
-- In a mall management system, the task is to identify customers who visited the mall without making any transactions and determine the number of such visits for each customer. This analysis helps assess visitor engagement and potential sales opportunities, focusing on visits where no purchase was recorded. The result should list each customer's ID and the count of their visits without transactions, presented in any order.

-- Table Schemas:
-- Table: Visits
-- Columns:
--   visit_id (int): Unique identifier for each visit.
--   customer_id (int): The ID of the customer who visited the mall.
-- Table: Transactions
-- Columns:
--   transaction_id (int): Unique identifier for each transaction.
--   visit_id (int): The ID of the visit associated with the transaction.
--   amount (int): The transaction amount.

-- SQL Code:
SELECT 
    v.customer_id,
    COUNT(*) AS count_no_trans
FROM Visits v
LEFT JOIN Transactions t ON v.visit_id = t.visit_id
WHERE t.transaction_id IS NULL
GROUP BY v.customer_id;

-- Order of Execution:
-- 1. FROM and LEFT JOIN: Accesses the 'Visits' table and joins with 'Transactions' on 'visit_id', including all visits even if no transaction exists.
-- 2. WHERE: Filters rows where 't.transaction_id IS NULL', retaining only visits with no transactions.
-- 3. GROUP BY: Groups the filtered rows by 'customer_id' to count visits per customer.
-- 4. SELECT: Computes COUNT(*) as 'count_no_trans' for each group and selects 'customer_id'.
-- Note: The logical order differs from the written order due to SQL's declarative nature, where the database optimizes based on dependencies.