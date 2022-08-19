create database customer_data1;

use customer_data1;

select* from Customersdata

----Q1.1
update customersdata set country = 'united kingdom' where country = 'uk';
----Q1.1
update customersdata set country = 'us' where country = 'usa';
----Q1.2
delete from customersdata where city = 'madrid' or city ='vancouver';
----Q1.3
update customersdata set address = '343,newton street' where customerid = 23;
----Q1.4
update customersdata set city = 'mumbai',country = 'india' where customerid = 4;
----Q1.5
insert into customersdata values(92,'gokul','ramu','131,dharmana street','srikakulam',532421,'india');
----Q1.6
insert into customersdata (customerid,customername,contactname,city,country,address) values (93,'','','araku','India','');

