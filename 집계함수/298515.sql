/* 잡은 물고기 중 가장 큰 물고기의 길이 구하기 */

SELECT CONCAT(MAX(LENGTH), 'cm') AS MAX_LENGTH
FROM FISH_INFO


/*
-- CONCAT --
• 문자 연결하기
• 사용법 : CONCAT('1', '2', '3') >> 123

-- GROUP_CONCAT -- 
• 서로 다른 row에 있는 값 연결하기
• 사용법 :
    SELECT GROUP_CONCAT(NAME)
    FROM FRUITS
    GROUP BY TYPE
*/