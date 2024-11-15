-- PL/SQL EMPLOYEES 테이블에서 요구한 부서별로 사용사 정보(이름,월급)을 CURSOR에 저장하고 부서별 요청시 해당되는 부서 정보를 출력하시오 

SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID = 30;

DECLARE
        VEMPROW_TYPE EMPLOYEES%ROWTYPE;
        VSALARY VARCHAR2(10);
        VNO NUMBER(3);
        --부서별로 정보를 저장할 수 있는 커서생성
        CURSOR C1 (VDEPTNO EMPLOYEES.DEPARTMENT_ID%TYPE)
        IS 
        SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID = VDEPTNO;
BEGIN
        --부서별 정보를 생성시킨다. 랜덤값으로
        VNO := ROUND(DBMS_RANDOM.VALUE(10,110),-1);
        --부서번호 40번호 종료해라.
        IF (VNO = 40) THEN
                DBMS_OUTPUT.PUT_LINE(VNO || '해당되지 않는 부서 번호입니다.');
                RETURN;
        END IF;
        --부서번호 정보를 가져와서 월급에 대해서 평가를 진행한다
        FOR VEMPROW_TYPE IN C1(VNO) LOOP
                IF VEMPROW_TYPE.SALARY BETWEEN 1 AND 1000 THEN
                    VSALARY := '낮음';
                ELSIF VEMPROW_TYPE.SALARY BETWEEN 1000 AND 2000 THEN
                    VSALARY := '중간';
                ELSIF VEMPROW_TYPE.SALARY BETWEEN 2000 AND 3000 THEN
                    VSALARY := '높음';
                ELSE
                    VSALARY := '최고';
                END IF;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE(VEMPROW_TYPE.FIRST_NAME || ' / ' || VEMPROW_TYPE.SALARY || ' / ' || VSALARY);
END;
/
