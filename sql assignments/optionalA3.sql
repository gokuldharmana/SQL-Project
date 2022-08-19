create database new_data;
use new_data;

create table customer_details(
customerid int,
first_name varchar(10),
last_name varchar(15),
city varchar(20),
country varchar(15),
pincode int);

insert into customer_details 
values
(1,'geetika','chauhan','MHOW','INDIA',453441),
(2,'PIYUSH','PATIDAR','INDORE','INDIA',453401),
(3,'NITIN','CHAUHAN','NEWYORK','USA',666784),
(4,'NAINCY','RAJ','NEW JERSEY','USA',789442);

SELECT* FROM customer_details
---Q2
ALTER TABLE customer_details add state varchar(15);
---Q3
update customer_details set state ='madhya pradesh' where customerid =1 or customerid=2;
update customer_details set state ='US' where customerid =3 or customerid=4;
---Q4
insert into customer_details values (5,'sammer','rajwar','panaji','india',545485,'goa');
---Q5
delete from customer_details where city = 'indore';
---Q6
update customer_details set city ='indore' where first_name = 'geetika';
---Q7
update customer_details set city ='luknow',country ='india',state = 'up' where customerid = 4;
---Q8
delete from customer_details where country ='usa';
---Q9
delete from customer_details;



