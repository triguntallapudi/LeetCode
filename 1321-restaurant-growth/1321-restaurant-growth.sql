# Write your MySQL query statement below
with cte as(
    select 
        visited_on,
        sum(amount) as total 
    from customer
    group by visited_on
),
cte2 as(
    SELECT
        VISITED_ON,
        SUM(total) OVER(
            ORDER BY VISITED_ON
            rows between 6 preceding and current row
        ) AS AMOUNT,
        ROUND(
            AVG(total) OVER(
                ORDER BY VISITED_ON
                rows between 6 preceding and current row
            ),2
        ) AS AVERAGE_AMOUNT
    FROM Cte
)
select
    visited_on,
    amount,
    average_amount
from cte2
where visited_on >=(
    select date_add(min(visited_on), interval 6 day)
    from customer
)