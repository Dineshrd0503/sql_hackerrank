List employees who have the same salary as someone else.



mysql> SELECT e.name AS name, d.salary AS salary
    -> FROM employees e
    -> INNER JOIN employee_dept d
    -> ON e.eid = d.eid
    -> WHERE d.salary IN (
    ->     SELECT salary
    ->     FROM employee_dept
    ->     WHERE salary IS NOT NULL
    ->     GROUP BY salary
    ->     HAVING COUNT(*) > 1
    -> )
    -> ORDER BY d.salary, e.name;