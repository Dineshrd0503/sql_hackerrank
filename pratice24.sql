--find the priec of previous prodcut comapring woth present procut in proucts table

mysql> select p.*,
    -> lag(price) over(partition by category order by pid) as prev_product_salary
    -> from product1 p;
+------+--------------+----------+-------+----------+---------------------+
| pid  | pname        | category | price | discount | prev_product_salary |
+------+--------------+----------+-------+----------+---------------------+
|   11 | adidas       | jacket   |  3500 |       12 |                NULL |
|   12 | north face   | jacket   |  3200 |        8 |                3500 |
|   13 | columbia     | jacket   |  3200 |        5 |                3200 |
|   14 | under armour | jacket   |  3000 |        7 |                3200 |
|    5 | wrangler     | jeans    |  3000 |       10 |                NULL |
|    6 | lee          | jeans    |  3000 |        8 |                3000 |
|    7 | pepe         | jeans    |  2800 |       12 |                3000 |
|    1 | vanheusen    | shirt    |  2000 |        5 |                NULL |
|    2 | vanhuesen    | shirt    |  2000 |        3 |                2000 |
|    3 | allen solly  | shirt    |  1600 |       10 |                2000 |
|    4 | levis        | shirt    |  1800 |        6 |                1600 |
|    8 | nike         | shoes    |  4000 |       15 |                NULL |
|    9 | adidas       | shoes    |  4000 |       12 |                4000 |
|   10 | puma         | shoes    |  3500 |       10 |                4000 |
|   15 | nike         | tshirt   |  2000 |        5 |                NULL |
+------+--------------+----------+-------+----------+---------------------+
15 rows in set (0.26 sec)
  