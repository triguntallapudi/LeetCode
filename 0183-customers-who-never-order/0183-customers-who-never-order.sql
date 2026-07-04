# Write your MySQL query statement below
SELECT E.NAME as Customers FROM CUSTOMERS E LEFT JOIN ORDERS O ON E.ID=O.Customerid WHERE CUSTOMERID IS NULL;