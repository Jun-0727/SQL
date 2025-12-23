/* 언어별 개발자 분류하기 */

SELECT
    CASE
        WHEN CATEGORY LIKE '%Front End%' AND SKILLS LIKE ('%Python%') THEN 'A'
        WHEN SKILLS LIKE ('%C#%') THEN 'B'
        WHEN CATEGORY LIKE '%Front End%' THEN 'C'
        ELSE NULL
    END AS GRADE, 
    ID, EMAIL
FROM (
    SELECT 
        ID, EMAIL, 
        GROUP_CONCAT(S.NAME) AS SKILLS, 
        GROUP_CONCAT(DISTINCT S.CATEGORY) AS CATEGORY
    FROM SKILLCODES S
        JOIN DEVELOPERS D
        ON S.CODE & D.SKILL_CODE
    GROUP BY D.ID, D.EMAIL
    ) DS
GROUP BY DS.ID, DS.EMAIL HAVING GRADE IS NOT NULL
ORDER BY GRADE, ID


/*
-- GROUP BY --
• 집계함수를 사용할 시
• 집계함수에 포함되지 않는 컬럼을 조회(select)하려면
• 그 값은 'UNIQUE' 이어야 한다.

• 위 문제의 경우
• ID로만 그룹핑을 시도했는데 에러가 발생함.
• WHY?
• ID로 묶었을 때 EMAIL이 같을지 다를지 모르기 때문

결론: 
• 집계 함수가 아닌 일반 컬럼을 SELECT 절에 포함하려면,
• 그 컬럼은 GROUP BY에 포함되거나,
• GROUP BY 컬럼에 함수적으로 종속(unique) 되어야 한다.


-- GROUP_CONCAT --
• GROUP BY 절과 함께 사용되어
• 그룹화된 여러 행의 값을 하나의 문자열로 결합

*/