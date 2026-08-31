# Write your MySQL query statement below
with cte1 as(
    select
        s.product_id,
        case
            when month(s.sale_date) in (12,1,2) then "Winter"
            when month(s.sale_date) in (3,4,5) then "Spring"
            when month(s.sale_date) in (6,7,8) then "Summer"
            when month(s.sale_date) in (9,10,11) then "Fall"
        end as season,
        s.price*s.quantity as total,
        s.quantity,
        p.category
    from sales s
    left join products p 
    on s.product_id=p.product_id
    order by s.product_id
),
cte2 as(
    select
        season,
        category,
        sum(quantity) as total_quantity,
        sum(total) as total_revenue,
        row_number() over(
        partition by season
        order by
            sum(quantity) desc,
            sum(total) desc,
            category
    ) as rn
    FROM cte1
    group by category, season
)

select
    season,
    category,
    total_quantity,
    total_revenue
from cte2
where rn=1
