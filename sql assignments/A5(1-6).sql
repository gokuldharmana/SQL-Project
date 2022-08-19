create database employee_details;
use employee_details;

create table employeeinfo(
empid int,
empfname varchar(10),
emplname varchar(10),
department varchar(10),
project varchar(10),
address varchar(30),
dob date,
gender varchar(2));

insert into employeeinfo values
(1,'sanjay','mehra','HR','P1','Hyderabad(HYD)','01/12/1976','m'),
(2,'Ananya','mishra','admin','P2','Delhi(DEL)','02/05/1968','f'),
(3,'rohan','diwan','account','P3','Mumbai(BOM)','01/01/1980','m'),
(4,'sonia','kulkarni','HR','P1','Hyderabad(HYD)','02/05/1992','f'),
(5,'ankit','kapoor','admin','P2','Delhi(DEL)','03/07/1994','m');




create table employeeposition(
empid int,
empfposition varchar(10),
date_of_joining date,
salary int );

insert into employeeposition values
(1,'manager','01/05/2022',500000),
(2,'executive','02/05/2022',75000),
(3,'manager','01/05/2022',90000),
(4,'lead','02/05/2022',85000),
(5,'executive','01/05/2022',300000);


select* from employeeinfo
select* from employeeposition
----Q6
select gender,count(gender) as gender_COUNT_OF_EMPLOYEES from employeeinfo group by gender;
----Q5
select empfposition,sum(salary) as sum_of_salary from employeeposition where empfposition ='manager'  group by EMPFPOSITION;
---Q4
select empfposition,sum(salary)as sum_of_salary from employeeposition  group by EMPFPOSITION;
---Q3
select department,count(department) as count_of_employee from employeeinfo  group by department having count(department)<2 ;
---Q2
select empid,empfname,emplname,department, count(empid)as count_of_empid from employeeinfo where department ='HR' group by empid,empfname,emplname,department ;
---Q1
select department, count(empid)as count_of_empid from employeeinfo group by (department) order by department;

----optionalQ1
select empfposition, avg(salary) from employeeposition group by empfposition;
----optionalQ2
select gender,count(*) from employeeinfo group by gender
select(cast((select count(gender) from employeeinfo where gender ='m') as float)/cast((select count(gender) from employeeinfo where gender ='f') as float)) from employeeinfo group by gender
----OPTIONALQ3
select *,CAST(SALARY AS varchar(10)) from employeeposition 
----OPTIONALQ4
select empfposition,MAX(salary),MIN(salary) from employeeposition group by empfposition;
----optionalQ5
alter table employeeposition alter column date_of_joining varchar(20);
select cast(date_of_joining as varchar(10)) as dt_j from employeeposition;
select convert(varchar(20),date_of_joining) from employeeposition
----OPTIONALQ6
SELECT DEPARTMENT,COUNT(department) FROM employeeinfo GROUP BY DEPARTMENT HAVING COUNT(DEPARTMENT)>=2
----OPTIONALQ7
SELECT EMPFPOSITION, SUM(SALARY) FROM employeeposition GROUP BY empfposition HAVING SUM(SALARY) > 100000;
----OPTIONALQ8
SELECT *, SALARY + 10000 as New_Salary FROM employeeposition WHERE Salary > 100000
----OPTIONALQ9
SELECT SUM(CAST(SALARY * 2 AS int)) as New_Salary FROM employeeposition GROUP BY empfposition HAVING SUM(Salary )> 50000
----OPTIONALQ10
SELECT project,count(project) from employeeinfo where emplname like '%[nm]%' group by project having count(project)>=2;
----optionalQ11
select*, cast(salary*2 as int) as new_salary from employeeposition order by new_salary desc;

select* from employeeinfo where emplname like'%[nm]%'




