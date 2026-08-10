# Write your MySQL query statement below
with cte as (
    select
        count(m.user_id) as count,
        u.name
    from movierating m
    left join users u
        on m.user_id=u.user_id
    group by m.user_id
),

cte2 as(
    select
        avg(m.rating) as average,
        ms.title
    from movierating m
    left join movies ms
        on m.movie_id=ms.movie_id
    where month(created_at)=2
        and year(created_at)=2020
    group by m.movie_id
)

select results
from(
    select name as results
    from cte
    order by count desc, name 
    limit 1
) a

union all

select results
from(
    select title as results
    from cte2
    order by average desc, title
    limit 1
) b

    


