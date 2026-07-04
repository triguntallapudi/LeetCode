# Write your MySQL query statement below
SELECT w1.id
FROM Weather w1
JOIN Weather w2
ON DATEDIFF(W1.RECORDDATE,W2.RECORDDATE)=1
WHERE w1.temperature > w2.temperature;