use pratice
select * from sys.tables

select * from customers

select * from sales

-- Drop the table if it exists to ensure a clean start
DROP TABLE IF EXISTS Sales;

-- Create the table schema
CREATE TABLE Sales (
    sale_id INT,
    product_name VARCHAR(50),
    quantity INT,
    price DECIMAL(10,2)
);

-- Insert all 15 rows of data
INSERT INTO Sales (sale_id, product_name, quantity, price) VALUES


-- Added 10 new rows with repeated product names
(6, 'Laptop', 3, 55000.00),
(7, 'Monitor', 8, 12000.00),
(8, 'Mouse', 50, 500.00),
(9, 'Keyboard', 40, 1500.00),
(10, 'Laptop', 2, 55000.00),
(11, 'USB Cable', 15, 200.00),
(12, 'Monitor', 5, 12000.00),
(13, 'Mouse', 30, 500.00),
(14, 'Keyboard', 25, 1500.00),
(15, 'Laptop', 4, 55000.00);

drop table sales

CREATE TABLE Sales (
    sale_id INT,
    product_name VARCHAR(50),
    category VARCHAR(20),
    quantity INT,
    price DECIMAL(10,2),
    sale_date DATE
);

INSERT INTO Sales VALUES
(1, 'Laptop', 'Electronics', 2, 55000, '2025-08-01'),
(2, 'Mouse', 'Electronics', 5, 500, '2025-08-02'),
(3, 'Keyboard', 'Electronics', 3, 1500, '2025-08-02'),
(4, 'Chair', 'Furniture', 4, 3000, '2025-08-03'),
(5, 'Desk', 'Furniture', 1, 7000, '2025-08-03'),
(6, 'Monitor', 'Electronics', 2, 12000, '2025-08-04'),
(7, 'Sofa', 'Furniture', 1, 20000, '2025-08-05'),
(8, 'Mouse', 'Electronics', 10, 450, '2025-08-05'),
(9, 'Laptop', 'Electronics', 1, 54000, '2025-08-06'),
(10, 'Chair', 'Furniture', 6, 2800, '2025-08-06');


select product_name as name,round(sum(quantity*price),3) as total_sales
from sales
group by product_name

select * from sales

--use case statement to find the sum of sales for each category
select
sum(case when product_name='laptop' then quantity*price end) as laptop_sales,
sum(case when product_name='mouse' then quantity*price end) as mouse_sales,
sum(case when product_name='keyboard' then quantity*price end) as keyboard_sales,
sum(case when product_name='usb cable' then quantity*price end)as usb_cable_sales
from sales

--use case statement to count the products with sales less than 10kand  b/w 10 and 25k and between 25k and 50k

select 
count(case when quantity*price<10000 then 1 end) as less_than_10000,
count(case when quantity*price between 10000 and 250000 then 1 end) as less_than_10000_to_25000,
count(case when quantity*price  between 25000 and 50000 then 1 end) as less_than_25000_to_50000
from sales


 select * from sales
 

 /*

 return the sum of sales for electronics and furntritur cartgory
 category    weekday    weekend
 ele         19000      7000
 fur         36000      19000
 */
 select category,
 sum(case when datename(weekday,sale_date) not in('saturday','sunday') then quantity*price end) as weekday,
 sum(case when datename(weekday,sale_date) in('saturday','sunday') then quantity*price end) as weekday
 from sales
 group by
 category

 

