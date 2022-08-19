CREATE DATABASE NEWFILE
USE NEWFILE

CREATE table salesman(
salesman_id int,
name varchar(20),
city varchar(20),
commisson float);

insert into salesman values
(5001 , 'James Hoog',  'New York' , 0.15),
(5002 , 'Nail Knite',  'Paris',  0.13),
(5005 , 'Pit Alex' , 'London',  0.11),
(5006 , 'Mc Lyon',  'Paris' , 0.14),
(5007 , 'Paul Adam',  'Rome',  0.13),
(5003 , 'Lauson Hen',  'San Jose' , 0.1);

create table orders (
ord_no int,
purch_amt float,
ord_date date,
customer_id int,
salesman_id int);
insert into orders values
(70001, 150.5, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.5, '2012-08-17', 3009, 5003),
(70007, 948.5, '2012-09-10', 3005, 5002),
(70005, 2400.6, '2012-07-27', 3007, 5001),
(70008, 5760, '2012-09-10', 3002, 5001),
(70010, 1983.43, '2012-10-10', 3004, 5006),
(70003, 2480.4, '2012-10-10', 3009, 5003),
(70012, 250.45, '2012-06-27', 3008, 5002),
(70011, 75.29, '2012-08-17', 3003, 5007),
(70013, 3045.6, '2012-04-25', 3002, 5001);

---a. Write a SQL query to find all the orders issued by the salesman 'Paul Adam'. Return
--ord_no, purch_amt, ord_date, customer_id and salesman_id.

select*from orders where salesman_id =(select salesman_id from salesman where name = 'paul adam')

---b. Write a SQL query to find the order values greater than the average order value of 10th
--October 2012. Return ord_no, purch_amt, ord_date, customer_id, salesman_id.

select* from orders where purch_amt>(select AVG(purch_amt) from orders where ord_date = '2012-10-10');

---c. Write a SQL query to find those salespeople who earned the maximum commission.
--Return ord_no, purch_amt, ord_date, and salesman_id.

select* from orders where salesman_id =(select salesman_id from salesman where commisson =(select max(commisson) from salesman))
---or
select  B.salesman_id,B.name,B.city ,sum(A.purch_amt*B.commisson) as Total_commission 
from orders as A left join salesman as B 
on A.salesman_id=B.salesman_id 
group by B.salesman_id,B.name,B.city
order by sum(A.purch_amt*B.commisson) desc;

----d. Write a SQL query to find those orders, which are higher than the average amount of the
--orders. Return ord_no, purch_amt, ord_date, customer_id and salesman_id.

select* from orders where purch_amt>(select AVG(purch_amt) from orders );
