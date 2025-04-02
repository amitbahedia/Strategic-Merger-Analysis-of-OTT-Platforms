 # How do inactivity patterns correlate with total watch time or average watch time? Are less engaged users more likely to become inactive?
 
SELECT * FROM liocinema_db.subscribers;
SELECT s.user_id, sum(c.total_watch_time_mins) as Total_Watch_Time,
    CASE 
        WHEN sum(c.total_watch_time_mins) < 100 THEN 'Low Engagement'
        WHEN sum(c.total_watch_time_mins) BETWEEN 100 AND 500 THEN 'Moderate Engagement'
        ELSE 'High Engagement'
    END AS engagement_level,
    DATEDIFF('2024-11-30', max(s.last_active_date)) as Days_Since_Last_Activity
FROM 
    liocinema_db.subscribers s 
    join liocinema_db.content_consumption c
    on s.user_id = c.user_id
GROUP BY s.user_id




 