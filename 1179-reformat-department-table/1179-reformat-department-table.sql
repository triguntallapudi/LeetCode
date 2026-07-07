# Write your MySQL query statement below
select
    id,
    SUM(CASE WHEN MONTH='Jan' THEN REVENUE END) as Jan_Revenue,
    SUM(CASE WHEN MONTH='Feb' THEN REVENUE END) as Feb_Revenue,
    SUM(CASE WHEN MONTH='Mar' THEN REVENUE END) as Mar_Revenue,
    SUM(CASE WHEN MONTH='Apr' THEN REVENUE END) as Apr_Revenue,
    SUM(CASE WHEN MONTH='May' THEN REVENUE END) as May_Revenue,
    SUM(CASE WHEN MONTH='Jun' THEN REVENUE END) as Jun_Revenue,
    SUM(CASE WHEN MONTH='Jul' THEN REVENUE END) as Jul_Revenue,
    SUM(CASE WHEN MONTH='Aug' THEN REVENUE END) as Aug_Revenue,
    SUM(CASE WHEN MONTH='Sep' THEN REVENUE END) as Sep_Revenue,
    SUM(CASE WHEN MONTH='Oct' THEN REVENUE END) as Oct_Revenue,
    SUM(CASE WHEN MONTH='Nov' THEN REVENUE END) as Nov_Revenue,
    SUM(CASE WHEN MONTH='Dec' THEN REVENUE END) as Dec_Revenue
from Department
group by id;