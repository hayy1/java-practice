-- 1. 춘 기술대학교의 학과 이름과 계열을 표시하시오. 단, 출력 헤더는 "학과 명", "계열"
--    으로 표시하도록 한다. 
SELECT 
       DEPARTMENT_NAME 학과명  
     , CATEGORY 계열 
  FROM TB_DEPARTMENT;

-- 2. 학과의 학과 정원을 다음과 같은 형태로 화면에 출력한다.
SELECT 
	  DEPARTMENT_NAME || '의 정원은 ' || CAPACITY || '명 입니다.' AS "학과별 정원"
  FROM TB_DEPARTMENT;
 
-- 3. "국어국문학과" 에 다니는 여학생 중 현재 휴학중인 여학생을 찾아달라는 요청이
--    들어왔다. 누구인가? (국문학과의 '학과코드'는 학과 테이블(TB_DEPARTMENT)을 조회해서
--    찾아 내도록 하자)
SELECT 
       STUDENT_NAME
  FROM TB_STUDENT ts
  JOIN TB_DEPARTMENT td ON(ts.DEPARTMENT_NO = td.DEPARTMENT_NO)
 WHERE DEPARTMENT_NAME = '국어국문학과'
   AND SUBSTR(STUDENT_SSN, 8, 1) = 2
   AND ABSENCE_YN = 'Y';
   
-- 4. 도서관에서 대출 도서 장기 연체자 들을 찾아 이름을 게시하고자 한다. 그 대상자들의
--    학번이 다음과 같을 때 대상자들을 찾는 적절한 SQL 구문을 작성하시오.
SELECT 
       STUDENT_NAME
  FROM TB_STUDENT
 WHERE STUDENT_NO IN('A513079', 'A513090', 'A513091', 'A513110', 'A513119');
 
-- 5. 입학정원이 20 명 이상 30 명 이하인 학과들의 학과 이름과 계열을 출력하시오.
SELECT 
       DEPARTMENT_NAME
     , CATEGORY
  FROM TB_DEPARTMENT
 WHERE CAPACITY BETWEEN 20 AND 30;

-- 6. 춘 기술대학교는 총장을 제외하고 모든 교수들이 소속 학과를 가지고 있다. 그럼 춘
--    기술대학교 총장의 이름을 알아낼 수 있는 SQL 문장을 작성하시오.
SELECT 
       PROFESSOR_NAME
  FROM TB_PROFESSOR
 WHERE DEPARTMENT_NO IS NULL;

-- 7. 혹시 젂산상의 착오로 학과가 지정되어 있지 않은 학생이 있는지 확인하고자 핚다.
--    어떠핚 SQL 문장을 사용하면 될 것인지 작성하시오.
SELECT 
       STUDENT_NAME
  FROM TB_STUDENT
 WHERE DEPARTMENT_NO IS NULL;

-- 8. 수강신청을 하려고 핚다. 선수과목 여부를 확인해야 하는데, 선수과목이 존재하는
--    과목들은 어떤 과목인지 과목번호를 조회해보시오.
SELECT 
       CLASS_NO
  FROM TB_CLASS
 WHERE PREATTENDING_CLASS_NO IS NOT NULL;

-- 9. 춘 대학에는 어떤 계열(CATEGORY)들이 있는지 조회해보시오.
SELECT 
       DISTINCT CATEGORY
  FROM TB_DEPARTMENT;
 
-- 10. 02 학번 젂주 거주자들의 모임을 맊들려고 핚다. 휴학핚 사람들은 제외핚 재학중인
--     학생들의 학번, 이름, 주민번호를 출력하는 구문을 작성하시오.
SELECT 
       STUDENT_NO
     , STUDENT_NAME
     , STUDENT_SSN
  FROM TB_STUDENT
 WHERE EXTRACT(YEAR FROM ENTRANCE_DATE) = '2002'
   AND STUDENT_ADDRESS LIKE '%전주%'
   AND ABSENCE_YN = 'N';
  
-- [ADDITIONAL SELECT = 함수]
-- 1. 영어영문학과(학과코드 002) 학생들의 학번과 이름, 입학 년도를 입학 년도가 빠른
--    순으로 표시하는 SQL 문장을 작성하시오.( 단, 헤더는 "학번", "이름", "입학년도" 가
--    표시되도록 핚다.)
SELECT 
       STUDENT_NO 학번 
     , STUDENT_NAME 이름 
     , ENTRANCE_DATE 입학년도 
  FROM TB_STUDENT
 WHERE DEPARTMENT_NO = '002'
 ORDER BY ENTRANCE_DATE;

-- 2. 춘 기술대학교의 교수 중 이름이 세 글자가 아닌 교수가 핚 명 있다고 핚다. 그 교수의
--    이름과 주민번호를 화면에 출력하는 SQL 문장을 작성해 보자. (* 이때 올바르게 작성핚 SQL
--    문장의 결과 값이 예상과 다르게 나올 수 있다. 원인이 무엇일지 생각해볼 것)
SELECT 
       PROFESSOR_NAME 이름 
     , PROFESSOR_SSN 주민번호 
  FROM TB_PROFESSOR
 WHERE NOT PROFESSOR_NAME LIKE '___';

-- 3.  춘 기술대학교의 남자 교수들의 이름과 나이를 출력하는 SQL 문장을 작성하시오. 단
--     이때 나이가 적은 사람에서 맋은 사람 순서로 화면에 출력되도록 맊드시오. (단, 교수 중
--     2000 년 이후 출생자는 없으며 출력 헤더는 "교수이름", "나이"로 핚다. 나이는 ‘맊’으로
--     계산핚다.)
SELECT 
       PROFESSOR_NAME AS 이
     , EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM (TO_DATE(SUBSTR(PROFESSOR_SSN, 1, 6), 'YYMMDD'))) + 1 AS 나 
  FROM TB_PROFESSOR
 ORDER BY 2;
     







