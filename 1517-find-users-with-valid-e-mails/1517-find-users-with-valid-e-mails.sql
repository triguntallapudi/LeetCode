# Write your MySQL query statement b    
select * from users 
where regexp_like (mail,
    '^[a-zA-Z][a-zA-Z0-9_.-]*@leetcode\\.com$', 'c'
)