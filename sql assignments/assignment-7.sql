use student_data

select* from Students
---1
---a. Students who passed SQL or Excel but failed Python
select * from students where SQL_Pass_Fail='pass' or Excel_Pass_Fail='pass'
intersect
select * from students where Python_Pass_Fail='fail'
---b. Students who passed Python or Excel but failed SQL
select * from students where Python_Pass_Fail='pass' or Excel_Pass_Fail='pass'
intersect
select * from students where SQL_Pass_Fail='fail'
---c. Students who passed SQL or Python but failed Excel
select * from students where SQL_Pass_Fail='pass' or Python_Pass_Fail='pass'
intersect
select * from students where Excel_Pass_Fail='fail'
---d. Students who failed SQL or Excel but passed Python
select * from students where SQL_Pass_Fail='fail' or Excel_Pass_Fail='fail'
intersect
select * from students where Python_Pass_Fail='pass'
---e. Students who failed Python or Excel but passed SQL
select * from students where Excel_Pass_Fail='fail' or Python_Pass_Fail='fail'
intersect
select * from students where SQL_Pass_Fail='pass'
---f. Students who failed SQL or Python but passed Excel
select * from students where SQL_Pass_Fail='fail' or Python_Pass_Fail='fail'
intersect
select * from students where Excel_Pass_Fail='pass'

----3
----a. Students whose names start with A and who joined in march
select*, case when student_name like 'a%' and month (joining_date)=3 then Student_Name end as name_3 from students 

----b. Students having C in their name and at least 7 characters in their name.
select*, case when student_name like '%c%' and Student_Name like'%_______%' then Student_Name end as c_name from students 

----c. In which month the maximum number of students registered
select count(student_name),month(joining_date) from Students group by month(joining_date) order by count(student_name) desc
----OR
select case 
			 when joining_date is not null then month(joining_date) 
			 end  as months,count(student_name) as count
from Students 
group by case when joining_date is not null then month(joining_date) 
			  end 
order by count(student_name) desc

----d. Student with minimum duration(days, and months) in EXCEL, SQL and python.
select student_name,min(datediff(day,joining_date,leaving_date)),min(datediff(month,joining_date,leaving_date)) from students group by datediff(day,joining_date,leaving_date),datediff(month,joining_date,leaving_date),Student_Name
----OR
select student_name, min(case when datediff(day,joining_date,leaving_date) is not null then datediff(day,joining_date,leaving_date)end)AS duration_of_day,
min(case when datediff(MONTH,joining_date,leaving_date) is not null then datediff(MONTH,joining_date,leaving_date)end) as duration_of_month
from Students
group by Student_Name order by min(case when datediff(day,joining_date,leaving_date) is not null then datediff(day,joining_date,leaving_date)end ),
min(case when datediff(MONTH,joining_date,leaving_date) is not null then datediff(MONTH,joining_date,leaving_date)end)
---e. Section wise average duration (days and months) of students in course.
select section,avg(datediff(day,joining_date,leaving_date)),avg(datediff(month,joining_date,leaving_date)) from students group by Section
----OR
select section, avg(case when datediff(day,joining_date,leaving_date) is not null then datediff(day,joining_date,leaving_date)end)as avg_of_day,
avg(case when datediff(MONTH,joining_date,leaving_date) is not null then datediff(MONTH,joining_date,leaving_date)end)as avg_of_month
from Students
group by Section
----2
create table marks (id int,name varchar(20),score int);

insert into marks values
(1,'simisola',60),(2,'ivan',80),(3,'metodija',52),(4,'callum',98),(5,'lela',84),
(6,'aparecida',82),(7,'ursula',69),(8,'ramazan',78),(9,'corona',87),(10,'alise',57),
(11,'galadriel',89),(12,'merel',99),(13,'cherice',55),(14,'nithya',81),(15,'elsad',71),
(16,'lissi',90),(17,'johanna',90),(18,'anfisa',90),(19,'ryosuke',97),(20,'sakchai',61),
(21,'elbert',63),(22,'katelyn',51);

select*,
CASE
    WHEN score >= 93 then 'A+'
    WHEN score > 90 then 'A'
	WHEN score >= 90 then 'A-'
    WHEN score >= 85 then 'B+'
    WHEN score > 80 then 'B'
	WHEN score >= 80 then 'B-'
	WHEN score >= 75 then 'C+'
    WHEN score > 70 then 'C'
	WHEN score >= 70 then 'C-'
    WHEN score >= 65 then 'D+'
	WHEN score >= 60 then 'D'
	when score< 60 then 'F'
    
     end as GRADE
FROM marks
select* from marks

----2a
 select CASE WHEN score >=60 then 'pass' else 'fail'end as result,COUNT(NAME)as number_of_students
 FROM marks 
 GROUP BY  CASE WHEN score >=60 then 'pass' else 'fail'end 

----2b
 select CASE
    WHEN score >= 93 then 'A+'
    WHEN score > 90 then 'A'
	WHEN score >= 90 then 'A-'
    WHEN score >= 85 then 'B+'
    WHEN score > 80 then 'B'
	WHEN score >= 80 then 'B-'
	WHEN score >= 75 then 'C+'
    WHEN score > 70 then 'C'
	WHEN score >= 70 then 'C-'
    WHEN score >= 65 then 'D+'
	WHEN score >= 60 then 'D'
     when score< 60 then 'F'
     end as grade,count(name) as number_of_students
	 from marks
	 group by CASE
    WHEN score >= 93 then 'A+'
    WHEN score > 90 then 'A'
	WHEN score >= 90 then 'A-'
    WHEN score >= 85 then 'B+'
    WHEN score > 80 then 'B'
	WHEN score >= 80 then 'B-'
	WHEN score >= 75 then 'C+'
    WHEN score > 70 then 'C'
	WHEN score >= 70 then 'C-'
    WHEN score >= 65 then 'D+'
	WHEN score >= 60 then 'D'
	when score< 60 then 'F'     
	end
			
			