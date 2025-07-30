/*
LeetCode SQL Problem 1661: Average Time of Process per Machine

Problem Statement:
------------------
The table Activity holds the machine activities.

Each row is a record of a process that was done by a machine at a specific time.
The table has the following schema:

| Column Name    | Type    |
|----------------|---------|
| machine_id     | int     |
| process_id     | int     |
| activity_type  | enum    | ('start', 'end')
| timestamp      | float   |

(machine_id, process_id, activity_type) is the primary key for this table.

Each process has only two activities: start and end.

You are asked to find the average time each machine takes to complete a process.

The time to complete a process is the 'end' timestamp minus the 'start' timestamp.

Return the result table ordered by machine_id in ascending order.
The result format is in the following example.

Example Input:
Activity table:
+------------+------------+---------------+-----------+
| machine_id | process_id | activity_type | timestamp |
+------------+------------+---------------+-----------+
| 0          | 0          | start         | 0.712     |
| 0          | 0          | end           | 1.520     |
| 0          | 1          | start         | 3.140     |
| 0          | 1          | end           | 4.120     |
| 1          | 0          | start         | 0.550     |
| 1          | 0          | end           | 1.550     |
+------------+------------+---------------+-----------+

Expected Output:
+------------+-----------------+
| machine_id | processing_time |
+------------+-----------------+
| 0          | 0.894           |
| 1          | 1.000           |
+------------+-----------------+

SQL Table Schema:
-----------------
CREATE TABLE Activity (
  machine_id INT,
  process_id INT,
  activity_type ENUM('start', 'end'),
  timestamp FLOAT,
  PRIMARY KEY (machine_id, process_id, activity_type)
);

Solution:
--------- */
SELECT 
  machine_id,
  ROUND(SUM(IF(activity_type='start', -timestamp, timestamp)) / COUNT(DISTINCT process_id), 3) AS processing_time
FROM
  Activity
GROUP BY
  machine_id;
