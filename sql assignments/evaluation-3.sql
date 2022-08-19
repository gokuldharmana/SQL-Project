create database ecommerce
use ecommerce

select* from products
select* from category
---i. Segment the customers into “New” and “Old” categories.
--Tag the customer as “New” if his database stored date is
--greater than “1st July 2020” else tag the customer as “Old”

select*, case 
when dateEntered>'2020-07-01' then 'NEW'
 ELSE 'OLD' end as categories from customers

---ii. Identify the count of distinct products that the company sells
--within each category

select B.categoryname,count(distinct A.product) AS count_of_product from products as A
inner join category as B on A.category_id = b.categoryid
group by B.categoryname

---iii. Identify the average order amount by each CustomerID in
--each month of Year “2020”

select customerid,month(orderdate) as month,year(orderdate)as year,avg(total_order_amount)as avg_of_amount from orders where year(orderdate) =2020
group by customerid,month(orderdate),year(orderdate)

---iv. Identify the Month-Year combinations which had the highest
--customer acquisition

select month(dateentered) as month,year(dateentered) as year,count(distinct customerid) as no_of_customers from customers
group by month(dateentered),year(dateentered) order by count(distinct customerid) desc

---v. Identify the most selling ProductID in 2021 order detais orders products

select  year (c.orderdate) AS YEAR,count(B.productid) AS TOTAL_PRODUCTID from orderdetails as A
inner join products as B on A.productid = B.productid
inner join orders as C on A.orderid = C.orderid
where year (c.orderdate) = 2021
GROUP BY  year (c.orderdate)

---vi. Identify which Supplier ID supplied the least number of products

SELECT supplierid,count(B.product) FROM ORDERDETAILS AS A
inner join products as B on A.productid = B.productid
group by supplierid order by count(B.product)

---vii. The leadership wants to know the customer base who have
--ordered only once in the 6 months tenure (Jul-21-Dec’21)
--such that they can be provided with certain offers to prevent
--customer churn.

select A.customerid, A.FIRSTname,A.lastname,month(orderdate) as month,count(B.orderid) as order_count from customers as A
inner join orders as B on A.customerid =B.customerid
where orderdate between '2021-07-01' and '2021-12-31'
group by  A.customerid,A.FIRSTname,A.lastname,month(orderdate) having count(B.orderid) = 1
order by month(orderdate)

--a. Also, find the number of purchases in each category for
--these customers.

select A.customerid, A.FIRSTname,A.lastname,month(orderdate) as month,count(B.orderid) as order_count,count(D.category_id) as count_of_category   from customers as A
inner join orders as B on A.customerid =B.customerid
inner join orderdetails as c on B.orderid = C.orderid
inner join products as d on c.productid = d.productid
where orderdate between '2021-07-01' and '2021-12-31'
group by  A.customerid,A.FIRSTname,A.lastname,month(orderdate) having count(B.orderid) = 1
order by month(orderdate)

---viii. The company is tying up with a Bank for providing offers to a
--certain set of premium customers only. We want to know
--those customers who have ordered for a total amount of
--more than 7000 during last quarter of Year 21

select * from orders where orderdate between '2021-09-01' and '2021-12-31' and Total_order_amount>7000


---ix. We need to flag the Shipper companies whose average
--delivery time is less than 3 days to incentivize them

select B.CompanyName,datediff(day,orderdate,deliverydate)as no_of_days from Orders as A
INNER JOIN shippers as b on A.SHIPPERID = B.shipperid where datediff(day,A.orderdate,A.deliverydate)<3 

---x. Write a query to show the number of customers, number of
--orders placed, and total order amount per month in the year
--2021. Assume that we are only interested in the monthly
--reports for a single year (January-December).

select count(customerid)as custm_id,count(orderid)as ord_id,sum(total_order_amount)as total_sum,month(orderdate)as month from Orders
where year(orderdate) = 2021 group by month(orderdate) order by  month(orderdate) 


---xi. Find the no. of orders fulfilled by Suppliers residing in the
--same Country as the customer.

select count(c.OrderID) as count_of_orders from OrderDetails as A
inner join  suppliers as B on A.supplierid = B.SupplierID
inner join orders as C on A.orderid = C.OrderID
inner join customers as D on c.CustomerID = d.CustomerID
where D.country = B.Country

