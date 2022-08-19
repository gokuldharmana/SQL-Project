create database assignment8;
use assignment8

create table table_A(
id int,
a varchar(2));

insert into table_A values
(1,'A'),(2,'A'),(2,'A'),(3,'A'),(3,'A'),(4,'A'),(2,'A'),(NULL,'A');

create table table_B(
id int,
b varchar(2));

insert into table_B values
(1,'B'),(1,'B'),(2,'B'),(3,'B'),(5,'B'),(NULL,'B');

SELECT* FROM table_A AS a
INNER JOIN TABLE_B as b on a.id = b.id;

SELECT* FROM TABLE_A AS a
left join TABLE_B as b on a.id = b.id;

SELECT* FROM TABLE_A AS a
right JOIN TABLE_B as b on a.id = b.id;

SELECT* FROM TABLE_A AS a
full outer JOIN TABLE_B as b on a.id = b.id;

select* from projects
select* from worker
---1
select A.worker_id, b.worker_id,A.first_name,B.project_name from worker as A
inner join projects as B on A.worker_id = b.worker_id
order by A.first_name
---2
select A.first_name,B.project_name from worker as A
left join projects as B on A.worker_id = b.worker_id
order by A.first_name
---3
select A.first_name,count(b.worker_id) as number_of_projects from worker as A
inner join projects as B on A.worker_id = b.worker_id
 group by A.first_name having count(b.worker_id)>1
---4
 select A.worker_id, b.worker_id,A.first_name,B.project_name from worker as A
full outer join projects as B on A.worker_id = b.worker_id
---5
select A.worker_id, b.worker_id,A.first_name,B.project_name from worker as A
right join projects as B on A.worker_id = b.worker_id
order by A.first_name

select  customerid from customers
except
select customerid from orders

select  customerid from customers
intersect
select customerid from orders

select * from customers
select * from orders