
-- Problem Statement:
-- The task is to write a SQL query to find the second highest salary from the Employee table. If there is no second highest salary (e.g., fewer than two distinct salaries), the query should return NULL. This analysis is useful for identifying salary hierarchies within an organization, aiding in compensation reviews.

-- Table Schema:
-- Table: Employee
-- Columns:
--   id (int): Unique identifier for each employee (primary key).
--   salary (int): The salary of the employee.


-- SQL Code:
SELECT 
    IFNULL(
        (SELECT DISTINCT salary
         FROM Employee
         ORDER BY salary DESC
         LIMIT 1 OFFSET 1),
        NULL
    ) AS SecondHighestSalary;

-- Order of Execution:
-- 1. FROM: Accesses the 'Employee' table as the data source.
-- 2. SELECT DISTINCT: Retrieves unique salary values to handle duplicates.
-- 3. ORDER BY: Sorts the distinct salaries in descending order.
-- 4. LIMIT and OFFSET: Selects the second row (OFFSET 1 skips the highest, LIMIT 1 takes the next).
-- 5. IFNULL: Wraps the subquery, returning NULL if no second salary exists (e.g., fewer than 2 distinct values).
-- Note: The logical order differs from the written order due to SQL's declarative nature, where the database optimizes the subquery execution first.