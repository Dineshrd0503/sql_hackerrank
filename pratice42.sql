-- --------------------------------------------------------------------
-- Problem Statement:
--
-- Table: Person
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |  -- Primary key
-- | email       | varchar |
-- +-------------+---------+
--
-- Each row contains an email address. Some emails are duplicated.
-- Your task is to DELETE all duplicate emails and keep only ONE
-- record for each email—the one with the smallest id.
--
-- Note:
-- ✅ You are required to write a DELETE statement (not SELECT).
-- ✅ Final output will only include uniquely retained rows (min id).
-- ✅ The final order of the Person table does NOT matter.
--
-- Example:
-- Input:
-- +----+------------------+
-- | id | email            |
-- +----+------------------+
-- | 1  | john@example.com |
-- | 2  | bob@example.com  |
-- | 3  | john@example.com |
-- +----+------------------+
--
-- Output:
-- +----+------------------+
-- | id | email            |
-- +----+------------------+
-- | 1  | john@example.com |
-- | 2  | bob@example.com  |
-- +----+------------------+
--
-- Explanation:
-- There were two "john@example.com" emails. We kept the one with id = 1.
-- --------------------------------------------------------------------

-- STEP 1: Create the Person table
DROP TABLE IF EXISTS Person;

CREATE TABLE Person (
    id INT PRIMARY KEY,
    email VARCHAR(255)
);

-- NOTE: You may insert test data using INSERT INTO statements if needed.

-- --------------------------------------------------------------------
-- STEP 2: SQL Query to delete duplicate emails (keep one with lowest id)
-- --------------------------------------------------------------------

DELETE p1
FROM Person p1
INNER JOIN Person p2
ON p1.email = p2.email AND p1.id > p2.id;

-- --------------------------------------------------------------------
-- Order of Execution:
-- 1. The FROM clause initiates table aliasing: p1 and p2 both refer to Person.
-- 2. The INNER JOIN compares rows where `email` matches and `p1.id > p2.id`.
-- 3. This filters rows in `p1` that are duplicates (with higher ids).
-- 4. DELETE p1 removes the higher ID duplicate, keeping only the smallest.
-- --------------------------------------------------------------------
