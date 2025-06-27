find the top 2 products in each category

ysql> with cte as(
    -> select p.*,
    -> row_number() over(partition by category order by pid) as rn
    -> from product1 p )
    -> select * from cte
    -> where
    -> rn<3;
+------+------------+----------+-------+----------+----+
| pid  | pname      | category | price | discount | rn |
+------+------------+----------+-------+----------+----+
|   11 | adidas     | jacket   |  3500 |       12 |  1 |
|   12 | north face | jacket   |  3200 |        8 |  2 |
|    5 | wrangler   | jeans    |  3000 |       10 |  1 |
|    6 | lee        | jeans    |  3000 |        8 |  2 |
|    1 | vanheusen  | shirt    |  2000 |        5 |  1 |
|    2 | vanhuesen  | shirt    |  2000 |        3 |  2 |
|    8 | nike       | shoes    |  4000 |       15 |  1 |
|    9 | adidas     | shoes    |  4000 |       12 |  2 |
|   15 | nike       | tshirt   |  2000 |        5 |  1 |
+------+------------+----------+-------+----------+----+
9 rows in set (0.00 sec)