# Write your MySQL query statement below
select
    user_id,
    prompt_count,
    avg_tokens
    from(
select
    user_id, max(tokens) as token,
    count(user_id) as prompt_count,
    round(avg(tokens),2) as avg_tokens
    from prompts
    group by user_id
    having count(user_id)>=3
    )t
where token>avg_tokens
order by avg_tokens desc;