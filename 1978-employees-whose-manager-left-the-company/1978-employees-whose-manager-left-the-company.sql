# Write your MySQL query statement below
SELECT 
    employee_id
from employees
where salary<30000 and 
manager_id not IN (
    SELECT employee_id
    FROM Employees
)
order by employee_id;