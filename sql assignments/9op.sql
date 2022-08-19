
create table cumulative4 (
id int,
dates  DATE,
sales int)

insert into cumulative4 values
(1,	'2021-09-01',76),
(2,	'2021-09-02',53),
(3,	'2021-09-03',34),
(4	,'2021-10-01',	7),
(5	,'2021-10-02',	12),
(6	,'2021-10-03',	17),
(7	,'2022-01-04',	54),
(8	,'2022-01-05',	33),
(9	,'2022-01-06',	24);

select A.id,A.dates,A.sales,SUM(B.SALES) AS CUMMUL from cumulative4 as A
INNER JOIN	cumulative4 as b on A.dates>=B.dates 
GROUP BY A.id,A.dates,A.sales

select* from cumulative_1