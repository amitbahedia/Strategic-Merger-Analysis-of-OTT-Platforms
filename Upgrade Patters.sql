# What are the most common upgrade transitions (e.g., Free to Basic, Free to VIP, Free to Premium) for LioCinema and Jotstar? How do these differ across platforms?

SELECT * FROM jotstar_db.subscribers;

SELECT 
    'Liocinema' AS platform,
    COUNT(user_id) AS Subs_Upgrades, 
    SUM(CASE 
            WHEN subscription_plan = 'Free' AND new_subscription_plan = 'Basic' 
            THEN 1 ELSE 0 
        END) AS No_of_people_Free_To_Basic,
    SUM(CASE 
            WHEN subscription_plan = 'Free' AND new_subscription_plan = 'Premium' 
            THEN 1 ELSE 0 
        END) AS No_of_people_Free_To_Premium,
    SUM(CASE 
            WHEN subscription_plan = 'Basic' AND new_subscription_plan = 'Premium' 
            THEN 1 ELSE 0 
        END) AS No_of_people_Basic_To_Premium
FROM liocinema_db.subscribers
WHERE status = 'Upgrade';

# JotStar

SELECT 
    'Jotstar' AS platform,
    COUNT(user_id) AS Subs_Upgrades, 
    SUM(CASE 
            WHEN subscription_plan = 'Free' AND new_subscription_plan = 'VIP' 
            THEN 1 ELSE 0 
        END) AS No_of_people_Free_To_VIP,
    SUM(CASE 
            WHEN subscription_plan = 'Free' AND new_subscription_plan = 'Premium' 
            THEN 1 ELSE 0 
        END) AS No_of_people_Free_To_Premium,
    SUM(CASE 
            WHEN subscription_plan = 'Premium' AND new_subscription_plan = 'VIP' 
            THEN 1 ELSE 0 
        END) AS No_of_people_Premium_To_VIP
FROM jotstar_db.subscribers
WHERE status = 'Upgrade';


