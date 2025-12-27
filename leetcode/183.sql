/* Customers Who Never Order */

WITH T AS(
    SELECT  C.id, C.name, O.customerId
    FROM Customers C
        LEFT JOIN Orders O
        ON C.id = O.customerId
)

SELECT name AS Customers
FROM T
WHERE customerId IS NULL