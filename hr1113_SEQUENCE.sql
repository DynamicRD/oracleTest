--시퀀스 생성
 create sequence emp_seq
    start with 1
    increment by 1
 minvalue 1
    maxvalue 100000
  nocycle
 cache 2;
 -- user_tables,user_constraints,user_cons_columns
 --,user_views,user_indexes,user_sequence
 select * from user_sequences;
 
 drop table emp01;
 create table emp01 
 as
 select employee_id,first_name,hire_date from employees where 1=0;
 
 select *from emp01;
 desc emp01;
 -- emp_seq.nextval 입력하기
 insert into emp01 values (emp_seq.nextval,'KDJ',sysdate);
 
  -- emp_seq.currval 입력하기
  select emp_seq.currval from dual;
  
--sequence dept_seq 생성하기,시작값 10,증가치 10,결과치 30
create sequence dept_seq
start with 10
increment by 10
maxvalue 30;

select * from user_sequences;

--dept01 테이블을 구조 복사하기
drop table DEPT01;

create table dept01
as
select department_id,department_name,location_id from departments where 1=0;

insert into dept01 values( dept_seq.nextval,'인사과',1);
insert into dept01 values( dept_seq.nextval,'총무과',2);
insert into dept01 values( dept_seq.nextval,'서무과',3);
insert into dept01 values( dept_seq.nextval,'교육과',4);
select * from dept01;

--sequence 수정하기
alter sequence dept_seq 
    maxvalue 100;

select * from user_sequences where sequence_name = 'dept_seq';

--sequence 삭제
drop sequence dept_seq;

--데이터 딕셔너리에서 인덱스 확인
select * from user_indexes where table_name ='EMPLOYEES';
select * from user_ind_columns where table_name ='EMPLOYEES';

select * from employees where employee_id = 100;

drop table emp10;
DROP INDEX EMP10_EMPLOYEE_IX;
create table emp10
as
select * from employees where 1=1;

select * from emp10 where employee_id = 100;

--인덱스 생성하기
select * from user_ind_columns where table_name = 'emp10';
create unique index emp10_employee_ix
on emp10(EMPLOYEE_ID);
-------------------------------------------------------
CREATE VIEW VIEW_LOC AS
    SELECT EMPLOYEE_ID,FIRST_NAME,DEPARTMENT_NAME,LOCATION_ID
    FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
    ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;
SELECT * FROM VIEW_LOC;   

CREATE VIEW VIEW_DEPT30 AS
    SELECT FIRST_NAME,HIRE_DATE,DEPARTMENT_NAME
    FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
    ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
    WHERE E.DEPARTMENT_ID = 30;
SELECT * FROM VIEW_DEPT30;    

CREATE VIEW VIEW_DEPT_MAXSAL AS
    SELECT SALARY,DEPARTMENT_NAME
    FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
    ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
    WHERE (SALARY,E.DEPARTMENT_ID) IN(SELECT MAX(SALARY),DEPARTMENT_ID FROM EMPLOYEES GROUP BY DEPARTMENT_ID);
SELECT * FROM VIEW_DEPT_MAXSAL;

CREATE VIEW VIEW_SAL_TOP3 AS
    SELECT FIRST_NAME,SALARY 
    FROM (SELECT FIRST_NAME,SALARY FROM EMPLOYEES ORDER BY SALARY DESC) 
    WHERE ROWNUM <=3;
SELECT * FROM VIEW_SAL_TOP3;  
    