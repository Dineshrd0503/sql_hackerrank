/*
Problem Statement:
Find employees whose salaries are above the department-wise average salary.
The task requires identifying employees whose individual salaries exceed the average salary
of their respective departments. The result should include the employee's name, department,
and salary.

Tables:
- employees:
  - eid: Integer, primary key, unique identifier for each employee
  - name: VARCHAR(50), name of the employee
- employee_dept:
  - eid: Integer, foreign key referencing employees.eid
  - dept: VARCHAR(50), department name
  - salary: DECIMAL(10,2), employee's salary in the department

Constraints:
- 1 ≤ number of employees ≤ 2000
- 1 ≤ number of departments ≤ 100
- 0 ≤ salary ≤ 1000000
- All employees have a corresponding entry in employee_dept.

Example:
Input Tables:
employees:
eid | name
1   | Alice
2   | Bob
3   | Carol
4   | Dave

employee_dept:
eid | dept | salary
1   | HR   | 60000
2   | HR   | 55000
3   | IT   | 80000
4   | IT   | 70000

Expected Output:
name  | department | salary
Alice | HR          | 60000
Carol | IT          | 80000

Explanation:
- HR average: (60000 + 55000) / 2 = 57500
- IT average: (80000 + 70000) / 2 = 75000
- Alice (60000 > 57500) and Carol (80000 > 75000) are above their department averages.
*/


-- Query to find employees with salaries above department-wise average
SELECT e.name AS name,
       d.dept AS department,
       d.salary AS salary
FROM employees e
JOIN employee_dept d ON e.eid = d.eid
WHERE d.salary > (
    SELECT AVG(d2.salary)
    FROM employee_dept d2
    WHERE d2.dept = d.dept
);