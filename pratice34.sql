Display employees who have been with the company for more than 10 years.

SELECT name
FROM employees
WHERE doj < DATE_SUB(CURDATE(), INTERVAL 10 YEAR)
ORDER BY name;