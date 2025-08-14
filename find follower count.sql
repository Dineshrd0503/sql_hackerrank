/*
------------------------------------------------------------
Problem Statement:
Given a table 'followers' with columns (user_id, follower_id),
write a query to find the number of followers for each user,
ordered by user_id in ascending order.

------------------------------------------------------------
MySQL Table Schema:
CREATE TABLE followers (
    user_id INT,
    follower_id INT
);

------------------------------------------------------------
Sample Data:
INSERT INTO followers (user_id, follower_id) VALUES
(1, 2),
(1, 3),
(2, 1),
(2, 3),
(2, 4),
(3, 1),
(3, 2);

------------------------------------------------------------
Order of Execution (Logical Processing in MySQL):
1. FROM        → Select the 'followers' table.
2. GROUP BY    → Group rows by 'user_id'.
3. SELECT      → For each group, return 'user_id' and COUNT(follower_id) as followers_count.
4. ORDER BY    → Sort the results by user_id in ascending order.

------------------------------------------------------------
Expected Output for Sample Data:
+---------+----------------+
| user_id | followers_count|
+---------+----------------+
|    1    |       2        |
|    2    |       3        |
|    3    |       2        |
+---------+----------------+
*/

-- MySQL Query
SELECT user_id,
       COUNT(follower_id) AS followers_count
FROM followers
GROUP BY user_id
ORDER BY user_id;
