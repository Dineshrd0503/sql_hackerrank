-- SQL File: Weather Warmer Days Analysis
-- Generated on: June 24, 2025 at 09:41 PM IST

-- Problem Statement:
-- In a weather monitoring system, the task is to identify days when the temperature was higher than the previous day. This analysis helps track warming trends, assisting meteorologists in understanding temperature fluctuations. The result should list the unique identifiers (id) of records where the temperature exceeds that of the previous day, based on consecutive dates.

-- Table Schema:
-- Table: Weather
-- Columns:
--   id (int): Unique identifier for each weather record.
--   recordDate (date): The date of the weather record.
--   temperature (int): The temperature recorded on that date.

-- Sample Data:
-- Inserting sample data into the Weather table
INSERT INTO Weather (id, recordDate, temperature) VALUES
(1, '2025-06-22', 25),
(2, '2025-06-23', 27),
(3, '2025-06-24', 26),
(4, '2025-06-25', 28);

-- SQL Code:
select w1.id
from Weather w1
join 
Weather w2 on date(w1.recordDate)=date(w2.recordDate+interval 1 day)
where
w1.temperature>w2.temperature;

-- Order of Execution:
-- 1. FROM and JOIN: Accesses the 'Weather' table twice (aliased as w1 and w2), joining w1 with w2 where w1.recordDate is one day after w2.recordDate, using DATE() to compare dates.
-- 2. WHERE: Filters the joined rows where w1.temperature is greater than w2.temperature, identifying days warmer than the previous day.
-- 3. SELECT: Retrieves the 'id' from w1 for the filtered records.
-- Note: The logical order differs from the written order due to SQL's declarative nature, where the database optimizes based on dependencies. The self-join requires careful date alignment.