-- ---------------------------------------------------------------------
-- 함수 연습 문제
-- 1. 직원명과 주민번호를 조회하세요.
-- 단, 주민번호 9번째 자리부터 끝까지는 '*'문자로 채운다.
-- 예 : 홍길동 771120-1******
SELECT
       EMP_NAME
     , RPAD(SUBSTR(EMP_NO, 1, 8), 14, '*')
  FROM EMPLOYEE;

-- 2. 직원명, 직급코드, 연봉(원) 조회하세요.
-- 단, 연봉은 ￦57,000,000 으로 표시되게 한다.
-- 연봉은 보너스 포인트가 적용된 1년치 급여이다.
SELECT
       EMP_NAME
     , JOB_CODE
     , TO_CHAR((SALARY * NVL(BONUS, 1) * 12), 'L99,999,999') 연봉
  FROM EMPLOYEE;
-- 3. 부서코드가 D5, D9인 직원들 중에서 2004년도에 입사한 직원의
-- 사번 사원명 부서코드 입사일 조회하세요.
SELECT
       EMP_ID
     , EMP_NAME
     , DEPT_CODE
     , HIRE_DATE
  FROM EMPLOYEE
 WHERE DEPT_CODE IN('D5', 'D9')
   AND TO_CHAR(HIRE_DATE, 'YYYY') = 2004;
-- 4. 직원명, 부서코드, 생년월일, 나이(만) 조회하세요.
-- 단, 생년월일은 주민번호에서 추출해서, ㅇㅇ년 ㅇㅇ월 ㅇㅇ일로 출력되게 한다.
-- 나이는 주민번호에서 추출해서 날짜데이터로 변환한 다음 계산한다.
-- 4번 주민번호 날짜 데이터화 불가한 사원은 WHERE절 조건으로 제외하고 처리하세용
SELECT
       EMP_NAME
     , DEPT_CODE
     , TO_CHAR(TO_DATE(SUBSTR(EMP_NO, 1, 6), 'RRMMDD'), 'YY"년 " MM"월 " DD"일 "')
     , EMP_NO
  FROM EMPLOYEE;

-- 5. 부서코드가 D5이면 총무부, D6이면 기획부, D9이면 영업부로 처리하세요.
-- 단, 부서코드가 D5, D6, D9 인 직원의 정보만 조회한다.
-- => HINT) CASE
-- 부서코드 기준 오름차순 정렬한다.
SELECT
       DEPT_CODE
     , CASE
         WHEN DEPT_CODE = 'D5' THEN '총무부'
         WHEN DEPT_CODE = 'D6' THEN '기획부'
         WHEN DEPT_CODE = 'D9' THEN '영업부'
       END 부서
  FROM EMPLOYEE
 WHERE DEPT_CODE IN ('D5', 'D6', 'D9')
 ORDER BY DEPT_CODE;
-- 6. 직원들의 입사일로 부터 년도만 가지고, 각 년도별 입사인원수를 구하세요.
-- 아래의 년도에 입사한 인원수를 조회하세요.
-- => HINT) TO_CHAR, DECODE, COUNT
--
--	-------------------------------------------------------------
--	전체직원수   2001년   2002년   2003년   2004년
--	------------------------------------------------------------
SELECT
       COUNT(EMP_ID) "전체직원수"
     , COUNT(DECODE(TO_CHAR(HIRE_DATE, 'YYYY'), '2001', 1)) "2001년"
     , COUNT(DECODE(TO_CHAR(HIRE_DATE, 'YYYY'), '2002', 1)) "2002년"
     , COUNT(DECODE(TO_CHAR(HIRE_DATE, 'YYYY'), '2003', 1)) "2003년"
  FROM EMPLOYEE;
