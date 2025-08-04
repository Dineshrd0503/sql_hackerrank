-- Problem Statement
-- Problem: Find the average years of experience for employees working on each project.
-- Description: Given two tables, `Project` and `Employee`, compute the average experience years for employees 
-- associated with each project. The result should include the `project_id` and the average years of experience 
-- (`average_years`), rounded to 2 decimal places. If a project has no assigned employees, it should not be 
-- included in the result (implicitly handled by an inner join).
-- Output Format: Return the result table with columns `project_id` and `average_years`, ordered by `project_id` 
-- for consistency.
-- Example:
-- Input:
-- Project table:
-- project_id | employee_id
-- ---------- | -----------
-- 1          | 1
-- 1          | 2
-- 2          | 3
-- 3          | 4
-- Employee table:
-- employee_id | name        | experience_years
-- ----------- | ----------- | ----------------
-- 1           | Alice       | 5.0
-- 2           | Bob         | 3.5
-- 3           | Charlie     | 7.0
-- 4           | David       | 2.0
-- Expected Output:
-- project_id | average_years
-- ---------- | -------------
-- 1          | 4.25
-- 2          | 7.00
-- 3          | 2.00
-- Explanation:
-- For project_id = 1: Average = (5.0 + 3.5) / 2 = 4.25
-- For project_id = 2: Average = 7.0 / 1 = 7.00
-- For project_id = 3: Average = 2.0 / 1 = 2.00

-- Table Schemas

-- Table: Employee
CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    experience_years DECIMAL(5,2)
);

-- Table: Project
CREATE TABLE Project (
    project_id INT,
    employee_id INT,
    PRIMARY KEY (project_id)
);

-- Sample Data Insertion
INSERT INTO Employee (employee_id, name, experience_years) VALUES
(1, 'Alice', 5.0),
(2, 'Bob', 3.5),
(3, 'Charlie', 7.0),
(4, 'David', 2.0);

INSERT INTO Project (project_id, employee_id) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4);

-- MySQL Query
SELECT 
    p.project_id,
    ROUND(AVG(e.experience_years), 2) AS average_years
FROM 
    Project p
JOIN 
    Employee e ON p.employee_id = e.employee_id
GROUP BY 
    p.project_id
ORDER BY 
    p.project_id;


ject_id;
