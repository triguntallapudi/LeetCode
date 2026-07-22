# Write your MySQL query statement below
select distinct
    num as ConsecutiveNums
from(
    Select
        num,
        lag(num,1) over (order by id) as prev1,
        lag(num,2) over (order by id) as prev2
    from logs
) t
where num=prev1 and prev1=prev2