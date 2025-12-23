/* 대장균의 크기에 따라 분류하기 2 */

SELECT E.ID, CASE
                WHEN E.PER <= 0.25 THEN 'CRITICAL'
                WHEN E.PER <= 0.5 THEN 'HIGH'
                WHEN E.PER <= 0.75 THEN 'MEDIUM'
                ELSE 'LOW'
             END AS COLONY_NAME
FROM (SELECT ID, PERCENT_RANK() OVER (ORDER BY SIZE_OF_COLONY DESC) AS PER
      FROM ECOLI_DATA
      ) E
ORDER BY E.ID ASC

/*
SELECT ID, CASE NTILE(4) OVER (ORDER BY SIZE_OF_COLONY DESC)
                WHEN 1 THEN 'CRITICAL'
                WHEN 2 THEN 'HIGH'
                WHEN 3 THEN 'MEDIUM'
                WHEN 4 THEN 'LOW'
            END AS COLONY_NAME
FROM ECOLI_DATA
ORDER BY ID;
*/

/*
### 윈도우함수 - 비율함수 ###
• PERCENT_RANK()
• NTILE(n)
• 문법
    FUNCTION() OVER(
        PARTITION BY 부서
        ORDER BY 연봉 ASC/DESC
    )
*/