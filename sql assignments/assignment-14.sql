create table emp(
employeeid int,
name varchar(20),
department varchar(20),
age int,
salary int);

insert into emp values
(1,'adam','r&d',19,50000),
(2,'james','finance',19,100000),
(3,'andrew','marketing',24,80000),
(4,'harry','marketing',23,75000),
(5,'helen','finance',30,120000),
(6,'selena','r&d',40,125000),
(7,'sleve','r&d',43,135000),
(8,'peter','finance',38,125000),
(9,'jacob','marketing',35,120000),
(10,'kaly','marketing',19,130000);

create procedure proc_1
as
begin select* from emp end;

exec proc_1

create table clg (
collegeid int,
firstname varchar(20),
lastname varchar(20),
stream varchar(30),
email varchar(50),
phone bigint);

insert into clg values
(1601,'james','brown','computer science','james123@brown@yahoo.com',12524376953),
(1801,'selena','gomez','arts','gomezsalena@gmail.com',11890507672),
(1918,'will','smith','economics','willsmith@yahoo.com',11305193063),
(2060,'michael','smith','computer networking','mic1023@gmail.com',11765905601),
(3186,'maria','garcia','archaeology','garciamaria@gmail.com',13894098396),
(4015,'robert','johnson','aeronautics','robertjohn.109@yahoo.com',11658359021),
(5197,'valentina','hernandez','computer applications','hernandez.valentinayahoo.com',11986797645),
(6092,'johnny','wick','electronics','wick.johnny@gmail.com',11453648094);
create procedure proc_2 @id int
as
begin
delete from clg where collegeid=@id
end
exec proc_2 6092

select* from clg

---4
create table stud_data(
Names varchar(20),
Math_marks int, 
English_marks int, 
Physics_marks int, 
Total int,
Average int);


create table audit_table1(
[names] varchar(20),
[Math_marks] int, 
[English_marks] int, 
[Physics_marks] int, 
[Total] int,
[Average] int,
[time_data] datetime,
[operation] varchar(10));

CREATE TRIGGER TRIG_AUDIT
on stud_data
after insert,delete
as 
begin
insert into audit_table1(
names,
Math_marks,
English_marks ,
Physics_marks , 
Total ,
Average ,
time_data ,
operation )
select 
Names,
Math_marks ,
English_marks ,
Physics_marks , 
Total ,
Average ,getdate(),'ins' from inserted
union all
select 
Names,
Math_marks ,
English_marks ,
Physics_marks , 
Total ,
Average ,getdate(),'del' from deleted
end;

insert into stud_data values('sam',26,41,35,102,34);
delete from stud_data where names ='sam'

select* from stud_data
select* from audit_table1


