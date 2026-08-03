# Write your MySQL query statement below
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

    