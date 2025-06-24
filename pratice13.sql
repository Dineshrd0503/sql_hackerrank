-- SQL File: Worker Count Analysis by Department
-- Generated on: June 21, 2025 at 09:16 PM IST

-- Problem Statement:
-- In an organization aiming to optimize its workforce planning for the second half of the fiscal year, the task is to analyze the distribution of workers across departments based on their joining dates. Specifically, the goal is to count the number of employees who joined on or after April (the start of the second quarter) in each department, reflecting recent hiring trends. The result should present each department alongside the total number of such workers, sorted in descending order to identify departments with the highest recent recruitment activity, aiding strategic resource allocation and team expansion decisions.

-- Table Schema:
-- Table: worker
-- Columns:
--   worker_id (bigint): Unique identifier for each worker.
--   department (text): The department name the worker belongs to.
--   joining_date (date): The date the worker joined the organization.

-- SQL Code:
SELECT department, COUNT(worker_id) AS workers
FROM worker
WHERE MONTH(joining_date) >= 4
GROUP BY department
ORDER BY workers DESC;

-- Order of Execution:
-- 1. FROM: Accesses the 'worker' table as the data source.
-- 2. WHERE: Filters rows where MONTH(joining_date) >= 4, keeping only workers who joined in April or later.
-- 3. GROUP BY: Groups the filtered rows by 'department' to prepare for counting.
-- 4. SELECT: Computes COUNT(worker_id) AS workers for each group and selects 'department'.
-- 5. ORDER BY: Sorts the results by 'workers' in descending order (DESC).
-- Note: The logical order differs from the written order due to SQL's declarative nature, where the database optimizes based on dependencies.
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