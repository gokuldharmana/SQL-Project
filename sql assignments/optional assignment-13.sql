select* from products_owned
---a
select* from products_owned
pivot(sum(price) for product_owned in(iphone,gshock,rolex,[s22 ultra],[galaxy watch],[pixel 4]))as pt1

---b. Write a query to get the average price incurred by each person using:
--i. Group by
--ii. Window function
select distinct name,AVG(price) over(partition by name ) as avg_price from products_owned

---c. Write a query to find the item with the highest average price using:
--i. Group by
--ii. Window Function
select distinct Product_Owned,AVG(price) over(partition by product_owned   ) as avg_price from products_owned ORDER BY avg_price DESC

---d. Write a query by making the customer name dynamic and filter the records for the customer named Ravi.

declare @prg as varchar(150)
set @prg = 'ravi'
select* from products_owned where name = @prg

	select* from products_owned where name ='ravi'
---e. Write a query to make the customer name and products dynamic and then filter the records for customer
--named Rahul and his products one by one, submit 3 such queries and their outputs.

declare @pro as varchar(30)
set @pro = 'rolex'
declare @pr as varchar(30)
set @pr = 'rolex'
declare @p as varchar(30)
set @p = 'pixel 4'
declare @n as varchar(20)
set @n = 'rahul'
select name,product_owned from products_owned where Name =@n and Product_Owned =@p
select name,product_owned from products_owned where Name =@n and Product_Owned =@pr
select name,product_owned from products_owned where Name =@n and Product_Owned =@pro

---trail

declare @na as varchar(50)
set @na = 65000
declare @qn as varchar(200)
set @qn = 'select name,product_owned from products_owned where price = '+@na

exec(@qn)

select * from products_owned
----2
select* from products_prices

select Product,year,price ,
(case when year =2013 then 2012 else null end ) as prev_year,
(case when price =36000 then 42000 else null end ) as prev_price,
(case when price =36000 then (case when price =36000 then 42000 end )-price else null end ) as prev_diff
from products_prices where Product = 'apple iphone' and YEAR in(2012,2013)

select top 2 product,year as CURRENT_YEAR,Price as CURRENT_PRICE,
lag(year,1) over (order by year) as Previous_year,
lag(Price,1) over (order by year) as Previous_Price,
(lag(Price,1) over (order by year)-price) as Price_DIFF
from products_prices where product= 'Apple iPhone';

select *, LAG(Year) over(partition by Product ORDER by YEAR ) as Previous_Year, 
LAG(Price) over(partition by Product ORDER by YEAR) as previous_price, 
LAG(Price) over(partition by Product ORDER by YEAR) - Price as diff 
from products_prices

