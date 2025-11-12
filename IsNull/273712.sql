/* 업그레이드 할 수 없는 아이템 구하기 */

-- JOIN --

SELECT ITEM_ID, ITEM_NAME, RARITY
FROM ITEM_INFO II
    LEFT JOIN (SELECT PARENT_ITEM_ID
               FROM ITEM_TREE
               GROUP BY PARENT_ITEM_ID
              ) AS IT
    ON II.ITEM_ID = IT.PARENT_ITEM_ID
WHERE PARENT_ITEM_ID IS NULL
ORDER BY II.ITEM_ID DESC



-- NOT IN --

SELECT ITEM_ID, ITEM_NAME, RARITY
FROM ITEM_INFO
WHERE ITEM_ID NOT IN (SELECT PARENT_ITEM_ID
                      FROM ITEM_TREE
                      WHERE PARENT_ITEM_ID IS NOT NULL
                      GROUP BY PARENT_ITEM_ID)
ORDER BY ITEM_ID DESC

/*
-- NOT IN 주의점 -- 
• NOT IN 연산자는 !=(같지않다)와 같다.
• IN('A', 'B') : A와 B가 포함되는 데이터만 추출
• NOT IN('A', 'B') : A와 B가 포함되지 않는 데이터만 추출

* 주의점 *
• SQL 비교 연산은 NULL과 만나면 항상 UNKNOWN을 반환
• WHERE 절에서 UNKNOWN은 FALSE로 취급되기 때문에
• NOT IN의 인자로 NULL이 존재하면 결과괎은 무조건 FALSE가 됨

• 이는 NOT IN 뿐만 아니라 모든 비교연산에서 NULL이 있을시 주의해야함
*/