sql> select p.*,
    -> row_number() over() as rn
    -> from product1 p;
+------+--------------+----------+-------+----------+----+
| pid  | pname        | category | price | discount | rn |
+------+--------------+----------+-------+----------+----+
|    1 | vanheusen    | shirt    |  2000 |        5 |  1 |
|    2 | vanhuesen    | shirt    |  2000 |        3 |  2 |
|    3 | allen solly  | shirt    |  1600 |       10 |  3 |
|    4 | levis        | shirt    |  1800 |        6 |  4 |
|    5 | wrangler     | jeans    |  3000 |       10 |  5 |
|    6 | lee          | jeans    |  3000 |        8 |  6 |
|    7 | pepe         | jeans    |  2800 |       12 |  7 |
|    8 | nike         | shoes    |  4000 |       15 |  8 |
|    9 | adidas       | shoes    |  4000 |       12 |  9 |
|   10 | puma         | shoes    |  3500 |       10 | 10 |
|   11 | adidas       | jacket   |  3500 |       12 | 11 |
|   12 | north face   | jacket   |  3200 |        8 | 12 |
|   13 | columbia     | jacket   |  3200 |        5 | 13 |
|   14 | under armour | jacket   |  3000 |        7 | 14 |
|   15 | nike         | tshirt   |  2000 |        5 | 15 |
+------+--------------+----------+-------+----------+----+
15 rows in set (0.00 sec) 