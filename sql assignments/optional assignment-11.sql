
select* from CustomerDetails
select* from customerorders
--a. Calculate the total order amount of all the customers using:
--i. Group By
select customerid,SUM(orderamount)as sum_ordres from customerorders group by customerid
--ii. Window Function
select customerid,SUM(orderamount) over(partition by customerid)as sum_ordres from customerorders 

--b. Write a Query to add the city wise cumulative order amounts in a new column.
select A.city,B.orderamount,SUM(B.orderamount) over(partition by A.city order by B.orderamount) from CustomerDetails as A 
INNER JOIN customerorders as B ON A.CustomerName=B.CUSTOMERNAME
--c. Write a Query to find the cumulative sum of order amounts based on ascending order of order dates using:
--i. Self Join
select B.ORDERDATE,B.orderamount,SUM(c.orderamount)as cumm  from CustomerDetails as A 
INNER JOIN customerorders as B ON A.CustomerName=B.CUSTOMERNAME 
INNER JOIN customerorders as C on B.orderdate>=c.orderdate 
group by B.ORDERDATE,B.orderamount order by B.ORDERDATE
--ii. Window Function
select B.ORDERDATE,B.orderamount,SUM(b.orderamount) over(order by orderdate,orderamount)as cumm  from CustomerDetails as A 
INNER JOIN customerorders as B ON A.CustomerName=B.CUSTOMERNAME 
--d. Extract the different Month-Year combinations from the order dates. Now calculate the cumulative average of order amounts
--partitioning by the Month-Year combinations.
select month(orderdate),year(orderdate),AVG(orderamount) over(partition by month(orderdate),year(orderdate)) as avg_amount from customerorders
--e. Write a query to add two different columns: the total order amount for the entire table in the first column, the total order
--amount corresponding to the customer in the second column.
select SUM(orderamount) over(),SUM(orderamount) over (partition by customerid),
SUM(orderamount) over()+SUM(orderamount) over (partition by customerid) from customerorders
--f. Write a Query to find the maximum order amount per customer
--using:
--i. Group By
select  top 1 customerid,MAX(orderamount) from customerorders  group by customerid order by MAX(orderamount) desc
--ii. Window Function
select *,MAX(orderamount)over (partition by customerid  ) from customerorders 