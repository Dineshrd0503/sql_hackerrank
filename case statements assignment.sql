use pratice

select * from sales


-- 1) Display the total quantity sold for each product, split into two columns: sales before 3rd August 2025 and sales on/after 3rd August 2025
select product_name,
sum(case when datepart(day,sale_date)<3 and datepart(month,sale_date)=8 then quantity*price end ) as sales_before_3rd_august_2025,
sum(case when datepart(day,sale_date)>=3 and datepart(month,sale_date)=8 then quantity*price end ) as sales_on_after_3rd_august_2025
from sales
group by product_name

2) --Count the number of sales in each category where the quantity sold is between 2 and 5 units.

select category,count(*)
from sales
where quantity between 2 and 5
group by category

-- 3) For each category, calculate the number of high-value sales (amount > ₹20,000) and low-value sales (amount ≤ ₹20,000).
select category,
count(case when quantity*price>20000 then 1 end) as high_value_sales,
count(case when quantity*price<20000 then 1 end) as low_value_sales
from sales
group by category


-- 4) Display for each category the revenue contribution from “Laptop” and from all other products separately.

select category,
sum(case when product_name='laptop' then price*quantity end) as laptop_revenue,
sum(case when product_name!='laptop' then price*quantity end) as non_laptop_revenue
from sales
group by
category

-- 5) Show the total revenue for each product, splitting it into sales made in the first half of August 2025 and the second half.

select product_name,
sum(case when sale_date between '2025-08-01' and '2025-08-15' then price*quantity else 0 end) as first_half_revenue,
sum(case when sale_date between '2025-08-16' and '2025-08-31'then price*quantity else 0 end) as second_half_revenue
from sales
group by product_name

-- 6) Show total revenue for Electronics and Furniture separately, but only for transactions where quantity is an even number.
select
sum(case when category='electronics' and quantity%2=0 then price*quantity end) as electronics_total_revenue,
sum(case when category='furniture' and quantity%2=0 then price*quantity end) as furniture_total_revenue
from sales





