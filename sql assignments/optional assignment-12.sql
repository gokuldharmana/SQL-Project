select*from customerdetails
select* from CustomerOrders
---a. Rank the customers based on descending orders of their salaries.
select*,DENSE_RANK() over(order by salary desc) from CustomerDetails
---b. Rank the rows of CustomersOrders table based on ascending order of order amount.
select*,DENSE_RANK() over(order by orderamount) from CustomerOrders
---c. Filter the records to have customers who ordered more than once. Now rank their orders based on ascending order of order dates.
with result as(
select*,DENSE_RANK() over(partition by customerid order by orderdate)as rank from CustomerOrders
)
select* from result where result.rank>1
--or
select* from (select*,DENSE_RANK() over(partition by customerid order by orderdate)as rank from CustomerOrders)s where rank>1
---d. Calculate the 4 day rolling average of the order amounts based on order dates.
select*,AVG(orderamount) over(order by orderdate rows between 4 preceding and current row) from CustomerOrders

---e. Calculate the 5 day rolling sum of order amounts based on order dates.
select*,sum(orderamount) over(order by orderdate rows between 5 preceding and current row) from CustomerOrders

---f. Write a query to add a new column to the CustomerOrders table which lags the order amount value by 2 rows. Think about which column you’ll
--use to order this by in the window function. (Any column can be used to order by, but you need to define the purpose 
--of using that particular column, usually you will get the idea from the problem statement at hand).

select *,LAG(orderamount,2) over(order by orderdate ) from CustomerOrders
---g. To the above query, now add another column which leads the order amounts column by 3 rows. Compare this with the lag column and see where
--the NULL values occur in both the columns and figure out why.
	
select *,LAG(orderamount,2) over(order by orderdate ) as lag ,Lead(orderamount,3) over(order by orderdate ) as lead from CustomerOrders

---h. Divide the customers into deciles by using their total order amount (customer who has spent the lowest amount should fall in the first decile) as the
--parameter to bucket them. (Here, decile means dividing data into 10 portions.)
select*,NTILE(10) over(order by orderamount)as deciles from CustomerOrders
---i. Write a query to print the first and last order dates of the customers in two new columns using:
--i. Group By
select max(orderdate)as max,min(orderdate )as min from CustomerOrders
--ii. Window Functions
select top 1 max(orderdate) over (order by orderdate desc )as max,min(orderdate ) over (order by orderdate )as min from CustomerOrders

---j. Categorise the orders according to the following criterion and then calculate the minimum and maximum order amounts in each category.
with result as(
select*, case when orderamount<=500 then 'a'
		when orderamount<=1000 then 'b'
		else 'c' end as category from CustomerOrders
		)
select distinct category, MAX(result.orderamount) over(partition by result.category)as max,Min(result.orderamount) over(partition by result.category)as min from result