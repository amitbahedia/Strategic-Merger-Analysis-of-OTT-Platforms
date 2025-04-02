# What is the total number of contents available on LioCinema vs. Jotstar? How do they differ in terms of language and content type?



SELECT 
    'Liocinema' AS platform, 
    language, 
    content_type, 
    COUNT(DISTINCT content_id) AS total_content
FROM liocinema_db.contents
GROUP BY language, content_type

UNION ALL

SELECT 
    'Jotstar' AS platform, 
    language, 
    content_type, 
    COUNT(DISTINCT content_id) AS total_content
FROM jotstar_db.contents
GROUP BY language, content_type;



