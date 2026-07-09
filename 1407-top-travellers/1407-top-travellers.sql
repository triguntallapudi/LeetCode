# Write your MySQL query statement below
with cte as(
    select
    user_id as id, sum(distance) as distance
    from rides
    group by (user_id)
)
select u.name, ifnull(c.distance,0) as travelled_distance from users u left join cte c 
on u.id=c.id
order by travelled_distance desc, name 
