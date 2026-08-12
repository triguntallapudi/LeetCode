# Write your MySQL query statement below
with cte as(
    select user_id
    from useractivity 
    group by user_id
    having count(case when activity_type='free_trial' then 1 end)>0
    and count(case when activity_type='paid' then 1 end)>0
)

Select 
    u.user_id,
    round(
        avg(
            case
                when activity_type='free_trial'
                then activity_duration
            end
        ),
    2) as trial_avg_duration,
    round(
        avg(
            case
                when activity_type='paid'
                then activity_duration
            end
        ),
    2) as paid_avg_duration
from useractivity u 
join cte c 
on u.user_id = c.user_id
group by user_id
order by user_id