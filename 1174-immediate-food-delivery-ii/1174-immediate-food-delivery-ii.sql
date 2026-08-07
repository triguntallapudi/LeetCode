# Write your MySQL query statement below
with cte as(
    select *,
    row_number () over
    (partition by customer_id
    order by order_date
    )as rn 
    from delivery 
),
cte2 as(
    select 
        customer_id,
        min(order_date) as first_order,
        case
        when order_date=customer_pref_delivery_date then "immediate"
        else "scheduled"
        end as status
    from cte
    where rn=1
    group by customer_id
    order by order_date
)
select 
    round(
        ((select
            count(*)
        from cte2
        where status="immediate")/count(*))*100,
        2
    ) as immediate_percentage
from cte2

