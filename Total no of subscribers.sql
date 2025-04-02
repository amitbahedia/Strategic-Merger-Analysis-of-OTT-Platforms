# Total Users & Growth Trends
# What is the total number of users for LioCinema and Jotstar, and how do they compare in terms of growth trends (January–November 2024)?

# total users in LioCinema
select count(distinct user_id) as total_users_in_LioCinema from liocinema_db.subscribers;

# Monthly users Grwoth in Lio Cinema
select date_format(subscription_date, '%b %Y') as Month, 
count(distinct user_id) as Monthly_Users
from liocinema_db.subscribers
where subscription_date between '2024-01-01' AND '2024-11-30'
group by date_format(subscription_date, '%b %Y')
order by Month;


# total users in Jotstar
select count(distinct user_id) as total_users_in_Jotstar from jotstar_db.subscribers;

# Monthly users Grwoth in Jot Star
select date_format(subscription_date, '%Y-%m') as Month, 
count(distinct user_id) as Monthly_Users
from jotstar_db.subscribers
where subscription_date between '2024-01-01' AND '2024-11-30'
group by date_format(subscription_date, '%Y-%m')
order by Month;