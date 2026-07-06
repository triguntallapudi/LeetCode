# Write your MySQL query statement below
with temp as(
    select
    user_id, max(tokens) as token,
    count(user_id) as prompt_count,
    round(avg(tokens),2) as avg_tokens
    from prompts
    group by user_id
    having count(user_id)>=3
    )

select
    user_id,
    prompt_count,
    avg_tokens
    from temp
where token>avg_tokens
order by avg_tokens desc;