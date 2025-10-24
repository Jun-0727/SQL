/* 오프라인/온라인 판매 데이터 통합하기 */

SELECT DATE_FORMAT(SALES_DATE, "%Y-%m-%d") AS SALES_DATE, PRODUCT_ID, USER_ID, SALES_AMOUNT
FROM ONLINE_SALE 
WHERE SALES_DATE BETWEEN '2022-03-01' AND '2022-03-31'

UNION ALL

SELECT DATE_FORMAT(SALES_DATE, "%Y-%m-%d"), PRODUCT_ID, NULL AS USER_ID, SALES_AMOUNT
FROM OFFLINE_SALE
WHERE SALES_DATE BETWEEN '2022-03-01' AND '2022-03-31'

ORDER BY SALES_DATE ASC, PRODUCT_ID ASC, USER_ID ASC

/*
-- UNION --
• 쿼리의 결과를 합치는 명령어
• 컬럼의 개수, 타입, 순서가 모두 같아야 한다.
• 매칭되는 컬럼의 이름이 다르다면 상위 쿼리의 컬럼명을 따라간다.
• 매칭되는 컬럼의 이름이 다르다면 alias로 이름을 같게 해주자(헷갈리니까!)

-- UNION vs UNION ALL --
• UNION(=UNION DISTINCT) : 중복 제거
• UNION ALL : 중복 허용
*/