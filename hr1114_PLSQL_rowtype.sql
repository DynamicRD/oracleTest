DECLARE
        TYPE SALARY_ARR_TYPE IS TABLE OF EMPLOYEES.SALARY%TYPE;
        
        SALARY_ARR SALARY_ARR_TYPE;
        ROW_ARR EMPLOYEES%ROWTYPE;
        
        SALARY_SUM NUMBER(10) := 0;
        SALARY_AVG NUMBER(10) := 0;
        EMPLOYEE_COUNT NUMBER(3) := 0;
BEGIN
        FOR ROW_ARR IN (SELECT * FROM EMPLOYEES) LOOP
                EMPLOYEE_COUNT := EMPLOYEE_COUNT + 1;
                SALARY_SUM := SALARY_SUM + ROW_ARR.SALARY;
        END LOOP;
        SALARY_AVG := SALARY_SUM / EMPLOYEE_COUNT;
        DBMS_OUTPUT.PUT_LINE('총 사원의 수 : ' || EMPLOYEE_COUNT);
        DBMS_OUTPUT.PUT_LINE('급여의 합 : ' || SALARY_SUM);
        DBMS_OUTPUT.PUT_LINE('급여의 평균 : ' || SALARY_AVG);
END;
/
select count(*), sum(salary), round(avg(salary)) from employees;

declare
    sal_avg number(10);
    sal_sum number(10);
    emp_sum number(3);
begin
    select count(*),sum(salary),round(avg(salary)) into emp_sum,sal_sum,sal_avg
    from employees; 
    dbms_output.put_line(emp_sum || ' ' || sal_sum || ' ' || sal_avg);
end;
/
----------------------------------------
SELECT JOB_ID,SALARY,HIRE_DATE,COMMISSION_PCT,DEPARTMENT_NAME,
        E.DEPARTMENT_ID
        FROM EMPLOYEES E INNER JOIN DEPARTMENTS  D 
        ON E.DEPARTMENT_ID = D.DEPARTMENT_ID WHERE FIRST_NAME = 'Clara';
SELECT * FROM DEPARTMENTS WHERE DEPARTMENT_ID = 80;        
        
        
DECLARE
        ROW_ARR EMPLOYEES%ROWTYPE;
        ROW_ARR2 DEPARTMENTS%ROWTYPE;
BEGIN
        SELECT * INTO ROW_ARR
        FROM EMPLOYEES
        WHERE FIRST_NAME = 'Clara';
        
         SELECT * INTO ROW_ARR2
        FROM DEPARTMENTS
        WHERE DEPARTMENT_ID = ROW_ARR.DEPARTMENT_ID;
        
        DBMS_OUTPUT.PUT_LINE('직무 : ' || ROW_ARR.JOB_ID);
        DBMS_OUTPUT.PUT_LINE('급여 : ' || ROW_ARR.SALARY);
        DBMS_OUTPUT.PUT_LINE('입사일자 : ' || ROW_ARR.HIRE_DATE);
        DBMS_OUTPUT.PUT_LINE('커미션 : ' || ROW_ARR.COMMISSION_PCT);
        DBMS_OUTPUT.PUT_LINE('부서명 : ' || ROW_ARR2.DEPARTMENT_NAME);
             
END;
/

