. Display all employees sorted by department name.

SELECT e.name, d.dept
FROM employees e
INNER JOIN employee_dept d
ON e.eid = d.eid
ORDER BY d.dept, e.name;