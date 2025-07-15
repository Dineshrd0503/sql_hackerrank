-- File: youngest_employee_per_dept.sql
-- Generated on: 2025-07-15 23:10 IST
-- Description: This SQL file contains the table schema, sample data, problem statement, query,
-- and sample output to find the youngest employee in each department.

-- Problem Statement:
-- Find the youngest employee in each department. The query should use the 'employees' and
-- 'employee_dept' tables, joined via the 'EID' column. Utilize the 'DOB' (date of birth)
-- column from the 'employees' table to calculate age using TIMESTAMPDIFF. Return the employee
-- name, calculated age, and department for the youngest employee in each department. Handle
-- cases where multiple employees in a department have the same minimum age by including all.

-- Table Schema:
-- Table: employees
-- Columns: EID (INT PRIMARY KEY), NAME (VARCHAR(100)), ADDR1 (VARCHAR(100)), ADDR2 (VARCHAR(100)),
--          CITY (VARCHAR(50)), PHONE (VARCHAR(15)), EMAIL (VARCHAR(100)), DOB (DATE), DOJ (DATE)
CREATE TABLE employees (
    EID INT PRIMARY KEY,
    NAME VARCHAR(100),
    ADDR1 VARCHAR(100),
    ADDR2 VARCHAR(100),
    CITY VARCHAR(50),
    PHONE VARCHAR(15),
    EMAIL VARCHAR(100),
    DOB DATE,
    DOJ DATE
);

-- Table: employee_dept
-- Columns: eid (INT), dept (VARCHAR(50)), salary (INT)
-- Foreign Key: eid references employees(EID)
CREATE TABLE employee_dept (
    eid INT,
    dept VARCHAR(50),
    salary INT,
    FOREIGN KEY (eid) REFERENCES employees(EID)
);

-- Insert Sample Data into employees
INSERT INTO employees (EID, NAME, DOB, DOJ) VALUES
(1, 'Alice', '1995-05-10', '2020-01-15'),
(2, 'Bob', '1990-08-15', '2019-03-10'),
(3, 'Charlie', '1995-05-10', '2020-06-20'),
(4, 'David', '1985-03-20', '2018-09-05');

-- Insert Sample Data into employee_dept
INSERT INTO employee_dept (eid, dept, salary) VALUES
(1, 'HR', 5000),
(2, 'IT', 6000),
(3, 'HR', 4500),
(4, 'IT', 7000);

-- SQL Query:
-- Query to find the youngest employee in each department
SELECT 
    e.NAME AS name,
    TIMESTAMPDIFF(YEAR, e.DOB, CURRENT_DATE) AS youngest_person,
    d.dept AS dept
FROM 
    employees e
JOIN 
    employee_dept d
ON 
    e.EID = d.eid
WHERE 
    TIMESTAMPDIFF(YEAR, e.DOB, CURRENT_DATE) = (
        SELECT MIN(TIMESTAMPDIFF(YEAR, e2.DOB, CURRENT_DATE))
        FROM employees e2
        JOIN employee_dept d2
        ON e2.EID = d2.eid
        WHERE d2.dept = d.dept
        GROUP BY d2.dept
    )
ORDER BY 
    d.dept, e.NAME;

-- Expected Output:
-- Sample output based on the inserted data and current date (2025-07-15)
-- name    youngest_person    dept
-- Alice   30                HR
-- Charlie 30                HR
-- Bob     34                IT