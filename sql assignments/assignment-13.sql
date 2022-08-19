---1
create table employee1(
name varchar(20),
year int,
sales int)
insert into employee1 values
('pankaj',2010,72500),
('rahul',2010,60500),
('sandeep',2010,52000),
('pankaj',2011,45000),
('sandeep',2011,82500),
('rahul',2011,35600),
('pankaj',2012,32500),
('pankaj',2010,20500),
('rahul',2011,200500),
('sandeep',2010,32000);
--1a
SELECT* FROM employee1
PIVOT(SUM(SALES) FOR NAME IN(PANKAJ,RAHUL,SANDEEP)) AS PIVOT_SALES
--1b
SELECT* FROM employee1
PIVOT(SUM(SALES) FOR year IN([2010],[2011],[2012])) AS PIVOT_SALES
---2
create table student_marks(
student varchar(20),
subject varchar(20),
marks int)
insert into student_marks values
('jacob','mathematics',100),
('jacob','science',95),
('jacob','geography',90),
('Amilee','mathematics',90),
('Amilee','science',95),
('Amilee','geography',100);
---2a
SELECT* FROM student_marks
PIVOT(SUM(marks) FOR subject IN(mathematics,science,geography)) AS PIVOT1
order by student desc
--2b
create table region_data(
year int,
region varchar(20),
sales int)
insert into region_data values
(2019,'north',1500),
(2019,'south',1800),
(2020,'north',900),
(2020,'south',2200);

select* from region_data
pivot(sum(sales) for region in (north,south)) as pivot2
--3
create table team(
Team1 varchar(1),
Team2 varchar(1),
Result varchar(1))
insert into team values
('A','B','A'),
('A','C','C'),
('B','D','D'),
('A','D','A');

SELECT 
TEAM,SUM(CASE WHEN RESULT = TEAM THEN 1 ELSE 0 END) AS WON,
SUM(CASE WHEN RESULT != TEAM THEN 1 ELSE 0 END) AS LOSS
FROM(SELECT team1 AS TEAM, RESULT FROM team
UNION ALL SELECT team2 AS TEAM, RESULT FROM team
)C
GROUP BY TEAM;


select COUNT() from team
--4
select* from CustomerDetails
--a. Write a query to dynamically filter and get records of cities with a sum of salaries greater than 1.5 Lakhs.
declare @value as varchar(10),
		@query as varchar(100)
set @value=150000
set @query='select city,SUM(salary) from CustomerDetails group by City having SUM(salary)>'+@value
exec (@query)
--b. Write a query to dynamically filter on cities from which we have more than 1 customer.

declare @num as varchar(10),
		@quer as varchar(100)
set @num=1
set @quer='select city,count(CustomerName)  from CustomerDetails group by City having count(CustomerName)>'+@num
exec (@quer)
---5
--a. Write a query to dynamically filter the records which have order date 5 June 2021 or greater.
declare @date as varchar(15);
set @date = '2021-06-05'
select* from CustomerOrders where OrderDate>=@date


Declare @orderDate as varchar(25);
set @orderDate = '2021-06-05'

Select * From CustomerOrders where OrderDate > @orderDate;

--b. Write a query to dynamically filter the records which have employee ID greater than 125.
declare @n as varchar(10),
		@data as varchar(100)
set @n = 125
set @data = 'select* from CustomerOrders where customerid>'+@n
exec(@data)
--c. Write a query to dynamically filter on customers with total spend of 2500 or above.
declare @amount as varchar(10),
		@c as varchar(150)
set @amount = 2500
set @c = 'select customername,sum(orderamount) from CustomerOrders group by customername having sum(orderamount)>='+@amount
exec(@c)