--PL/SQL
--내용을 EMPLOYEE 이름,사원번호를 가져와서 출력하자

DECLARE 
        NUM NUMBER(10) := 24 * 50 * 60;
        PHONE_NUM VARCHAR2(13);
        NAME VARCHAR2(13);
BEGIN
        PHONE_NUM := '010-2222-3333';
        NAME := 'KIM DONG WOOK';
        DBMS_OUTPUT.PUT_LINE('HELLO WORLD ORACLE');
        DBMS_OUTPUT.PUT_LINE('NUM='||NUM);
        DBMS_OUTPUT.PUT_LINE('NAME='||NAME);
--EXCEPTION

END;
/


-- 레퍼런스 타입 변수
SELECT FIRST_NAME,EMPLOYEE_ID FROM EMPLOYEES
    WHERE FIRST_NAME = 'Ellen';

DECLARE
        VFIRST_NAME EMPLOYEES.FIRST_NAME%TYPE;
        VEMPLOYEE_ID EMPLOYEES.EMPLOYEE_ID%TYPE;
BEGIN
        SELECT FIRST_NAME,EMPLOYEE_ID INTO VFIRST_NAME, VEMPLOYEE_ID
        FROM EMPLOYEES  WHERE FIRST_NAME = 'Ellen';
        DBMS_OUTPUT.PUT_LINE('FISRT_NAME='||VFIRST_NAME);
END;
/

-- 내용을 employee에 해당된 이름, 직업, 사원번호를 출력해주는 프로그램을 작성하시오
DECLARE
        --배열타입 정의(테이블타입 정의)
        TYPE FIRST_NAME_ARR_TYPE 
            IS TABLE OF EMPLOYEES.FIRST_NAME%TYPE INDEX BY BINARY_INTEGER;
        TYPE JOB_ID_ARR_TYPE 
            IS TABLE OF EMPLOYEES.JOB_ID%TYPE INDEX BY BINARY_INTEGER;
        TYPE EMPLOYEE_ID_ARR_TYPE 
            IS TABLE OF EMPLOYEES.EMPLOYEE_ID%TYPE INDEX BY BINARY_INTEGER;
        --배열타입 변수 선언
        FIRST_NAME_ARR FIRST_NAME_ARR_TYPE ;
        JOB_ID_ARR JOB_ID_ARR_TYPE ;
        EMPLOYEE_ID_ARR EMPLOYEE_ID_ARR_TYPE ;
        ROW_ARR EMPLOYEES%ROWTYPE;
        I BINARY_INTEGER := 0;
        J BINARY_INTEGER;
BEGIN
        --향상된 FOR문을 통해서 RESULT SET값을 한개씩 가져와서
        --각 컬럼 배열에 저장한다
        FOR ROW_ARR IN (SELECT * FROM EMPLOYEES) LOOP
                I := I + 1;
                FIRST_NAME_ARR(I) := ROW_ARR.FIRST_NAME;
                JOB_ID_ARR(I) := ROW_ARR.JOB_ID;
                EMPLOYEE_ID_ARR(I) := ROW_ARR.EMPLOYEE_ID; -- 수정된 부분
        END LOOP;
        --향상된 FOR문을 이용해서 컬럼 배열값에 저장된 값을 가져와서 출력하시오
        FOR J IN 1..I LOOP
            DBMS_OUTPUT.PUT_LINE(FIRST_NAME_ARR(J) || ' / ' || JOB_ID_ARR(J) || ' / ' || EMPLOYEE_ID_ARR(J));
        END LOOP;
END;
/

DECLARE
        TYPE EMPLOYEE_ID_ARR_TYPE IS TABLE OF EMPLOYEES.EMPLOYEE_ID%TYPE INDEX BY BINARY_INTEGER;
        TYPE JOB_ID_ARR_TYPE IS TABLE OF EMPLOYEES.JOB_ID%TYPE INDEX BY BINARY_INTEGER;
        
        EMPLOYEE_ID_ARR EMPLOYEE_ID_ARR_TYPE;
        JOB_ID_ARR JOB_ID_ARR_TYPE;
        ROW_ARR EMPLOYEES%ROWTYPE;

        I BINARY_INTEGER := 0;
        J BINARY_INTEGER;
BEGIN
        FOR ROW_ARR IN (SELECT * FROM EMPLOYEES) LOOP
                I := I +1;
                EMPLOYEE_ID_ARR(I) := ROW_ARR.EMPLOYEE_ID;
                JOB_ID_ARR(I) := ROW_ARR.JOB_ID;
        END LOOP;
        FOR J IN 1..I LOOP
                DBMS_OUTPUT.PUT_LINE(EMPLOYEE_ID_ARR(J) || '  /  ' || JOB_ID_ARR(J));
        END LOOP;
END;
/

--EMPLOYEE 'Susan'이름을 갖는 사원의 정보

--RECORD 타입
--내용을 EMPLOYEE 최고 경영자 이름, 사원번호,담당업무, 부서번호를 출력하시오
SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,DEPARTMENT_ID FROM EMPLOYEES WHERE MANAGER_ID IS NULL;

DECLARE
        --레코드 타입(사원번호,이름,담당업무,부서번호)
        TYPE EMP_RECORD_TYPE IS RECORD(
                VEEMPLOYEE_ID EMPLOYEES.EMPLOYEE_ID%TYPE,
                VEFIRST_NAME EMPLOYEES.FIRST_NAME%TYPE,
                VELAST_NAME EMPLOYEES.LAST_NAME%TYPE,
                VEDEPARTMENT_ID EMPLOYEES.DEPARTMENT_ID%TYPE
        );
        --레코드 타입 변수 선언
        EMP_RECORD EMP_RECORD_TYPE;
BEGIN
        SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,DEPARTMENT_ID INTO EMP_RECORD
        FROM EMPLOYEES WHERE MANAGER_ID IS NULL;
        DBMS_OUTPUT.PUT_LINE('사원번호: ' || EMP_RECORD.VEMPLOYEE_ID);
        DBMS_OUTPUT.PUT_LINE('이름: ' || EMP_RECORD.VEFIRST_NAME || ' '|| EMP_RECORD.VELAST_NAME);
        DBMS_OUTPUT.PUT_LINE('사원번호: ' || EMP_RECORD.VEDEPARTMENT_ID);
END;
/
-----------로우타입 변수선언--------------
DECLARE
    EMP_RECORD EMPLOYEES%ROWTYPE;
BEGIN
        SELECT * INTO EMP_RECORD
        FROM EMPLOYEES WHERE MANAGER_ID IS NULL;
        DBMS_OUTPUT.PUT_LINE('사원번호: ' || EMP_RECORD.EMPLOYEE_ID);
        DBMS_OUTPUT.PUT_LINE('이름: ' || EMP_RECORD.FIRST_NAME || ' '|| EMP_RECORD.LAST_NAME);
        DBMS_OUTPUT.PUT_LINE('사원번호: ' || EMP_RECORD.DEPARTMENT_ID);
END;
/
    
SELECT EMPLOYEE_ID,FIRST_NAME,SALARY,SALARY*12 
    +(NVL(COMMISSION_PCT,0)*SALARY) AS "연봉"FROM EMPLOYEES 
    WHERE MANAGER_ID IS NULL;

DECLARE
        EMP_RECORD EMPLOYEES%ROWTYPE;
        TOTAL_SALARY NUMBER(10,2);
BEGIN
        SELECT * INTO EMP_RECORD
        FROM EMPLOYEES WHERE MANAGER_ID IS NULL;
        
        IF (EMP_RECORD.COMMISSION_PCT IS NULL) THEN
                TOTAL_SALART := EMP_RECORD.SALARY*12,
                EMP_RECORD.COMMISSION_PCT := 0;
        END IF;
        
        TOTAL_SALARY := EMP_RECORD.SALARY * 12 + (EMP_RECORD.SALARY * EMP_RECORD.COMMISSION_PCT);
        DBMS_OUTPUT.PUT_LINE('사원번호: ' || EMP_RECORD.EMPLOYEE_ID);
        DBMS_OUTPUT.PUT_LINE('이름: ' || EMP_RECORD.FIRST_NAME || ' '|| EMP_RECORD.LAST_NAME);
        DBMS_OUTPUT.PUT_LINE('전체연봉: ' || LTRIM(TO_CHAR(TOTAL_SALARY,'$999,999,999.99')));
END;
/

SELECT ROUND(DBMS_RANDOM.VALUE(1,5) ,0) FROM DUAL;
SELECT DBMS_RANDOM.STRING('A',5) FROM DUAL;

--EMPLOYEES 테이블에서 임의의 부서번호를 랜덤으로 생성한 후 , 해당된 부서번호 최고연봉을 출력한뒤 평가하여라(낮,중,높,최,없)
SELECT SALARY,DEPARTMENT_ID,FIRST_NAME 
        FROM EMPLOYEES WHERE DEPARTMENT_ID = 50 ORDER BY SALARY DESC;

SELECT ROWNUM, SALARY,DEPARTMENT_ID,FIRST_NAME FROM (SELECT SALARY,DEPARTMENT_ID,FIRST_NAME 
        FROM EMPLOYEES WHERE DEPARTMENT_ID = 50 ORDER BY SALARY DESC) WHERE ROWNUM<=1;

DECLARE 
        VNO NUMBER(4);
        VTOP_SALARY NUMBER(12,2);
        VRESULT VARCHAR2(20);
BEGIN
        -- 임의의 부서번호 생성하기
        VNO := ROUND(DBMS_RANDOM.VALUE(10, 110));  -- 정수로 변환
        SELECT SALARY INTO VTOP_SALARY
        FROM (SELECT SALARY 
              FROM EMPLOYEES 
              WHERE DEPARTMENT_ID = VNO 
              ORDER BY SALARY DESC)
       WHERE ROWNUM <=1; -- 최고 연봉을 1명만 가져옴
        
        -- 평가내리기 1~5000 5000~10000
        IF (VTOP_SALARY BETWEEN 1 AND 5000) THEN
                VRESULT := '낮음';
        ELSIF (VTOP_SALARY BETWEEN 5000 AND 10000) THEN
                VRESULT := '중간';
        ELSIF (VTOP_SALARY BETWEEN 10000 AND 20000) THEN
                VRESULT := '높음';
        ELSE
                VRESULT := '최고';
        END IF;
        
        DBMS_OUTPUT.PUT_LINE('부서번호: ' || VNO);
        DBMS_OUTPUT.PUT_LINE('최고연봉: ' || VTOP_SALARY);
        DBMS_OUTPUT.PUT_LINE('최고연봉평가: ' || VRESULT);

EXCEPTION
        WHEN NO_DATA_FOUND THEN
                DBMS_OUTPUT.PUT_LINE(VNO || ' 부서에 해당되는 사원이 없습니다');
END;
/

DECLARE
        I NUMBER(1) := 1;
        J NUMBER(1) := 0;
BEGIN
        DBMS_OUTPUT.PUT_LINE('------------------구구단------------------');
        FOR I IN 2..9 LOOP
        DBMS_OUTPUT.PUT_LINE('------------------'||I||'단------------------');
            FOR J IN 1..9 LOOP
                DBMS_OUTPUT.PUT_LINE(I || ' X ' || J || ' = ' || I*J);
            END LOOP;
        END LOOP;
END;
/

--구구단 작성하기
DECLARE 
        VNUM NUMBER :=3;
        VCOUNT NUMBER := 1;
        VDAN NUMBER :=1;
BEGIN
        LOOP
                VDAN := VDAN +1;
                --VDAN 단을 출력
                LOOP
                        DBMS_OUTPUT.PUT_LINE(VDAN || ' * ' || VCOUNT || ' = ' ||VDAN * VCOUNT);
                        VCOUNT := VCOUNT+1;
                        IF VCOUNT > 9 THEN
                        EXIT;
                        END IF;
                END LOOP;
                IF VDAN > 8 THEN
                        EXIT;
                END IF;
                VCOUNT := 1;
                 DBMS_OUTPUT.PUT_LINE('-------------------------------');
        END LOOP;
END;
/