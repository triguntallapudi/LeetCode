# Write your MySQL query statement below
with cte as(
    select
        user_id,
        reaction,
        count(reaction) as counts,
        row_number() over(
            partition by user_id
            order by count(reaction) desc
        ) as rn,
        sum(count(reaction)) over(
            partition by user_id
        ) as tc
    from reactions
    WHERE user_id IN (
        SELECT user_id
        FROM reactions
        GROUP BY user_id
        HAVING COUNT(*) >=5
    )
    group by user_id, reaction

)
select
    user_id,
    reaction as dominant_reaction,
    round(counts/tc,2) AS reaction_ratio
from cte
where rn=1
    and counts / tc >= 0.6
order by
    reaction_ratio desc,
    user_id
