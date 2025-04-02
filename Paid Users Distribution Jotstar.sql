# Proportion of premium users in Tier 1, Tier 2, and Tier 3 cities 

with No_of_Users as
(
select city_tier, count(distinct user_id) as Total_Users, 

count(distinct case 
		when User_Type in ('Paid') Then user_id
        end) as Total_Paid_Users
from jotstar_db.subscribers
group by city_tier


)
select city_tier, Total_Users, Total_Paid_Users,
round((Total_Paid_Users*100/Total_Users),2) as Paid_Users_Perc
from No_of_Users;

# Paid Users as per Current_Subcsription Plan 

WITH UserCounts AS (
    -- Calculate overall total users (not grouped by subscription plan)
    SELECT 
        COUNT(DISTINCT user_id) AS Overall_Total_Users
    FROM jotstar_db.subscribers
),
PlanWiseCounts AS (
    -- Calculate total paid users per current subscription plan
    SELECT 
        current_subscription_plan, 
        COUNT(DISTINCT CASE WHEN User_Type = 'Paid' THEN user_id END) AS Total_Paid_Users_Per_Plan
    FROM jotstar_db.subscribers
    GROUP BY current_subscription_plan
)
SELECT 
    p.current_subscription_plan, 
    p.Total_Paid_Users_Per_Plan AS Total_Paid_Users,
    ROUND((p.Total_Paid_Users_Per_Plan * 100.0 / NULLIF(u.Overall_Total_Users, 0)), 2) AS Paid_Users_Perc_Overall -- Paid % of overall users
FROM PlanWiseCounts p
JOIN UserCounts u ON 1=1;