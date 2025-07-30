-- -------------------------------------------------------------------
-- Problem Statement:
-- 
-- Given a table 'Employee' with the following columns:
--
-- | Column Name | Type     |
-- |-------------|----------|
-- | id          | int      |  -- Primary key
-- | name        | varchar  |  -- Employee's name
-- | salary      | int      |  -- Employee's salary
-- | managerId   | int      |  -- Foreign key to 'id' (employee’s manager)
--
-- Write a SQL query to find the names of employees who earn more than
-- their respective managers.
--
-- Return the result table with a single column: 'Employee'
-- The output can be in any order.
--
-- Example:
-- Input table:
-- +----+--------+--------+-----------+
-- | id | name   | salary | managerId |
-- +----+--------+--------+-----------+
-- | 1  | Joe    | 70000  | 3         |
-- | 2  | Henry  | 80000  | 4         |
-- | 3  | Sam    | 60000  | NULL      |
-- | 4  | Max    | 90000  | NULL      |
-- +----+--------+--------+-----------+
--
-- Output:
-- +----------+
-- | Employee |
-- +----------+
-- | Joe      |
-- +----------+
--
-- -------------------------------------------------------------------

-- STEP 1: Create the Employee table (if not exists)
DROP TABLE IF EXISTS Employee;

CREATE TABLE Employee (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary INT,
    managerId INT,
    FOREIGN KEY (managerId) REFERENCES Employee(id)
);

-- NOTE: Insert statements are intentionally excluded.
-- You can populate the table as needed via INSERT commands.

-- -------------------------------------------------------------------
-- STEP 2: Query to find employees who earn more than their managers
-- -------------------------------------------------------------------

SELECT e.name AS Employee
FROM Employee e
WHERE e.managerId IS NOT NULL
  AND e.salary > (
      SELECT m.salary
      FROM Employee m
      WHERE m.id = e.managerId
  );

-- -------------------------------------------------------------------
-- Execution Order Notes:
-- 1. FROM clause is processed (assign alias 'e' to Employee).
-- 2. WHERE clause is evaluated:
--    - e.managerId IS NOT NULL
--    - Subquery retrieves manager's salary using e.managerId.
-- 3. The salaries are compared.
-- 4. Rows where employee's salary > manager's salary are returned.
-- 5. SELECT clause finalizes the output with column alias 'Employee'.
-- -------------------------------------------------------------------
