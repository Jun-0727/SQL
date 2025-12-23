/* 조건에 맞는 사용자 정보 조회하기 */

SELECT 
    USER_ID, 
    NICKNAME, 
    CONCAT_WS(' ', CITY, STREET_ADDRESS1, STREET_ADDRESS2) AS 전체주소,
    CONCAT_WS('-', SUBSTRING(TLNO, 1, 3), SUBSTRING(TLNO, 4, 4), SUBSTRING(TLNO, 8, 4)) AS 전화번호
FROM USED_GOODS_USER
WHERE USER_ID IN (
    SELECT WRITER_ID
    FROM USED_GOODS_BOARD
    GROUP BY WRITER_ID HAVING COUNT(*) >= 3
)
ORDER BY USER_ID DESC

/*
-- CONCAT_WS --
- 정의 : 사용자가 지정한 것을 구분자로 구분 한 뒤 결합
- 예제 : CONCAT_WS('@','test', 'naver.com') >> test@naver.com
- 특징 : NULL값 무시


-- SUBSTRING() --
- SUBSTRING(문자열, s), SUBSTRING(문자열, s, len) 
- s: 시작 위치 / len: 가져올 길이


*/