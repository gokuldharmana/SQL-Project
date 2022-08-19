
create table employee(
ID int,
Name varchar(20),
Salary int,
Job_Role varchar(20),
Gender  varchar(2),
Dept_ID int);
insert into employee values
(102, 'Amit', 70000 ,'Business Analyst', 'M', 2),
(103 ,'Rahul', 62000 ,'Data Analyst', 'M', 1),
(105, 'Rina ',60000, 'Accountant', 'F', 5),
(106, 'Dilip', 74000, 'SDE', 'M', 1),
(107, 'Aman', 81000, 'Accountant', 'M', 5),
(108, 'Neha', 50000, 'Receptionist', 'F', 4),
(110, 'Bhupendra', 32000, 'Salesman', 'M', 3),
(111 ,'Ashish', 73000, 'Business Analyst', 'M', 2),
(112, 'Pooja', 45000 ,'Generalist', 'F', 4),
(114, 'Neelu', 30000, 'Help Desk', 'F', 4),
(115, 'Amar', 87000, 'SDE', 'M', 1),
(116, 'Priyansh', 345000, 'President', 'M', 2),
(117, 'Hema', 187000, 'VP', 'F', 2),
(119, 'Swami', 30000, 'Salesman', 'M', 3),
(120, 'Salman', 91000, 'Data Scientist', 'M', 1);

create table departments(
ID int,
Department varchar(20));
insert into departments values
(1, 'IT'),
(2, 'Management'),
(3, 'Sales'),
(4, 'HR'),
(5, 'Accounts');

---Q.1 Find the following from the given tables.
--a. Find the cumulative sum of salary using:
--i. window function
select*,SUM(salary) over ( order by id) as salary_cumm from employee
--ii. self join
select A.ID,A.Name,A.Salary,A.job_role,A.Gender,A.Dept_ID,SUM(B.Salary) as cumm_salary from employee as A
inner join employee as B ON A.ID >=B.ID
GROUP BY A.ID,A.Name,A.Salary,A.job_role,A.Gender,A.Dept_ID
--b. Find the department wise average salary using:
--i. Window function
select A.Dept_ID,B.Department,A.SALARY,AVG(A.salary) over(PARTITION BY DEPT_ID ) from employee as A 
inner join departments as B ON A.Dept_ID=B.ID
--ii. Group By
select B.Department,AVG(A.salary) from employee as A 
inner join departments as B ON A.Dept_ID=B.ID
GROUP BY B.Department order by B.Department

---c. Find the employees who have their salary greater than their Department’s average
--salary.

select * from (select * ,Avg(salary) over (partition by Dept_ID) As AVG_SAL from Employee)AAA where salary>AVG_SAL;
--or
select A.NAME,A.Dept_ID,B.Department,A.SALARY,AVG(A.salary) from employee as A 
inner join departments as B ON A.Dept_ID=B.ID
Where Salary>(select avg(Salary) from employee )
GROUP BY  A.NAME,A.Dept_ID,B.Department,A.SALARY

---d. Write a query to print the maximum salary per job role (using window function)

select*,max(salary) over ( partition by job_role ) as salary_max from employee

---e. Write a query to print the minimum salary per job role (using window function)

select*,min(salary) over ( partition by job_role ) as salary_min from employee

---f. Write a query to print the maximum salary per job role (using window function),
--minimum salary per job role (using window function) in two separate columns in the
--output table (this is a combination of 1c and 1d).

select*,max(salary) over ( partition by job_role ) as salary_max,min(salary) over ( partition by job_role ) as salary_min from employee

---g. Write a query to print the maximum salary per department (using window function)

select*,max(a.Salary) over ( partition by b.department ) as salary_max  from employee as A 
inner join departments as B ON A.Dept_ID=B.ID
---h. Write a query to print the minimum salary per department (using window function)

select*,min(a.salary) over ( partition by b.department ) as salary_min  from employee as A 
inner join departments as B ON A.Dept_ID=B.ID
---2
---a. Create a view for each department and name the view in the name of the department.
create view name_of_the_department as
select department from departments
---b. Create a view for each gender and name the view as male and female.
create view male_and_female as
select gender from employee group by Gender
---c. Create a view containing 5 highest paid employees.
create view highest_paid_employee as
select top 5 * from employee order by Salary desc

---4
select *,AVG(transaction_value) over(partition by type order by transaction_value) from bank_transactions