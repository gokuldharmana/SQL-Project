create database hello_world2;

use hello_world2;

create table user_details(
serial_number int,
first_name varchar,
last_name varchar,
number int,
city varchar,
country varchar);

insert into user_details(pincode) values (532421),(012456),(654897);

alter table user_details alter column number varchar;
alter table user_details drop column country;
alter table user_details add pincode int;
drop table user_details;
alter database[hello_world2] set offline with rollback immediate
drop database[hello_world2];
select* from user_details;

