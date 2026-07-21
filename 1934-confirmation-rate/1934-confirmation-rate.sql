# Write your MySQL query statement below
with cte as(
select
    user_id,
    COUNT(CASE WHEN action = 'confirmed' THEN 1 END) AS confirmed,
    COUNT(*) AS total
from confirmations
group by user_id
)
select 
    s.user_id,
    ifnull(round(c.confirmed/c.total,2),0) as confirmation_rate
from signups s
left join cte c
on s.user_id =c.user_id