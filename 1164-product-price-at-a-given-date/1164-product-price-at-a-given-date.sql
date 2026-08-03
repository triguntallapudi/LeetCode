# Write your MySQL query statement below
/*
with cte as(
    SELECT
        product_id,
        max(change_date) as date
    FROM Products
    WHERE change_date < '2019-08-17'
    GROUP BY product_id
)
select
    distinct p.product_id,
    case(
        when c.product_id is null then price 10
        else
    )
from products p
left join cte c
on p.product_id=c.product_id
and p.change_date=c.date
*/
with cte as(
SELECT
    product_id,
    change_date,
    CASE
        WHEN change_date > '2019-08-16' THEN 10
        ELSE new_price
    END AS price,
    ROW_NUMBER() OVER (
    PARTITION BY product_id
    ORDER BY
        CASE
            WHEN change_date > '2019-08-16' THEN '0000-00-00'
            ELSE change_date
        END DESC
) AS rn
FROM Products
)
select product_id, price
from cte 
where rn=1

    