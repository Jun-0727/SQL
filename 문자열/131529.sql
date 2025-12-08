/* 카테고리 별 상품 개수 구하기 */

SELECT 
    LEFT(PRODUCT_CODE, 2) AS CATEGORY, 
    COUNT(*) AS PRODUCTS
FROM PRODUCT
GROUP BY CATEGORY
ORDER BY CATEGORY ASC

/*
-- 문자열 가져오기 --
- LEFT(문자, 가져올 개수)
- MID(문자, 시작 위치, 가져올 개수)
- RIGHT(문자, 가져올 개수)
*/