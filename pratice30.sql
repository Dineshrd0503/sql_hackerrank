-- SQL File: Duplicate Emails Analysis
-- Generated on: July 02, 2025 at 08:59 PM IST

-- Problem Statement:
-- The task is to report all the duplicate emails from the Person table. It is guaranteed that the email field is not NULL, and emails will not contain uppercase letters. This analysis is useful for identifying account redundancies or potential data entry errors in a user database.

-- Table Schema:
-- Table: Person
-- Columns:
--   id (int): Primary key, unique identifier for each person.
--   email (varchar): The email address of the person, guaranteed non-NULL and lowercase.

-- Sample Data:
-- Inserting sample data into the Person table
INSERT INTO Person (id, email) VALUES
(1, 'a@b.com'),
(2, 'c@d.com'),
(3, 'a@b.com');

-- SQL Code:
SELECT email AS Email
FROM Person
GROUP BY email
HAVING COUNT(email) > 1;

-- Order of Execution:
-- 1. FROM: Accesses the 'Person' table as the data source.
-- 2. GROUP BY email: Groups the rows by the 'email' column to count occurrences.
-- 3. HAVING COUNT(email) > 1: Filters groups where the count of emails exceeds 1, identifying duplicates.
-- 4. SELECT email AS Email: Retrieves the 'email' column, aliased as 'Email', for the filtered groups.
-- Note: The logical order differs from the written order due to SQL's declarative nature, where the database optimizes the grouping and filtering process.