SELECT * FROM sql_project.retail_sales
use sql_project;
SELECT * FROM retail_sales
where transactions_id is null
or
sale_date is null
or
sale_time is null 
or
 customer_id is null
 or
 gender is null
 or
 age is null
 or
 category is null 
or
 quantiy is null
 or
 price_per_unit is null
 or
 cogs is null
 or
 total_sale is null;
 
 ....how many sales we have............
 select count(*) as total_sale from retail_sales;
 
 -----how many uniquee customer we have
 select count(distinct customer_id) as total_sales
 from retail_sales;
 
 
 select count(distinct category) as total_sales
 from retail_sales; 
 
 select distinct category from retail_sales;
 
 ----data analysis and business key problem---
Q1 write a sql query retervie all sale date coulmun on 22

select * from retail_sales
where sale_date='2022_11_05';

select category,
sum(quantiy) 
from retail_sales
where category= 'Clothing'
and 
to_char(sale_date, 'yyyy-mm')= '2022-11'
and
quantiy>4
 
 select category, sum(total_sale) as net_sale,
  count(*) as total_sale
 from retail_sales 
 group by category;

 select  round(avg(age),2) as avg_age
 from retail_sales
 where category='Beauty';
 
 select *
 from retail_sales
 where total_sale > 1000;
 
 select category,
 gender,
 count(*) as total_trans
 from retail_sales
 group by category,gender;
 
 
 select
 year(sale_date) as year,
 month(sale_date) as month,
 round(avg(total_sale),2) as avg_sale,
 rank() over(partition by year(sale_date) order by avg(total_sale) desc) as rankk
 from retail_sales
 group by 1,2;
 
 
 
 select customer_id, sum(total_sale) as highest_sale
 from retail_sales
 group by 1
 order by highest_sale desc limit 5;
 
 
 select 
 category,
 count(distinct customer_id) as unique_customer
 from retail_sales
 group by 1;
 
 with hourly_sale
 as(
 select *,
 case
 when hour(sale_time) < 12 then 'morning'
 when hour(sale_time) between 12 and 17 then 'afternoon'
 else 'evening'
 end as shift
 from retail_sales
 )
 select shift,
 count(*) as total_0rders
 from hourly_sale
 group by shift
 order by total_0rders desc;
 
 
 
--END PROJECT 
 
 