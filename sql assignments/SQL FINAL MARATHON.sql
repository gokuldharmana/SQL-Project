
---4
select usser,sum(sum) from (select sender as usser,-sum(amount) as Sum from transactions group by sender union all 
select receiver as usser , sum(amount) as Sum from transactions group by receiver) c group by usser

---5
select *,datediff(day,Second_latest,date) from
(select *,
lag(date,1) over (partition by User_id order by Date) as Second_latest 
from action1)AA;

---6
select*,AVG(tranasaction_value) 
over(partition by user_id order by created_at desc rows between 3 preceding and current row)
from bank_transactions

---7
select* from employee as A
Inner join employee as B on B.empid = A.manager_id

---8

select a.salesman_id,name from transaction_details as a inner join sales_team_detail as b
on a.salesman_id = b.salesman_id
where purchase_amount > (select min(purchase_amount) from transaction_details
where ord_date = '2012-10-10');

---OR
select salesman_id,name,from sales_team_details as A 
INNER JOIN transcation_details as B ON A.Salesman_id =  B.Salesman_id
WHERE ordervalues >
(select top 1 purchase_amount from transcation_details where ord_date ='2012-10-10')


--PART2
--1
select * from (
select*, dense_rank() over(partition by depatid order by salary desc) as rank1
where rank1 = 4
from emp) c
where salary = salary - rank1;
--1B
Create procedure PR @Rank int
as 
begin 
select * from (
select *,dense_rank() over (partition by Dept_ID order by salary desc) as Rank1 
from Employee)aa where rank1= @Rank;

exec PR 3;
From Prakash Keshari to Everyone 02:16 PM
end;

--2
---B
select * from (select B.actorname,C.dir_name,dense_rank()over(order by count(movie_ID)DESC)AS TTT
from  movie_director_actor as A left join 
Actor as B on A.act_id=B.act_id left join 
Director as C on A.dir_ID=C.dir_ID)as RR where TTT=4 or TTT=3

--3
---B
select * from ( select managerID,count(employeeID) from employee group by managerID having count(employeeID)>=7)as s
inner join employee as B on S.managerID=B.employeeID
--C
