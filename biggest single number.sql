/*
------------------------------------------------------------
Problem Statement:
Find the largest single number in MyNumbers table. 
A single number appears only once.
If no single number exists, return NULL.

------------------------------------------------------------
MySQL Table Schema:
CREATE TABLE MyNumbers (
    num INT
);

------------------------------------------------------------
Sample Data (Example 1):
INSERT INTO MyNumbers (num) VALUES
(8),(8),(3),(3),(1),(4),(5),(6);

Expected Output: 6

------------------------------------------------------------
Sample Data (Example 2):
INSERT INTO MyNumbers (num) VALUES
(8),(8),(7),(7),(3),(3),(3);

Expected Output: NULL

------------------------------------------------------------
Order of Execution:
1. FROM MyNumbers → get data.
2. GROUP BY num → group by unique number.
3. HAVING COUNT(*) = 1 → keep only numbers appearing once.
4. MAX(num) → return largest from filtered set. If empty → NULL.
------------------------------------------------------------
*/

-- Final MySQL Query
SELECT MAX(num) AS num
FROM (
    SELECT num
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(*) = 1
) AS singles;
