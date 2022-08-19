1. Find out sum rental price of each the room type available in the database

select room_type, sum (price) as Sum from listing_venice_df group by room_type;

2. Analyze the difference between property vacancy rate between the months in the year 2022.

select month(date) as Month, year(date) as Year, count(available) as Count from df_venice_availability
where year(date) = 2022 and available=1
group by month(date),year(date)
order by count(available) desc

3. Find The Cummulative Sum Of Price By Property_Type

SELECT ID,PRICE, property_type, SUM(PRICE) OVER(PARTITION BY PROPERTY_TYPE ORDER BY PRICE) AS CUMM_SUM 
FROM listing_venice_df;

4. Find out top 5 less selling/rented property types available.

select top 5 a.property_type,count(d.available) as number_of_availabilty from
df_venice_availability as d
inner join
listing_venice_df as a
on d.listing_id= a.id
where d.available =0 and year(d.date)=2022
group by a.property_type
order by number_of_availabilty ASC

5. Finding out month in year in which mostlty property type are available and categories them on the basis of minimum availability

select a.property_type,count(d.available) as number_of_availabilty,month(d.date)
as month,avg(a.price) as avg_price from df_venice_availability as d
inner join
listing_venice_df as a
on d.listing_id= a.id
where d.available =1 and month(d.date)=3
group by a.property_type,month(d.date)
order by count(d.available) ASC




6. Try to search if there is any relation between hosts response time and property being rented

select t1.host_response_time , count(t3.available) as not_available
from host_venice_df as t1 inner join listing_venice_df as t2 on t1.host_id =
t2.host_id inner join df_venice_availability as t3 on t2.id =
t3.listing_id
where t3.available = 0 and t1.host_response_time is not null
group by t1.host_response_time

7. categorize property ratings into different types based on the score of ratings into average, good, best. Find total count of properties in each category and find out the average rating of each segment.

select
case
when review_scores_rating < 4.0 then 'average'
when review_scores_rating >= 4.7 then 'premium'
when review_scores_rating >= 4.0 then 'good'
else 'not_rated'
end as rating_category , count(*) as total_property , avg(review_scores_rating)
as avg_rating
from listing_venice_df
group by
case
when review_scores_rating < 4.0 then 'average'
when review_scores_rating >= 4.7 then 'premium'
when review_scores_rating >= 4.0 then 'good'
else 'not_rated'
end
order by total_property desc

8. Find out the average price of properties by their bedroom count along with their neighbourhood area.

select neighbourhood_cleansed , bedrooms , avg(price)AVG_PRICE
from listing_venice_df
group by neighbourhood_cleansed , bedrooms
order by bedrooms

9. Find out no. of property rented as per their area as well as their average price and order them as from higher priced property to lower price properties.

select neighbourhood_cleansed , avg(t1.price) as avg_price , count(available) as
rented_property
from listing_venice_df t1 inner join df_venice_availability t2 on t1.id = t2.listing_id
where available = 0
group by neighbourhood_cleansed
order by rented_property desc

10. Find out top 5 best selling/rented property types available.

select top 5 a.property_type,count(d.available) as number_of_availabilty from
df_venice_availability as d
inner join
listing_venice_df as a
on d.listing_id= a.id
where d.available =0 and year(d.date)=2022
group by a.property_type
order by number_of_availabilty desc

