create database assignment9;
use assignment9
----3
create table salesman(
salesman_id int,  name varchar(20),  city varchar(20), commission float)
insert into salesman values
(5001 , 'James Hoog' , 'New York',  0.15),
(5002 , 'Nail Knite',  'Paris',  0.13),
(5005 , 'Pit Alex',  'London',  0.11),
(5006 , 'Mc Lyon',  'Paris' , 0.14),
(5007 , 'Paul Adam',  'Rome',  0.13),
(5003 , 'Lauson Hen',  'San Jose',  0.12);

create table customer ( 
customer_id int,  cust_name varchar(20), city varchar(20),  grade int, salesman_id int)
insert into customer values
(3002 , 'Nick Rimando',  'New York',  100 , 5001),
(3007 , 'Brad Davis',  'New York',  200 , 5001),
(3005 , 'Graham Zusi',  'California',  200 , 5002),
(3008 , 'Julian Green',  'London',  300 , 5002),
(3004 , 'Fabian Johnson',  'Paris',  300 , 5006),
(3009 , 'Geoff Cameron',  'Berlin',  100 , 5003),
(3003 , 'Jozy Altidor',  'Moscow',  200 , 5007),
(3001 , 'Brad Guzan',  'London', null , 5005);

select* from salesman
select* from customer

select A.name,B.cust_name,A.city from salesman as A
INNER JOIN CUSTOMER AS B on A.city = B.city
---4

create table orders( 
ord_no  bigint, purch_amt float, ord_date date, customer_id int,salesman_id int)
insert into orders values
(70001, 150.5, '2012-10-05', 3005, 5002),
(70009,270.65 ,'2012-09-10', 3001, 5005),
(70002, 65.26 ,'2012-10-05', 3002, 5001),
(70004, 110.5, '2012-08-17', 3009, 5003),
(70007, 948.5, '2012-09-10', 3005, 5002),
(70005, 2400.6, '2012-07-27', 3007, 5001),
(70008, 5760, '2012-09-10', 3002, 5001),
(70010, 1983.43, '2012-10-10', 3004, 5006),
(70003, 2480.4 ,'2012-10-10', 3009, 5003),
(70012, 250.45, '2012-06-27', 3008, 5002),
(70011, 75.29, '2012-08-17', 3003, 5007),
(70013, 3045.6, '2012-04-25', 3002, 5001);

select A.ord_no, A.purch_amt, B.cust_name, B.city from orders as A
left join customer as B on A.customer_id = B.customer_id
where purch_amt between 500 and 2000;


----5
create table company_mast(
COM_ID int, COM_NAME varchar(20))
insert into company_mast values
(11, 'Samsung'),
(12 ,'iBall'),
(13 ,'Epsion'),
(14, 'Zebronics'),
(15, 'Asus'),
(16, 'Frontech');

 create Table  item_mast(
PRO_ID int, PRO_NAME varchar(20), PRO_PRICE float, PRO_COM int)
insert into item_mast values
(101, 'Motherboard', 3200.00, 15),
(102, 'Keyboard', 450.00, 16),
(103, 'ZIP drive', 250.00, 14),
(104, 'Speaker', 550.00, 16),
(105, 'Monitor', 5000.00, 11),
(106, 'DVD drive', 900.00, 12),
(107, 'CD drive', 800.00, 12),
(108, 'Printer', 2600.00, 13),
(109, 'Refill cartridge', 350.00, 13),
(110, 'Mouse', 250.00, 12);

select* from company_mast as A
full outer join item_mast as B on A.COM_ID =B.PRO_COM where pro_com = COM_ID
----6
---1
select country,count(distinct customerid)as number_of_customers from customers
group by country
---2
----city,country custcount totalorders
select A.city,A.country,count(distinct A.customerid)as customer_count,count(distinct c.orderid)as total_orders from CUSTOMERS as A
full outer joiN ORDERS as B on A.customerid = B.customerid
full outer joiN ORDERdetails as c on b.orderid = c.orderid
group by A.city,A.country

select* from orders
---3
---ORDERS,ORDERDETAILS,PRODUCTS
SELECT YEAR(A.ORDERDATE)AS YEAR,COUNT(distinct A.ORDERID)AS TOTAL_ORDERS,sum(B.QUANTITY)AS TOTAL_QUANTITY,sum(a.total_order_amount)AS TOTAL_SALES FROM ORDERS AS A 
INNER JOIN ORDERDETAILS AS B ON A.ORDERID = B.ORDERID
INNER JOIN PRODUCTS AS C ON B.PRODUCTID = C.PRODUCTID
GROUP BY YEAR(A.ORDERDATE)
---4
select A.PRODUCT,SUM(B.QUANTITY) AS TOTAL_QUANTITY from PRODUCTS as A
INNER joiN ORDERDETAILS as B on A.PRODUCTid = B.PRODUCTid
group by A.PRODUCT ORDER BY SUM(B.QUANTITY) DESC
----7

select A.act_name,C.dir_name,count(D.movie_id) from actor as A
inner join movie_director_actor as B on A.act_id = B.act_id
inner join director as c on b.dir_id = C.dir_id
inner join movie as d on b.movie_id = d.movie_id
group by  A.act_name,C.dir_name having count(D.movie_id)>=3

----8
create table cumulative (
customer_id varchar(10),
month  DATE,
sales int)

insert into cumulative values
('X101','2020-1-1',20),
('X101','2020-2-1',45),
('X101','2020-3-1',23),
('X101','2020-4-1',76),
('X101','2020-5-1',45),
('X101','2020-6-1',76),
('X101','2020-7-1',35),
('X101','2020-8-1',27),
('X101','2020-9-1',44),
('X101','2020-10-1',90),
('X101','2020-11-1',75),
('X101','2020-12-1',78);

SELECT A.CUSTOMER_ID,MONTH(A.MONTH) AS MONTH ,SUM(B.SALES)AS CUMULATIVE_SALES FROM cumulative AS A
INNER JOIN cumulative AS B ON MONTH(A.MONTH)>=MONTH(B.MONTH) and A.customer_id = b.customer_id
GROUP BY MONTH(A.MONTH),A.CUSTOMER_ID






