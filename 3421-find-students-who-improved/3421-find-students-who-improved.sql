# Write your MySQL query statement below
with cte as(
    select
        s1.student_id,
        s1.subject,
        s1.score as first_score,
        s2.score as latest_score
    from scores s1 join scores s2
    on  s1.student_id = s2.student_id 
    and s1.subject = s2.subject
    where s1.exam_date=(
        select min(exam_date)
        from scores s3 
        where s3.student_id = s1.student_id
        and s3.subject = s1.subject
    )
    and s2.exam_date=(
        select max(exam_date)
        from scores s3 
        where s3.student_id = s2.student_id
        and s3.subject = s2.subject
    )
)

select * 
from cte 
where latest_score > first_score
order by student_id, subject