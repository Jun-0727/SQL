/* 가격대 별 상품 개수 구하기 */

SELECT (PRICE / 10000) AS PRICE_GROUP, COUNT(*) AS PRODUCTS
FROM PRODUCT
GROUP BY PRICE_GROUP
ORDER BY PRICE_GROUP

/*
-- 산술연산자 --
• + - * / : 사칙연산
• DIV : 몫 반화(소수점 제외)
• % : 나머지 반환
*/