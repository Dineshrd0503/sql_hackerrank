Retrieve employees whose salaries are within 10% of the highest salary


SELECT e.name, d.salary
FROM employees e
INNER JOIN employee_dept d
ON e.eid = d.eid
WHERE d.salary IS NOT NULL
AND d.salary >= (
    SELECT MAX(salary) * 0.9 FROM employee_dept
)
AND d.salary <= (
    SELECT MAX(salary) FROM employee_dept
)
ORDER BY d.salary DESC, e.name;