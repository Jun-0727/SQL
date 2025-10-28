/* 물고기 종류 별 대어 찾기 */

SELECT ID, FISH_NAME, LENGTH
FROM FISH_NAME_INFO FN 
JOIN (
    SELECT ID, FISH_TYPE, LENGTH, RANK() OVER(PARTITION BY FISH_TYPE ORDER BY LENGTH DESC) AS RNK
    FROM FISH_INFO) FI 
ON FN.FISH_TYPE = FI.FISH_TYPE
WHERE RNK = 1
ORDER BY ID ASC

/*
-- CTE --
• Common Table Expression
• 하나의 쿼리문 범위 내에서만 존재하며, 여러 번 참조될 수 있는 이름이 지정된 일회성 테이블
*/