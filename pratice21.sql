find the products with highest discount in each categor

sql> select p.pid as pid,p.pname as pname ,p.category as category,p.price as price, p.discount as discount,
    -> dense_rank() over(partition by p.category order by p.discount desc) as highest_discount_amount
    -> from product1 p;
+------+--------------+----------+-------+----------+-------------------------+
| pid  | pname        | category | price | discount | highest_discount_amount |
+------+--------------+----------+-------+----------+-------------------------+
|   11 | adidas       | jacket   |  3500 |       12 |                       1 |
|   12 | north face   | jacket   |  3200 |        8 |                       2 |
|   14 | under armour | jacket   |  3000 |        7 |                       3 |
|   13 | columbia     | jacket   |  3200 |        5 |                       4 |
|    7 | pepe         | jeans    |  2800 |       12 |                       1 |
|    5 | wrangler     | jeans    |  3000 |       10 |                       2 |
|    6 | lee          | jeans    |  3000 |        8 |                       3 |
|    3 | allen solly  | shirt    |  1600 |       10 |                       1 |
|    4 | levis        | shirt    |  1800 |        6 |                       2 |
|    1 | vanheusen    | shirt    |  2000 |        5 |                       3 |
|    2 | vanhuesen    | shirt    |  2000 |        3 |                       4 |
|    8 | nike         | shoes    |  4000 |       15 |                       1 |
|    9 | adidas       | shoes    |  4000 |       12 |                       2 |
|   10 | puma         | shoes    |  3500 |       10 |                       3 |
|   15 | nike         | tshirt   |  2000 |        5 |                       1 |
+------+--------------+----------+-------+----------+-------------------------+
15 rows in set (0.00 sec)