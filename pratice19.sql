find the max price for each category of product in the table
and also display the price

What is the maximum price for each product category in the product1 table? (This is a core component, but the query also shows individual product details.)


mysql> select p.*,
    -> max(price) over(partition by category) as max_price
    -> from product1 p;

+------+--------------+----------+-------+----------+-----------+
| pid  | pname        | category | price | discount | max_price |
+------+--------------+----------+-------+----------+-----------+
|   11 | adidas       | jacket   |  3500 |       12 |      3500 |
|   12 | north face   | jacket   |  3200 |        8 |      3500 |
|   13 | columbia     | jacket   |  3200 |        5 |      3500 |
|   14 | under armour | jacket   |  3000 |        7 |      3500 |
|    5 | wrangler     | jeans    |  3000 |       10 |      3000 |
|    6 | lee          | jeans    |  3000 |        8 |      3000 |
|    7 | pepe         | jeans    |  2800 |       12 |      3000 |
|    1 | vanheusen    | shirt    |  2000 |        5 |      2000 |
|    2 | vanhuesen    | shirt    |  2000 |        3 |      2000 |
|    3 | allen solly  | shirt    |  1600 |       10 |      2000 |
|    4 | levis        | shirt    |  1800 |        6 |      2000 |
|    8 | nike         | shoes    |  4000 |       15 |      4000 |
|    9 | adidas       | shoes    |  4000 |       12 |      4000 |
|   10 | puma         | shoes    |  3500 |       10 |      4000 |
|   15 | nike         | tshirt   |  2000 |        5 |      2000 |
+------+--------------+----------+-------+----------+-----------+