/*
Enter your query here.
*/
-- Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements for each record in the table:

-- Equilateral: It's a triangle with  sides of equal length.
-- Isosceles: It's a triangle with  sides of equal length.
-- Scalene: It's a triangle with  sides of differing lengths.
-- Not A Triangle: The given values of A, B, and C don't form a triangle.
-- Input Format

-- The TRIANGLES table is described as follows:
-- -- select 
-- -- case 
-- -- when A+B<=C or A+C<=B or B+C<=A then 'Not A Triangle'
-- -- when A=B or B=C then 'Equilateral'
-- -- when A=B or B=C or C=A then 'Isosceles'
-- -- else 'Scalene'
-- -- end as triangle_type
-- -- from TRIANGLES;
  SELECT 
  CASE 
    WHEN A + B <= C OR A + C <= B OR B + C <= A THEN 'Not A Triangle'
    WHEN A = B AND B = C THEN 'Equilateral'
    WHEN A = B OR A = C OR B = C THEN 'Isosceles'
    ELSE 'Scalene'
  END AS triangle_type
FROM TRIANGLES;