# What percentage of LioCinema and Jotstar users are active vs. inactive? How do these rates vary by age group and subscription plan?
# SELECT * FROM liocinema_db.subscribers;
# Query for percentage of LioCinema  active users vary by age group and subscription plan
select age_group,
       subscription_plan,
       count(user_id) as Total_users,
       sum(case when last_active_date is NULL then 1 else 0 end) as Total_Active_users,
       (sum(case when last_active_date is NULL then 1 else 0 end) * 100.0 / count(user_id)) as perc_of_active_users
from liocinema_db.subscribers
group by age_group, subscription_plan
order by age_group;


# # Query for percentage of LioCinema  active users vary by age group and subscription plan
select age_group,
       subscription_plan,
       count(user_id) as Total_users,
       sum(case when last_active_date is NULL then 1 else 0 end) as Total_Active_users,
       (sum(case when last_active_date is NULL then 1 else 0 end) * 100.0 / count(user_id)) as perc_of_active_users
from jotstar_db.subscribers
group by age_group, subscription_plan
order by age_group;


