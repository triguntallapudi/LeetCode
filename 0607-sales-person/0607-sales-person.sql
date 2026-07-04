# Write your MySQL query statement below
select name from (
select s.name as name , c.name as cname from salesperson s
left join orders o on s.sales_id=o.sales_id
left join company c on c.com_id=o.com_id
group by s.name 
having sum(c.name='RED')=0 or c.name is null
) t

