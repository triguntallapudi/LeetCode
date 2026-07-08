# Write your MySQL query statement below
with cte as(
    select
        reports_to as employee_id,
        count(reports_to)as reports_count,
        round(avg(age)) as average_age
    from employees
    where reports_to is not null
    group by reports_to
)

select c.employee_id, e.name, c.reports_count, c.average_age  from cte c join employees e
on c.employee_id=e.employee_id
order by employee_id