/* 연간 평가점수에 해당하는 평가 등급 및 성과금 조회하기 */

WITH GRADES AS (
    SELECT E.EMP_NO, E.EMP_NAME, E.SAL,
        CASE
            WHEN SCORE >= 96 THEN 'S'
            WHEN SCORE >= 90 THEN 'A'
            WHEN SCORE >= 80 THEN 'B'
            ELSE 'C'
        END AS GRADE
    FROM HR_EMPLOYEES E 
        JOIN (
            SELECT EMP_NO, AVG(SCORE) AS SCORE
            FROM HR_GRADE
            GROUP BY EMP_NO
        ) G
        ON E.EMP_NO = G.EMP_NO
)

SELECT EMP_NO, EMP_NAME, GRADE, 
    CASE 
        WHEN GRADE = 'S' THEN SAL*0.2
        WHEN GRADE = 'A' THEN SAL*0.15
        WHEN GRADE = 'B' THEN SAL*0.1
        ELSE 0
    END AS BONUS
FROM GRADES
ORDER BY E.EMP_NO ASC
