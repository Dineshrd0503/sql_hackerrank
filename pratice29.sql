find the nth highest salary in employess table

CREATE FUNCTION getNthHighestSalary(n INT) RETURNS INT
BEGIN
    SET n = n - 1;
    RETURN (
        SELECT IFNULL(
            (SELECT distinct salary
             FROM Employee
             WHERE salary IS NOT NULL
             ORDER BY salary DESC
             LIMIT 1 OFFSET n),
            NULL
        )
    );
END