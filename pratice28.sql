-- SQL File: Rank Scores Analysis
-- Generated on: July 01, 2025 at 10:31 PM IST

-- Problem Statement:
-- The task is to find the rank of scores from the Scores table, ranked from highest to lowest. If there is a tie between two scores, both should have the same ranking. After a tie, the next ranking number should be the next consecutive integer value (no holes between ranks). The result table should be ordered by score in descending order. This analysis is useful for ranking game performances or competitive scores.

-- Table Schema:
-- Table: Scores
-- Columns:
--   id (int): Primary key, unique identifier for each score record.
--   score (decimal): The score of a game, a floating point value with two decimal places.

-- Sample Data:
-- Inserting sample data into the Scores table
INSERT INTO Scores (id, score) VALUES
(1, 3.50),
(2, 3.65),
(3, 4.00),
(4, 3.85),
(5, 4.00),
(6, 3.65);

-- SQL Code:
SELECT 
    score,
    DENSE_RANK() OVER (ORDER BY score DESC) AS rank
FROM Scores
ORDER BY score DESC;

-- Order of Execution:
-- 1. FROM: Accesses the 'Scores' table as the data source.
-- 2. DENSE_RANK() OVER (ORDER BY score DESC): Calculates the rank for each score, assigning the same rank to ties and incrementing consecutively, based on the descending order of scores.
-- 3. SELECT: Retrieves the 'score' and computed 'rank' columns.
-- 4. ORDER BY score DESC: Sorts the final result by score in descending order.
-- Note: The logical order differs from the written order due to SQL's declarative nature, where the window function is applied before the final sort, optimized by the database.