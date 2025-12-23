/* 잡은 물고기의 평균 길이 구하기 */

SELECT ROUND(AVG(COALESCE(LENGTH, 10)), 2) AS AVERAGE_LENGTH
FROM FISH_INFO


/*
-- COALESCE --
• NULL 값 처리 함수
• 사용법
  - SELECT COALESCE(컬럼1, 컬럼2, 100)
  - FROM table
• 설명
  - 컬럼1이 NULL이 아니면 컬럼1 반환 / NULL 이면 컬럼2 반환
  - 컬럼2가 null이 아니면 컬럼2 반환 / null 이면 100 반환


-- IFNULL과의 차이 --
• NULL 값 처리 함수
• IFNULL : 인자 2개 / COALESCE : 인자 여러개
• IFNULL : MySQL  / COALESCE : 표준 SQL 함수
*/