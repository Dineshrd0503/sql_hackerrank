find the top 2 discount products in each department

mysql> with cte as
    -> (
    -> select p.pid as pid,p.pname as pname ,p.category as category,p.price as price, p.discount as discount, dense_rank() over(partition by p.category order by p.discount desc) as highest_discount_amount from product1 p
    -> )
    -> select * from cte
    -> where cte.highest_discount_amount<=2;
+------+-------------+----------+-------+----------+-------------------------+
| pid  | pname       | category | price | discount | highest_discount_amount |
+------+-------------+----------+-------+----------+-------------------------+
|   11 | adidas      | jacket   |  3500 |       12 |                       1 |
|   12 | north face  | jacket   |  3200 |        8 |                       2 |
|    7 | pepe        | jeans    |  2800 |       12 |                       1 |
|    5 | wrangler    | jeans    |  3000 |       10 |                       2 |
|    3 | allen solly | shirt    |  1600 |       10 |                       1 |
|    4 | levis       | shirt    |  1800 |        6 |                       2 |
|    8 | nike        | shoes    |  4000 |       15 |                       1 |
|    9 | adidas      | shoes    |  4000 |       12 |                       2 |
|   15 | nike        | tshirt   |  2000 |        5 |                       1 |
+------+-------------+----------+-------+----------+-------------------------+