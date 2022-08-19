
create table HIA(
DEPARTMENT_ID int,
DEPARTMENT_NAME varchar(20),
MANAGER_ID int,
LOCATION_ID int);
insert into HIA values
(10, 'Administration', 200, 1700),
(20, 'Marketing', 201, 1800),
(30, 'Purchasing', 114 ,1700),
(40, 'HumanResources', 203, 2400),
(50, 'Shipping', 121, 1500),
(60, 'IT', 103, 1400);

create table emply_details(
EMPLOYEE_ID int,
FIRST_NAME varchar(20),
LAST_NAME varchar(20),
EMAIL varchar(20),
SALARY int,
MANAGER_ID int,
DEPARTMENT_ID int);
insert into emply_details values
(100, 'Steven', 'King', 'SKING', 24000, 0, 90),
(101, 'Neena', 'Kochhar', 'NKOCHHAR', 17000, 100, 90),
(102, 'Lex De', 'Haan', 'LDEHAAN', 17000 ,100, 90),
(103, 'Alexander', 'Hunold', 'AHUNOLD', 9000, 102, 60),
(104, 'Bruce', 'Ernst', 'BERNST', 6000, 103, 60),
(105, 'David', 'Austin', 'DAUSTIN', 4800, 103, 60);

create table grade(
GRADE_LEVEL varchar(2),
LOWEST_SAL int,
HIGHEST_SAL int);
insert into grade values
('A', 1000, 2999),
('B', 3000, 5999),
('C', 6000, 9999),
('D', 10000, 14999),
('E', 15000, 24999),
('F', 25000, 40000);

---1a
select B.FIRST_NAME,B.LAST_NAME,A.DEPARTMENT_NAME,B.DEPARTMENT_ID from HIA as A
RIGHT JOIN emply_details AS B on A.DEPARTMENT_ID = B.DEPARTMENT_ID

---1b
select 
 case when salary between 1000 and 2999 then 'A'	
		when salary between 3000 and 5999 then 'B'
		when salary between 6000 and 9999 then 'C'
		when salary between 10000 and 14999 then 'D'
		when salary between 15000 and 24999 then 'E'
		when salary between 25000 and 40000 then 'F'
		END AS JOBGRADE,SALARY
from  emply_details 

---1c
select* from  HIA as A
JOIN emply_details AS B on A.MANAGER_ID = B.MANAGER_ID

---2
create table cumm(
Cust_ID varchar(2),
Date date,
Amount int);
insert into cumm values
('A', '2018-01-26', 74),
('D', '2018-01-26', 77),
('A', '2018-01-27', 95),
('A', '2018-01-28', 88),
('B','2018-01-27', 75),
('A', '2018-01-31', 59),
('A', '2018-01-29', 97),
('B', '2018-01-29', 86),
('B', '2018-01-28', 68),
('A', '2018-02-05', 60),
('B', '2018-02-05', 77),
('B', '2018-01-31', 96),
('C', '2018-02-02', 81),
('C', '2018-02-04', 70),
('D', '2018-02-04', 99),
('C', '2018-01-31', 53),
('C', '2018-01-29' ,95),
('D', '2018-01-29', 66);

select A.Cust_ID,A.DATE,A.AMOUNT,SUM(B.AMOUNT)AS CUMMULATIVE from cumm as A
INNER JOIN cumm as B on  A.Cust_ID = B.Cust_ID AND A.Date>=B.Date
GROUP BY A.Cust_ID, A.DATE,A.AMOUNT


---3
---a) Write an SQL query that returns the employees (number and name only) who have a
--title of 'EE' or 'SA' and make more than $35,000, order the data on the basis of the last 3
--characters of the first name in ascending order.
SELECT ENO,FIRST_NAME,LAST_NAME FROM emp WHERE TITLE LIKE 'EE'OR'SE' AND SALARY >$35000
ORDER BY RIGHT(FIRST_NAME,3)

---b) Write an SQL query that returns the project name, department name, and budget
--for all projects with a budget < $50,000.
SELECT A.PNAME,B.DEPT_NAME,A.BUDGET FROM PROJ AS A
LEFT JOIN DEPT AS B ON A.DNO =B.DEPT_NO
WHERE budget < $50000
---4
---1. Add “@abccompany.com” in the end to email and create a new column called Email_detail

select*,CONCAT(email,'@abccompany.com')as email_detail from employees
---2. Find cumulative average of commission_pct at department_id and manager_id level.
--Exclude the records which have commission_pct as Zero(0)

select A.DEPARTMENT_ID,A.MANAGER_ID,AVG(b.COMMISSION_PCT)as cumm from employees as A
INNER JOIN  EMPLOYEES  AS B ON A.EMPLOYEE_ID>=B.EMPLOYEE_ID AND A.DEPARTMENT_ID = B.DEPARTMENT_ID AND A.MANAGER_ID = B.MANAGER_ID 
where b.commission_pct<>0
GROUP BY A.DEPARTMENT_ID,A.MANAGER_ID

---3. Find maximum and minimum salary for employees under each Manager with their Name

select B.FIRST_NAME AS MANAGER_FIRST_NAME,B.LAST_NAME AS MANAGER_LAST_NAME,MAX(A.salary)as max_salary,MIN(A.salary)as min_salary
from Employees as A INNER JOIN Employees AS B 
ON B.EMPLOYEE_ID = A.MANAGER_ID
GROUP BY B.FIRST_NAME,B.LAST_NAME
---4. Find all the employees who have “an” in first name and “a” in last name along with their manager’s name

select A.EMPLOYEE_ID,A.FIRST_NAME,A.last_name,B.FIRST_NAME AS MANAGER_first_NAME,B.LAST_NAME AS MANAGER_last_NAME from Employees as A 
INNER JOIN Employees AS B ON   B.EMPLOYEE_ID = A.MANAGER_ID
where A.FIRST_NAME like '%an%' and A.LAST_NAME like '%a%'

---5

---a. Write a query to show the number of users, number of transactions placed, and total
--order amount per month in the year 2020. Assume that we are only interested in the
--monthly reports for a single year (January-December).

SELECT MONTH(A.CREATED_AT),COUNT(A.USER_ID),COUNT(A.TRANSACTION_ID),SUM(B.PRICE) FROM TRANSACTIONS AS A 
INNER JOIN PRODUCTS AS B ON A.PRODUCT_ID = B.ID
INNER JOIN USERS AS C ON A.USER_ID = C.ID
WHERE YEAR(A.CREATED_AT) =2020
GROUP BY MONTH(A.CREATED_AT)

---b. Write a query to find female to male ratio for no of orders placed during time period
--Jan’20-Jun’20


SELECT C.SEX,COUNT(A.TRANSACTION_ID) FROM TRANSACTIONS AS A 
INNER JOIN PRODUCTS AS B ON A.PRODUCT_ID = B.ID
INNER JOIN USERS AS C ON A.USER_ID = C.ID
WHERE A.CREATED_AT BETWEEN '2020-01-01' AND '2020-06-31'
GROUP BY C.SEX

---c. Write a query to fetch details of Customers who were the highest and lowest spender
--during Q2 and Q3 of any particular year.

SELECT Cust_id,MAX(amount)as max_amount,MIN(amount)as min_amount FROM cumm
WHERE year(date)=2018
GROUP BY Cust_id

SELECT ENO,FIRST_NAME,LAST_NAME,MAX(salary)as amx_amount,MIN(salary) FROM emp 
WHERE year(b_date)=2020
GROUP BY ENO,FIRST_NAME,LAST_NAME