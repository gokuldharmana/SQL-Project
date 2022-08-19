create database hello_world;

use hello_world;
create table batesman_list(
batsman varchar(10) primary key,
batsman_order int,
runs int,
icc_id varchar(10));

insert into batesman_list (batsman,batsman_order,runs,icc_id)
values
( 'rohit',1,54,'x575' ),
( 'pujara',2,23,'x335'),
( 'kohli',3,78,'x742'),
( 'sundar',4,null,'null');

select* into batsman_list1 from batesman_list 

alter table batsman_list1 add constraint for_key foreign key (batsman) references batesman_list(batsman);
alter table batsman_list1 drop column batsman
alter table batsman_list1 drop constraint for_key 
alter table batsman_list1 alter column batsman varchar(20) not null;
exec sp_rename 'batsman_list1.batsman','b_man','column';
drop table batsman_list1
drop database hello_world
exec sp_rename 'batsman_list2','batsman_list1'
select runs as runer from batesman_list