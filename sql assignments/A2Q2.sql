create database customer_data;

use customer_data;
alter table customers add constraint prim_key primary key (customerid);
alter table customers drop constraint prim_key;
alter table customers alter column customerid float;
alter table customers add old_customer_flag varchar(3) not null default('yes');

select* from Customers;

