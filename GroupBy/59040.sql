/* 고양이와 개는 몇 마리 있을까 */

SELECT ANIMAL_TYPE, COUNT(*) as 'count'
FROM ANIMAL_INS
WHERE ANIMAL_TYPE IN('Cat', 'Dog')
GROUP BY ANIMAL_TYPE
ORDER BY
    CASE ANIMAL_TYPE 
        WHEN 'Cat' THEN 1
        When 'Dog' THEN 2
    END


/*
-- ORDER BY 절에서의 조건문 --
• 그동안 CASE WHEN은 SELECT 절에서 조건에 따른 조회용으로 사용했는데

• 원하는 순서로 데이터를 조회하고 싶다면
• ORDER BY 절에서 CASE WHEN을 사용하여 제어해야 한다.
• ORDER BY 
    CASE 컬럼 
        WHEN 조건1 THEN 1
        WHEN 조건2 THEN 2
        ...
        WHEN 조건N THEN N
    END

*/