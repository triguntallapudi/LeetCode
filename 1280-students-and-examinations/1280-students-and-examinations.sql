# Write your MySQL query statement below
select
    s.student_id,
    s.student_name,
    u.subject_name,
    ifnull(count(e.subject_name),0) as attended_exams

from students s cross join subjects u

left join examinations e
    on s.student_id=e.student_id
    and u.subject_name=e.subject_name

group by
    s.student_name,
    s.student_id,
    u.subject_name
order by
    s.student_id,
    u.subject_name;