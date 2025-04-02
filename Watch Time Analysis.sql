# What is the average watch time for LioCinema vs. Jotstar during the analysis period? How do these compare by city tier and device type?

SELECT * FROM liocinema_db.content_consumption;
SELECT * FROM jotstar_db.content_consumption;

## average watch time for Jot Star by city tier and device type
select s.city_tier, l.device_type, avg(l.total_watch_time_mins) as Average_Watch_Time
from jotstar_db.content_consumption l 
join jotstar_db.subscribers s 
on l.user_id = s.user_id
group by s.city_tier, l.device_type
order by city_tier;

## average watch time for Leo Cinemas by city tier and device type
select s.city_tier, l.device_type, avg(l.total_watch_time_mins) as Average_Watch_Time
from liocinema_db.content_consumption l 
join liocinema_db.subscribers s 
on l.user_id = s.user_id
group by s.city_tier, l.device_type
order by city_tier

