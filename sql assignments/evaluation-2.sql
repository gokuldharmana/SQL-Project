create database ecommerce_data
use ecommerce_data

select* from orders
select* from orderdetails
select* from [dbo].[Customers (1)]
select* from products
---Identify the total numbers of orders placed for each PaymentID for order placed between “05/02/2020 and 30/04/2020”----1select paymentid,count(paymentid)as ordresplaced from orders  where orderdate between '2020-02-05' and '2020-04-30' group by paymentid---2select  state, city from [dbo].[Customers (1)] group by state,city----3select* from [dbo].[Customers (1)] where len(firstname)=6 and lastname like 'a%'---4select product,brand from products where brand ='cadbury'----5select product from products where product like '___a%'---6select year(dateentered) as year ,count(customerid) as count_of_custmid from [dbo].[Customers (1)] group by year(dateentered)---7select state ,count(customerid) as count_of_custmid from [dbo].[Customers (1)] group by state----8select Sub_Category,count(distinct product)as count_product from Products group by Sub_Category---9select month(orderdate)as month,count(orderid) as count_orderid from orders where year(orderdate)=2021 group by month(orderdate) order by month(orderdate);---10select customerid,avg(total_order_amount)as avg_amount from orders where year(orderdate)=2020 group by CustomerID---11select max(count(customerid)),month(orderdate) as month,year(orderdate)as year from orders group by month(orderdate),year(orderdate) order by max(count(customerid))descselect concat_ws('&','ravi','suresh','india')Select Sum(Null), Count(Null);a) Select Sum(Null), Count(Null);

b) Select Count(Null);
c) Select Reverse(‘Evaluation2’);
d) Select Right(‘Evaluation2’, 4);



a. Select * from tablename group by col1;
b. Select col1, sum(col2) from tablename having sum(col2) >
value;
c. Select Type, AVG(Rating) as avg_rating FROM Products GROUP
BY Type order by AVG(Rating) Where Rating is NOT NULL;
d. Select Type, AVG(Rating) as avg_rating FROM Products HAVING
Rating is NOT NULL GROUP BY Type order by AVG(Rating);
e. Select ISNULL(col1, col2, col3,col4);
e) Select Replace(‘Evaluation2’, ‘a’,’op’);