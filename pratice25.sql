--select the next product proce for the current product in the product table


mysql> select p.*,
    -> lead(price) over(partition by category order by pid) as prev_product_salary
    -> from product1 p;
+------+--------------+----------+-------+----------+---------------------+
| pid  | pname        | category | price | discount | prev_product_salary |
+------+--------------+----------+-------+----------+---------------------+
|   11 | adidas       | jacket   |  3500 |       12 |                3200 |
|   12 | north face   | jacket   |  3200 |        8 |                3200 |
|   13 | columbia     | jacket   |  3200 |        5 |                3000 |
|   14 | under armour | jacket   |  3000 |        7 |                NULL |
|    5 | wrangler     | jeans    |  3000 |       10 |                3000 |
|    6 | lee          | jeans    |  3000 |        8 |                2800 |
|    7 | pepe         | jeans    |  2800 |       12 |                NULL |
|    1 | vanheusen    | shirt    |  2000 |        5 |                2000 |
|    2 | vanhuesen    | shirt    |  2000 |        3 |                1600 |
|    3 | allen solly  | shirt    |  1600 |       10 |                1800 |
|    4 | levis        | shirt    |  1800 |        6 |                NULL |
|    8 | nike         | shoes    |  4000 |       15 |                4000 |
|    9 | adidas       | shoes    |  4000 |       12 |                3500 |
|   10 | puma         | shoes    |  3500 |       10 |                NULL |
|   15 | nike         | tshirt   |  2000 |        5 |                NULL |
+------+--------------+----------+-------+----------+---------------------+
15 rows in set (0.00 sec)