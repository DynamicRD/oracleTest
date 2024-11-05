--Oracle XE 21c 교안(2. 기본 SELECT문)
SELECT DISTINCT DEPARTMENT_ID FROM EMPLOYEES;
SELECT * FROM EMPLOYEES WHERE employee_id = 110;
SELECT employee_id,first_name,salary FROM EMPLOYEES WHERE salary < 5000;
SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,JOB_ID FROM EMPLOYEES WHERE FIRST_NAME = 'John';
SELECT * FROM EMPLOYEES WHERE SALARY >= 5000 AND SALARY<=10000;
SELECT * FROM EMPLOYEES WHERE employee_id = 134 OR employee_id = 201 OR employee_id = 107;
SELECT * FROM EMPLOYEES WHERE JOB_ID != 'FI_MGR';
SELECT EMPLOYEE_ID,FIRST_NAME,SALARY FROM EMPLOYEES WHERE SALARY >= 2500 AND SALARY <= 4500;
SELECT EMPLOYEE_ID,FIRST_NAME,SALARY FROM EMPLOYEES WHERE SALARY BETWEEN 2500 AND 4500;
SELECT EMPLOYEE_ID,FIRST_NAME,SALARY,commission_pct FROM EMPLOYEES WHERE commission_pct = 0.3 OR commission_pct = 0.05 OR commission_pct = 0.1;
SELECT EMPLOYEE_ID,FIRST_NAME,SALARY,commission_pct FROM EMPLOYEES WHERE commission_pct IN(0.3,0.05,0.1);
SELECT EMPLOYEE_ID,FIRST_NAME FROM EMPLOYEES WHERE FIRST_NAME NOT LIKE '%a%' ;
SELECT FIRST_NAME,LAST_NAME,JOB_ID,EMPLOYEE_ID FROM EMPLOYEES WHERE MANAGER_ID IS NULL;
SELECT EMPLOYEE_ID,FIRST_NAME,SALARY FROM EMPLOYEES ORDER BY SALARY DESC;
SELECT EMPLOYEE_ID,FIRST_NAME,HIRE_DATE FROM EMPLOYEES ORDER BY HIRE_DATE DESC;
--Oracle XE 18c 교안(3. SELECT문 함수)
SELECT FIRST_NAME,SALARY,COMMISSION_PCT FROM EMPLOYEES WHERE LOWER(EMAIL) = 'jking';
SELECT EMPLOYEE_ID,FIRST_NAME,SALARY FROM EMPLOYEES WHERE LENGTH(FIRST_NAME) >= 6;
SELECT * FROM EMPLOYEES WHERE SUBSTR(HIRE_DATE,1,2)  = '03';
SELECT * FROM EMPLOYEES WHERE FIRST_NAME LIKE '%k';
SELECT EMPLOYEE_ID,FIRST_NAME,JOB_ID FROM EMPLOYEES WHERE MOD(EMPLOYEE_ID,2) = 0;
