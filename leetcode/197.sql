/* Rising Temperature */

WITH T AS(
    SELECT 
        W1.id, 
        W1.recordDate, 
        W1.temperature, 
        W2.temperature AS yesterday_temperature
    FROM Weather W1
        LEFT JOIN Weather W2
        ON W1.recordDate = DATE_ADD(W2.recordDate, INTERVAL 1 DAY)
)

SELECT id
FROM T
WHERE temperature > yesterday_temperature