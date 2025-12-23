/* 자동차 대여 기록 별 대여 금액 구하기 */

WITH TRUCK_RENTAL_HISTORY AS(
    SELECT 
        C.CAR_ID, C.CAR_TYPE, C.DAILY_FEE, 
        H.HISTORY_ID, H.START_DATE, H.END_DATE, 
        DATEDIFF(H.END_DATE, H.START_DATE) + 1 AS RENT_DAYS
    FROM CAR_RENTAL_COMPANY_CAR C
        JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY H
        ON C.CAR_ID = H.CAR_ID
    WHERE C.CAR_TYPE = '트럭'
),
TRUCK_DISCOUNT_PLAN AS(
    SELECT 
        PLAN_ID, 
        CAR_TYPE, 
        CAST(REPLACE(DURATION_TYPE, '일 이상', '') AS UNSIGNED) AS DISCOUNT_MIN_DAYS, 
        DISCOUNT_RATE
    FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN
    WHERE CAR_TYPE = '트럭'
)


SELECT
    H.HISTORY_ID,
    H.DAILY_FEE * H.RENT_DAYS * (100 - IFNULL(P.DISCOUNT_RATE, 0)) DIV 100 AS FEE
FROM TRUCK_RENTAL_HISTORY H
    LEFT JOIN TRUCK_DISCOUNT_PLAN P
    ON P.DISCOUNT_MIN_DAYS =
        CASE
            WHEN H.RENT_DAYS >= 90 THEN 90
            WHEN H.RENT_DAYS >= 30 THEN 30
            WHEN H.RENT_DAYS >= 7 THEN 7
            ELSE NULL
        END
ORDER BY FEE DESC, HISTORY_ID DESC

/*
-- 범위 JOIN --
SELECT *
FROM A
    JOIN B
      ON A.DAYS = B.CASE
                        WHEN H.RENT_DAYS >= 90 THEN 90
                        WHEN H.RENT_DAYS >= 30 THEN 30
                        WHEN H.RENT_DAYS >= 7 THEN 7                        
                        ELSE NULL
                    END
- WHERE ~

설명: 
A와 B를 JOIN 할건데
JOIN 조건은 <A.DAYS & B.RENT_DAYS>
근데 "=" 비교가 아니라 범위 비교야 (1~10이면 A.DAYS = 1 / 11~20이면 A.DAYS = 2 / 21~30이면 A.DAYS = 3)
그래서 CASE/END 절을 통해서 그 범위를 나눠주고
JOIN 조건에서 비교할 기준값을 설정하는 것


-- NULL 처리 --
IFNULL(컬럼, 대체값)
COALESCE(컬럼, 대체값1, 대체값2, ...)


-- REPLACE --
REPLACE(문자열, 교체 대상 문자열, 교체할 문자열)

*/