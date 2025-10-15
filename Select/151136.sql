/* 평균 일일 대여 요금 구하기 */

SELECT ROUND(IFNULL(AVG(DAILY_FEE),0)) AS AVERAGE_FEE
FROM CAR_RENTAL_COMPANY_CAR
WHERE CAR_TYPE = 'SUV'
GROUP BY CAR_TYPE


/*

-- 소수점 반올림 --
• ROUND(값, "표시할 소수점 자리수")

-- NULL 처리 --
• COALESCE(컬럼명1, 컬럼명2, 컬럼명3, "NULL일 경우 대체할 값") 공통
• IFNULL(컬럼명, "NULL일 경우 대체할 값")                   MySQL
• NVL(표현식, "NULL일 경우 대체할 값")                      Oracle
• ISNULL(표현식, "NULL일 경우 대체할 값")                   MS SQL

*/