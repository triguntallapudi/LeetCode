# Write your MySQL query statement below
select
    Department,
    Employee,
    Salary
from (
    select 
        d.name as Department,
        e.name as Employee,
        e.salary as Salary,
        DENSE_RANK() OVER (
            partition by e.departmentid
            order by E.salary desc
        )AS RNK
    from employee e 
    join department d
    on e.departmentid=d.id
) T
WHERE RNK<=3;


