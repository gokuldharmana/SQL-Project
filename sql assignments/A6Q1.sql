use student_data;

select* from Students order by Joining_Date

select STUDENT_NAME, left(student_name,3)AS s_n from Students

select student_name,upper(student_name) as upper_case,lower(student_name) as lower_case from students

select student_name ,reverse (student_name) from Students

select concat(student_name,'-',section) from Students

SELECT STUDENT_NAME,LEN(STUDENT_NAME)as length FROM STUDENTS

SELECT  MAX(SQL_marks)as max_sql,MAX(Python_Marks)as max_python,MAX(Excel_Marks)as max_excel,Min(SQL_marks)as min_sql,Min(Python_Marks)as min_python,Min(Excel_Marks)as min_excel from students

select avg(SQL_marks)as avg_sql,avg(Python_Marks)as avg_python,avg(Excel_Marks)as avg_excel from Students

select count(id) as no_of_students from students

select joining_date ,day(joining_date)as day,month(joining_date)as month,year(joining_date)as year from students

select student_name,DATEDIFF(day,joining_date,leaving_date)as no_of_days from students

select joining_date,DATEADD(day,5,joining_date)as diff_date from Students

select *, day(joining_date) as day,month(joining_date)as month from students where day(joining_date)>10 order by month(joining_date)






select sql_pass_fail,count(sql_pass_fail)as no_of_pass from students where SQL_Pass_Fail ='pass' group by SQL_Pass_Fail

select Python_Pass_Fail,count(Python_Pass_Fail)as no_of_fail from students where Python_Pass_Fail ='fail' group by Python_Pass_Fail

select month(joining_date)as month,count(excel_pass_fail)as excel_pass from students where Excel_Pass_Fail ='pass' group by month(joining_date)

select month(joining_date)as month,count(SQL_Pass_Fail)as sql_fail from students where SQL_Pass_Fail ='fail' group by month(joining_date)

select section,count(python_pass_fail) from students where Python_Pass_Fail ='fail' group by Section

select student_name,section,month(joining_date)as month from students where Section ='a' group by MONTH(joining_date),Section,Student_Name

select dateadd(day,-5,'2022-02-22')


/

alter table students alter column sql_marks varchar(10)
select * from Students  update Students set SQL_Marks=sql_marks%100
----Qh
select id,day(joining_date) from students where day(joining_date)%2 =0
----Qc
select month(joining_date),count(id) from students  group by month(joining_date)  order by count(id) desc
---Qe
select section,avg(datediff(day,joining_date,leaving_date)),avg(datediff(MONTH,joining_date,leaving_date)) from students group by section
----Qd
select min(datediff(day,joining_date,leaving_date)),min(datediff(MONTH,joining_date,leaving_date)) from students 
----Qa
select * from students where Student_Name like 'a%' and month(joining_date)=9
----Qb
select*,len(student_name) from students where len( Student_Name )>=7 and student_name like'%c%'

select student_name, min(datediff(day,joining_date,leaving_date)) as days,min(datediff(MONTH,joining_date,leaving_date)) as months from students group by Student_Name order by min(datediff(MONTH,joining_date,leaving_date))
----Qg
select dateadd(day,45,joining_date),dateadd(day,-45,leaving_date),datediff(day,dateadd(day,45,joining_date),dateadd(day,-45,leaving_date)) from students 
----Qj
select joining_date,day(joining_date),month(joining_date) from students where day(joining_date)>10
----Qi
select joining_date,dateadd (day,5,joining_date),datediff(day,joining_date,dateadd (day,5,joining_date)) from students
----Qk
select joining_date,replace(joining_date,'-','') from Students
---Ql
select python_marks,concat(python_marks,'/',100) from Students