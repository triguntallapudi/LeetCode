# Write your MySQL query statement below
with temp as(
select
    l.book_id,
    l.title,
    l.author,
    l.genre,
    l.publication_year,
    l.total_copies,
    count(b.book_id) as current_borrowers
from library_books l
right join borrowing_records b
on l.book_id=b.book_id
where b.return_date is NULL
group by b.book_id
having count(b.book_id) - l.total_copies=0
order by current_borrowers desc, l.title
)
select 
    book_id,
    title,
    author,
    genre,
    publication_year,
    current_borrowers
    from temp;