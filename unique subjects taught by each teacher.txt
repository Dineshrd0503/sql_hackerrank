/* 
------------------------------------------------------------
Problem Statement:
We have a Teacher table storing which teacher teaches which subjects.
We need to count the number of subjects for each teacher 
based on the given subquery logic.

------------------------------------------------------------
Table Schema:
CREATE TABLE Teacher (
    teacher_id INT,
    subject_id INT
);

------------------------------------------------------------
Sample Data:
INSERT INTO Teacher (teacher_id, subject_id) VALUES
(1, 101),
(1, 102),
(2, 101),
(2, 103),
(3, 104),
(3, 104), -- Duplicate subject to test DISTINCT
(4, NULL);

------------------------------------------------------------
Query Goal:
Count the subjects taught by each teacher using a subquery 
that selects subject_ids for the same teacher.

------------------------------------------------------------
Order of Execution (Logical Processing in SQL):
1. FROM        → Select the Teacher table (alias t1).
2. WHERE       → Filter rows where t1.subject_id equals the result 
                 of the subquery.
3. Subquery:
    a. FROM Teacher (alias t2).
    b. WHERE t2.teacher_id = t1.teacher_id (correlated to outer query).
    c. SELECT DISTINCT t2.subject_id.
4. WHERE filter in outer query applies only to rows that meet the 
   equality condition.
5. SELECT      → Output teacher_id and COUNT(subject_id).
6. GROUP BY    → (Required for COUNT with teacher_id).
7. Return final result set.

------------------------------------------------------------
*/

-- Final Query
SELECT t1.teacher_id, COUNT(t1.subject_id) AS subject_count
FROM Teacher t1
WHERE t1.subject_id IN (
    SELECT DISTINCT t2.subject_id
    FROM Teacher t2
    WHERE t2.teacher_id = t1.teacher_id
)
GROUP BY t1.teacher_id;
