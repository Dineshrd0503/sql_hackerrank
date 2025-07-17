-- Schema definition for tables
CREATE TABLE employees (
    eid INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE employee_dept (
    eid INT,
    dept VARCHAR(50) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (eid) REFERENCES employees(eid)
);

-- Insert sample data into tables
INSERT INTO employees (eid, name) VALUES
(1, 'John Doe'),
(2, 'Jane Smith'),
(3, 'Alice Johnson'),
(4, 'Bob Williams'),
(5, 'Charlie Brown');

INSERT INTO employee_dept (eid, dept, salary) VALUES
(1, 'HR', 5000.00),
(2, 'IT', 6000.00),
(3, 'IT', 6000.00),
(4, 'HR', 4500.00),
(5, 'IT', 5500.00);

-- Query to find the employee with the most common salary
SELECT e.name AS name,
       d.dept AS dept,
       d.salary AS salary
FROM employees e
JOIN employee_dept d
ON e.eid = d.eid
WHERE d.salary = (
    SELECT d2.salary
    FROM employee_dept d2
    GROUP BY d2.salary
    ORDER BY COUNT(d2.salary) DESC, d2.salary DESC
    LIMIT 1
);

-- Order of Execution
/*
1. The innermost subquery is executed first:
   - SELECT d2.salary FROM employee_dept d2 GROUP BY d2.salary
   - This groups the employee_dept table by salary and calculates the count of each salary.
   - ORDER BY COUNT(d2.salary) DESC, d2.salary DESC sorts by frequency (descending) and then by salary (descending) to handle ties.
   - LIMIT 1 retrieves the most frequent salary (e.g., 6000.00 if it appears twice).

2. The WHERE clause uses the result of the subquery to filter rows from the JOIN:
   - JOIN employee_dept d ON e.eid = d.eid combines employees and their department/salary data.
   - WHERE d.salary = (subquery result) matches employees with the most common salary.

3. The SELECT clause formats the final output:
   - e.name, d.dept, d.salary are retrieved for the filtered rows.

This order ensures the most common salary is determined before filtering and joining, optimizing the query execution.
*/