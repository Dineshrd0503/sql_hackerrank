
-- Problem Statement:
-- The task is to report the first name, last name, city, and state of each person in the Person table. If the address of a personId is not present in the Address table, report null instead. This analysis is useful for maintaining comprehensive customer records, ensuring all individuals are accounted for with or without address information.

-- Table Schemas:
-- Table: Person
-- Columns:
--   personId (int): Primary key, unique identifier for each person.
--   lastName (varchar): The last name of the person.
--   firstName (varchar): The first name of the person.
-- Table: Address
-- Columns:
--   addressId (int): Primary key, unique identifier for each address.
--   personId (int): Foreign key referencing Person.personId.
--   city (varchar): The city of the person's address.
--   state (varchar): The state of the person's address.

-- SQL Code:
SELECT 
    p.firstName,
    p.lastName,
    a.city,
    a.state
FROM Person p
LEFT JOIN Address a ON p.personId = a.personId;

-- Order of Execution:
-- 1. FROM and LEFT JOIN: Accesses the 'Person' table (aliased as p) and joins with 'Address' (aliased as a) on 'personId', including all rows from Person even if no match exists in Address.
-- 2. SELECT: Retrieves 'firstName' and 'lastName' from Person, and 'city' and 'state' from Address (null if no match).
-- Note: The logical order differs from the written order due to SQL's declarative nature, where the database optimizes the join and projection. No WHERE clause is needed as all rows are desired.