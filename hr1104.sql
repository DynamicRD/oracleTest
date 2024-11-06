-- hr resource 있는 테이블 정보(프로젝트 클래스 종류)
select * from tab;
-- employees 테이블 구조(클래스 구조)
desc employees;
-- employees 속에 들어있는 레코드(객체들)를 보여주세요.
select * from employees; 
-- departments 테이블 객체(레코드 = 인스턴스)를 확인ㄴ
select * from departments;
-- description departments  구조
desc departments;
-- department_id, department_name 보임
select department_id, departments_name from departments;
-- 필드명에 별칭 사용하기
select department_id as "부서번호", department_name as "부서명" from departments;
select department_id as DEPT_NO, department_name as DEPT_NAME from departments;
select department_id as "DEPT_NO", department_name as "DEPT_NAME" from departments;
-- + ||
select '5' + 5 from dual;
select '5' || 5 from dual;
-- 문자열의 기능을 이용해서 필드명을 보여주기
select first_name, job_id from employees;
select first_name || '의 직급은' || job_id || ' 입니다' from employees;
select first_name || '의 직급은' || job_id || ' 입니다' as data from employees;
-- 중복되지 않게 보여주기 distinct
select distinct job_id from employees;
--연봉을 3000 이상 받는 사람 정보
select * from employees where salary >= 3000;
desc employees;
-- 2008년 이후에 입사한 직원 조사
select *  from employees where hire_date >= '2008/01/01';
select *  from employees where  TO_CHAR(hire_date,'YYYY/MM/DD') >= '2008/01/01';
select *  from employees where hire_date >= TO_DATE('2008/01/01','YYYY/MM/DD HH24:MI:SS');
--  AND , BETWEEN a AND b
select * from EMPLOYEES WHERE SALARY >= 2000 AND SALARY <= 3000;
-- OR, IN( , ) 직원번호가 67,101,184인 사원
select * from employees where employee_id = 67 or employee_id = 101 or employee_id = 184;
select * from employees where employee_id IN(67,101,184);
-- NULL 연산,비교,할당 안된다.
SELECT 100 + NULL FROM DUAL;
select * from employees where commission_pct is not null;
select * from employees where commission_pct is  null;
select employee_id, first_name, commission_pct from employees order by commission_pct desc;
 -- ORDER BY ASC, DESC 사번을 기준으로 오름차순으로 정렬
SELECT EMPLOYEE_ID, FIRST_NAME FROM EMPLOYEES ORDER BY EMPLOYEE_ID ASC;
SELECT EMPLOYEE_ID, FIRST_NAME FROM EMPLOYEES ORDER BY EMPLOYEE_ID desc;
-- GROUP BY
SELECT DEPARTMENT_ID, SUM(SALARY) FROM EMPLOYEES
GROUP BY DEPARTMENT_ID HAVING DEPARTMENT_ID = 30;
SELECT * FROM EMPLOYEES;
SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID >=70;
SELECT DEPARTMENT_ID, SALARY FROM EMPLOYEES WHERE DEPARTMENT_ID >=70;
SELECT DEPARTMENT_ID, MAX(SALARY) FROM EMPLOYEES WHERE DEPARTMENT_ID >=70 
GROUP BY DEPARTMENT_ID, SALARY ;
SELECT DEPARTMENT_ID, MAX(SALARY),MIN(SALARY),SUM(SALARY),ROUND(AVG(SALARY),1),
COUNT(SALARY)  FROM EMPLOYEES WHERE DEPARTMENT_ID >=70 
GROUP BY DEPARTMENT_ID HAVING SUM(SALARY)>=30000 ;
-- 문자열 일부만 추출 SUBSTR(대상,시작위치,추출개수)
SELECT SUBSTR('DATABASE',1,3) FROM DUAL;
-- 20번 부서에서 사원들의 입사 연도 가져오기
SELECT EMPLOYEE_ID,FIRST_NAME,SUBSTR(HIRE_DATE,1,2) || '년도' AS  "입사년도" FROM EMPLOYEES WHERE DEPARTMENT_ID = 20;
-- TRIM
SELECT TRIM(LEADING FROM ' ABCD ') LT, LENGTH(TRIM(LEADING FROM '        ABCD ')) 
    LT_LEN, TRIM(TRAILING FROM ' ABCD ') RT, LENGTH(TRIM(TRAILING FROM '        ABCD ')) 
    RT_LEN, TRIM(BOTH FROM '    ABCD ') BOTH1, LENGTH(TRIM(BOTH FROM '    ABCD ')) BOTH1, 
    TRIM('    ABCD    ') BOTHT2, LENGTH(TRIM(' ABCD ')) BOTHLEN2 FROM DUAL;
-- 부서 30번 소속된 직원들 근무달수를 구하기
SELECT  FIRST_NAME,HIRE_DATE AS 입사일,SYSDATE AS 현재날짜,ROUND(MONTHS_BETWEEN(SYSDATE,HIRE_DATE)) AS 근무달수
FROM EMPLOYEES WHERE DEPARTMENT_ID = 30;
-- NEXT_DAY( ) 함수의 기능
SELECT SYSDATE,TO_CHAR(SYSDATE,'YYYY/MM/DD HH24:MI:SS'),NEXT_DAY(SYSDATE,'수요일')FROM DUAL;

-- 03년도에 입사한 사원 알아내기
select hire_date, to_char(hire_date,'YY/MM/DD HH24:MI:SS'),to_char(hire_date,'mi') from employees ;
select to_date('20041214','YYYY/MM/DD')+1 from dual;

--이름이 k로 끝나는 직원을 검색
select first_name from employees where upper(substr(first_name,length(first_name),1))= upper('k');

--현재시간표현
select sysdate from dual;
select to_char(sysdate, 'YYYY/MM/DD HH24:MI:SS') from dual;
select sysdate - to_date('2024/11/05', 'YYYY/MM/DD') from dual;

--숫자를 우리가 원하는 형식으로 출력하기 1234567.23 => $1,234,567.23
select trim(to_char(1234567.23,'L999,999,999.99')) as money from dual;
select first_name,trim(to_char(salary,'L999,999,999,999.99')) as salary from employees;

--문자 + 문자 = 숫자
select to_number('10,000','999,999')+ to_number('20,000'+'999,999') from dual;
select to_number('10,000', '999999') from dual;

--NVL
select first_name,salary,commission_pct,job_id from employees order by job_id;
select first_name,salary,nvl(commission_pct,0) commission_pct,job_id from employees order by job_id;

--NVL2 (대상,널이아닐떄 적용값,널일때 적용값)
select first_name,salary,COMMISSION_PCT,salary+(salary*COMMISSION_PCT) as total from employees;
select first_name,salary,COMMISSION_PCT,salary+(salary*NVL(COMMISSION_PCT,0)) as total from employees;
select first_name,salary,COMMISSION_PCT,salary+(salary*NVL2(COMMISSION_PCT,COMMISSION_PCT,0)) as total from employees;
