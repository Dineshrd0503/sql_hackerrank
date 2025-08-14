/*
------------------------------------------------------------
Problem Statement:
Given a table 'courses' with columns (student, class),
find all classes that have at least 5 students.

------------------------------------------------------------
MySQL Table Schema:
CREATE TABLE courses (
    student VARCHAR(50),
    class   VARCHAR(50)
);

------------------------------------------------------------
Sample Data:
INSERT INTO courses (student, class) VALUES
('A', 'Math'),
('B', 'Math'),
('C', 'Math'),
('D', 'Math'),
('E', 'Math'),
('F', 'Science'),
('G', 'Science'),
('H', 'Science'),
('I', 'Science'),
('J', 'History'),
('K', 'History'),
('L', 'History'),
('M', 'History'),
('N', 'History');

------------------------------------------------------------
Order of Execution (Logical Processing in MySQL):
1. FROM        → Select the 'courses' table.
2. GROUP BY    → Group rows by the 'class' column.
3. HAVING      → Filter groups where COUNT(student) >= 5.
4. SELECT      → Return the 'class' values from the filtered groups.

------------------------------------------------------------
Expected Output for Sample Data:
+-------+
| class |
+-------+
| Math  |
| History |
+-------+
*/

-- MySQL Query
SELECT class
FROM courses
GROUP BY class
HAVING COUNT(student) >= 5;
