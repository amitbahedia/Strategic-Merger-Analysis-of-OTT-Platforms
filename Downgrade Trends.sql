 # How do downgrade trends differ between LioCinema and Jotstar? Are downgrades more prevalent on one platform compared to the other?
 
 SELECT * FROM jotstar_db.subscribers;
 
  select 
 'Liocinema' AS platform,
 count(user_id) as Subs_downgrades
 from liocinema_db.subscribers
 where status = 'Downgrade'
 
 Union ALL 
 
  select 
 'Jotstar' AS platform,
 count(user_id) as Subs_downgrades
 from jotstar_db.subscribers 
 where status = 'Downgrade'
 
 
 