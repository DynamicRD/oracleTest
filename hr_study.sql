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
SELECT * FROM EMPLOYEES WHERE SUBSTR(FIRST_NAME,-1,1)='k';
SELECT * FROM EMPLOYEES WHERE FIRST_NAME LIKE '%k';
SELECT EMPLOYEE_ID,FIRST_NAME,JOB_ID FROM EMPLOYEES WHERE MOD(EMPLOYEE_ID,2) = 0;
SELECT * ,NVL(MANAGER_ID,'CEO') FROM EMPLOYEES WHERE MANAGER_ID IS NULL;

create table 고객테이블(
    고객코드 char(7) not null,
    고객명 varchar2(10) not null,
    성별 char(1) not null,
    생일 char(8) not null,
    전화번호 varchar2(16),
    이메일 varchar2(30),
    누적포인트 number(10,0) default 0
);
alter table 고객테이블 add constraint 고객테이블_고객코드_pk primary key(고객코드);
alter table 고객테이블 add constraint 고객테이블_성별_ck check (성별 in ('M','W'));
alter table 고객테이블 add constraint 고객테이블_이메일_uk unique(이메일);
select * from user_constraints where table_name = '고객테이블';

desc 고객테이블;
 
 drop table 고객테이블;
 --===========================================
drop table SST;
create table SST(
    no number,
    name varchar2(4) not null,
    kor number default 0,
    eng number default 0,
    mth number default 0,
    sum number default 0,
    avg number default 0,
    code number
);
alter table SST add constraint SST_no_pk primary key(no);

create table SUBJECT(
    name varchar2(4) not null,
    code number
);
alter table SUBJECT add constraint SUBJECT_code_pk primary key(code);
alter table SST add constraint SST_code_fk foreign key(code) REFERENCES SUBJECT(code);
insert into sst(no,name, kor,eng,mth,sum,avg) values(1000,'홍길동',80,90,70,240,80);
select * from user_constraints where table_name = 'SST';
desc SST;
 