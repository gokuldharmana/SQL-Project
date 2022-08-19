create table cgpa(
Roll_Number int,
Name varchar(20),
X_per float,
Section varchar(2));
insert into cgpa values
(1, 'Ajay', 8.4, 'A'),
(2, 'Priyansh', 9.8, 'B'),
(3, 'Neha', 9.9, 'C'),
(4, 'Pooja', 7.2, 'A'),
(5, 'Salim', 9.5, 'C'),
(6, 'Sahil', 9.8, 'A'),
(7, 'Geeta', 8.4, 'B'),
(8, 'Rahul', 7.6, 'B'),
(9, 'Pinki', 8.4, 'C');
---6
create table cummulative_sum(
ID int,	Date date,	Sales int);
insert into cummulative_sum values
(1,	'2021/09/01',	76),
(2,	'2021/09/02',	53),
(3,	'2021/09/03',	34),
(4,	'2021/10/01',	7),
(5,	'2021/10/02',	12),
(6,	'2021/10/03',	17),
(7,	'2022/01/04',	54),
(8,	'2022/01/05',	33),
(9,	'2022/01/06',	24);

select ID,DATE,sales, sum(sales) over(partition by month(date) order by sales desc) as cumm_sales from cummulative_sum

---QA. Find the overall rank of each student in class.
--Note : Try all the rank functions and suggest which rank function should be used for ranking and why?

select*, RANK()over ( order by x_per desc )as rank,Row_number()over ( order by x_per desc )as row_number,
dense_RANK()over (order by x_per desc ) as dense_rank from cgpa

--QB. WAQ to find the section wise
--a. Average CGPA

select*,AVG(x_per) over (partition by section ) from cgpa

--b. Cumulative average of CGPA

select*,AVG(x_per) over (partition by section order by x_per) from cgpa

--c. First rank holder (Assign lowest rank to highest scorer)

with result as(
select*, dense_RANK()over (partition by section order by x_per  )as rank from cgpa )
select* from (select*, dense_RANK()over (partition by section order by x_per  )as rank from cgpa )a where rank = 1

--d. Highest scorer

select*,dense_RANK()over ( partition by section order by x_per desc  ) as dense_rank from cgpa 

select*,dense_RANK()over ( partition by section order by x_per desc  ) as dense_rank from cgpa 

---4
select* from employee
select* from departments
--a. Find the rank of each employee according to their salary
select*,DENSE_RANK() over(order by salary desc) as rank from employee
--b. Find the 3rd highest salary in the company using a window function.
with result as(
select salary, DENSE_RANK() over(order by salary desc) as rank from employee )
select* from result where result.rank =3

--c. Find the 4th Highest salary in each department.
with result as(
select *, DENSE_RANK() over(partition by dept_id order by salary desc) as rank from employee )
select* from result where result.rank =4
--d. Find the department wise cumulative salary with salary ordered in ascending order.
select*,SUM(salary) over(partition by dept_id order by salary ) as cumm from employee

--e. Print the average salary of the employees in a new column using a window function, partitioning by gender.
select*,avg(salary) over(partition by gender ) as avg_salary from employee

--f. Divide the employees into quartiles by utilizing their Salary to bucket them. Maximum salaried employees should fall in 1st Quartile.
--(Here, Quartile means divide data into 4 buckets)
select *,ntile(4) over( order by salary desc) from employee
---5
select user_id,MONTH(createdat),MAX(amount) over (partition by MONTH(createdat) order by amount desc ) from transaction_table

select id,sales,MONTH(date),MAX(sales) over ( partition by id  ) from cummulative_sum

select ID,DATE,sales, sum(sales) over(partition by month(date) order by sales desc) as cumm_sales from cummulative_sum

select * from(select *,dense_rank() over(partition by userid order by max_amount desc) as rank 
from (select distinct userid,month(created_at) as month_user,sum(amount) over
(partition by userid,month(created_at)) as max_amount from transaction_table)c)d where rank=1 ;
