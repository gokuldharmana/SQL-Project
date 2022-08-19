create table venue_rating(
venueid int,
venue_name varchar(10),
rating int)

insert into venue_rating values
(1,'AB',2),
(2,'BC',3),
(3,'CD',1),
(4,'DE',3),
(5,'EF',4),
(6,'FG',5),
(7,'GH',3),
(8,'HI',4),
(9,'IJ',2),
(10,'JK',1);

SELECT case when rating<=2 then 'Good'
			when rating<=4 then 'Average'
			when rating=5 then 'Worst' end as buckets,
count(rating) as count_of_rating 
from venue_rating
group by case when rating<=2 then 'Good'
			when rating<=4 then 'Average'
			when rating=5 then 'Worst' end

SELECT case when rating<=2 then 'Good'
			when rating<=4 then 'Average'
			when rating=5 then 'Worst' end as buckets,
	avg(case when rating<=2 then rating
			when rating<=4 then rating
			when rating=5 then rating end) as avg_rating 
from venue_rating
group by case when rating<=2 then 'Good'
			when rating<=4 then 'Average'
			when rating=5 then 'Worst' end


			select* from Customers
select * from customers order by case when country in ('canada','mexico') then 0 else 1 end,CustomerName

select case when len(country)<=3 then 'short'
			when len(country)<=6 then 'middle'
			when len(country)>6 then 'large' end,count(customerid)
from Customers
group by case when len(country)<=3 then 'short'
			when len(country)<=6 then 'middle'
			when len(country)>6 then 'large' end

select case when len(postalcode)<=4 then 'short'
			when len(country)<=5 then 'middle'
			when len(country)>5 then 'large' end as length,count(customerid) as count_of_customers
from Customers
group by case when len(postalcode)<=4 then 'short'
			when len(country)<=5 then 'middle'
			when len(country)>5 then 'large' end
order by count(customerid)