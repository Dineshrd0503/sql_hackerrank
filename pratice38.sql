-- File: employees_salary_match.sql
-- Generated on: 2025-07-15 22:38 IST
-- Description: This SQL file contains the table schema, problem statement, query, and sample output
-- to display employees whose salaries match another employee's salary.

-- Problem Statement:
-- Display employees whose salaries match at least one other employee's salary.
-- The query should use the 'employees' and 'employee_dept' tables, joined via the 'eid' column.
-- Return the employee name, department, and salary for employees whose salary is shared
-- by at least one other employee, excluding those with unique salaries.

-- Table Schema:
-- Table: employees
-- Columns: eid (INT PRIMARY KEY), name (VARCHAR(50))
CREATE TABLE employees (
    eid INT PRIMARY KEY,
    name VARCHAR(50)
);

-- Table: employee_dept
-- Columns: eid (INT), dept (VARCHAR(50)), salary (INT)
-- Foreign Key: eid references employees(eid)
CREATE TABLE employee_dept (
    eid INT,
    dept VARCHAR(50),
    salary INT,
    FOREIGN KEY (eid) REFERENCES employees(eid)
);

-- Insert Sample Data into employees
INSERT INTO employees (eid, name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'David');

-- Insert Sample Data into employee_dept
INSERT INTO employee_dept (eid, dept, salary) VALUES
(1, 'HR', 5000),
(2, 'IT', 6000),
(3, 'HR', 5000),
(4, 'IT', 6000);

-- SQL Query:
-- Query to find employees whose salaries match another employee's salary
SELECT 
    e.name AS name,
    d.dept AS dept,
    d.salary AS salary
FROM 
    employees e
JOIN 
    employee_dept d
ON 
    e.eid = d.eid
WHERE 
    d.salary IN (
        SELECT salary
        FROM employee_dept
        GROUP BY salary
        HAVING COUNT(*) > 1
    )
ORDER BY 
    d.salary, e.name;

-- Expected Output:
-- Sample output based on the inserted data
-- name    dept    salary
-- Alice   HR      5000
-- Charlie HR      5000
-- Bob     IT      6000
-- David   IT      6000