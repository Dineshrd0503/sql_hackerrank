/*
Problem Statement:
Query the Western Longitude (LONG_W) from the STATION table where the Northern Latitude (LAT_N)
is the smallest value greater than 38.7780. Round the answer to 4 decimal places.

Table: STATION
- ID: Integer, unique identifier
- LAT_N: Numeric, Northern Latitude
- LONG_W: Numeric, Western Longitude


Example:
STATION table:
ID | LAT_N   | LONG_W
1  | 38.5000 | 75.0000
2  | 38.7881 | 77.5678
3  | 39.1234 | 78.9012
4  | 38.7881 | 76.1234

Smallest LAT_N > 38.7780 is 38.7881 (ID 2, 4).
Output: 77.5678 (LONG_W for ID 2, rounded to 4 decimal places).
*/


-SELECT ROUND(LONG_W, 4)
FROM STATION
WHERE LAT_N = (
    SELECT MIN(LAT_N)
    FROM STATION
    WHERE LAT_N > 38.7780
)
LIMIT 1;