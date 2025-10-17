/* 조건에 맞는 개발자 찾기 */

SELECT ID, EMAIL, FIRST_NAME, LAST_NAME
FROM DEVELOPERS D JOIN SKILLCODES S ON D.SKILL_CODE & S.CODE = S.CODE
WHERE NAME IN ('Python', 'C#')
GROUP BY ID, EMAIL, FIRST_NAME, LAST_NAME
ORDER BY ID ASC


/*

-- 비트 연산 -- 
• &(AND)    : '100' & '111' ->  '100'
• |(OR)     : '100' & '111' ->  '111'
• ^(XOR)    : '100' & '111' ->  '011'
• ~(NOT)    : ~'100'        ->  '011'
• <<(Shift) : '100' << 1    ->  ;
• >>(Shift) : '100' >> 2    -> 

-- 타입 변환 --
• CAST(값 AS 타입)  : 인수로 전달받은 값을 명시된 타입으로 변환
• CONVERT(값, 타입) : 인수로 전달받은 값을 명시된 타입으로 변환
*/