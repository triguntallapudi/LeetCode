# Write your MySQL query statement below
with cte as(select managerid,count(managerid) as count 
from employee
group by managerid
) 
select e.name from employee e
join cte c 
on e.id=c.managerid
where c.count >=5
