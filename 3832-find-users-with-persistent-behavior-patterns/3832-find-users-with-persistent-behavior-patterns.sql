# Write your MySQL query statement below
with clean as(
    select *
    from activity
    group by action_date,user_id
    having count(action)=1
),

start as(
    select *,
        case
            when lag(action_date) over(
                partition by user_id, action
                order by user_id,action_date
            )=date_sub(action_date, interval 1 day)
            then 0
            else 1
        end as start
    from clean
),

grp as(
    select *,
        sum(start) over(
            order by user_id, action_date
        ) as grp
    from start
),

high as(
    select *,
        min(action_date) as start_date,
        max(action_date) as end_date,
        count(grp) as streak_length
    from grp
    group by user_id, action

)

select
    user_id,
    action,
    streak_length,
    start_date,
    end_date
from high
where streak_length>=5
order by streak_length desc, user_id
    