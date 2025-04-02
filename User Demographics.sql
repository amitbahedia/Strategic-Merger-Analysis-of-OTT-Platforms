# What is the distribution of users by age group, city tier, and subscription plan for each platform?

# Total Users for Jotstar
SELECT * FROM jotstar_db.subscribers;

select age_group, city_tier, subscription_plan, count(user_id) as total_no_of_users
from jotstar_db.subscribers
group by age_group, city_tier, subscription_plan
order by age_group, total_no_of_users desc;


# Total users for liocinema
SELECT * FROM liocinema_db.subscribers;

select age_group, city_tier, subscription_plan, count(user_id) as total_no_of_users
from liocinema_db.subscribers
group by age_group, city_tier, subscription_plan
order by age_group, total_no_of_users desc;