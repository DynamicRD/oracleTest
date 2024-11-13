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
SELECT NVL2(MANAGER_ID,MANAGER_ID,'CEO') FROM EMPLOYEES WHERE MANAGER_ID IS NULL;
SELECT * FROM EMPLOYEES;
--부서별에 따라 급여를 인상(조인: inner join,outer join,self join,cross join)
--(직원번호,직원명,직급,급여)
--부서id에 따라서 'MARKETING'인 직원은 5%, 'PURCHASING'인 사원은 10%
--'Human Resources'인 사원은 15%, 'IT'인 직원은 20%만 인상한다
select employee_id, first_name, salary, department_id from employees;
select employee_id,first_name,salary,job_id,employees.department_id,department_name from employees inner join departments on employees.department_id = departments.department_id;

select employee_id,first_name,salary,job_id,E.department_id,D.department_name,
    case
    when upper(D.department_name) = upper('Marketing') then salary*1.05
    when upper(D.department_name) = upper('Purchasing') then salary*1.10
    when upper(D.department_name) = upper('Human Resources') then salary*1.15
    when upper(D.department_name) = upper('IT') then salary*1.05
    end NEWSALARY
from employees E inner join departments  D on employees.department_id = departments.department_id;


select employee_id,first_name,salary,job_id,A.department_id,B.department_name,case
        when B.DEPARTMENT_name='Marketing' then salary*1.05
        when B.DEPARTMENT_name='Purchasing' then salary*1.10
        when B.DEPARTMENT_name='Human Resources' then salary*1.15
        when DEPARTMENT_name='IT' then salary*1.20
end NEWSALARY
from employees A inner join departments B on A.department_id = B.department_id
WHERE A.department_id in(20,30,40,60);
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
 drop table sst;
 drop table subject;
 
create table SST(
    no number(5),
    name varchar2(10) not null,
    kor number(3) default 0 not null,
    eng number(3) default 0 not null,
    mth number(3) default 0 not null,
    sum number(3) default 0,
    avg number(3) default 0,
    code number(5)

);

alter table SST add constraint SST_no_pk primary key(no);

create table SUBJECT(
    name varchar2(10) not null,
    code number(5)
);

alter table SUBJECT add constraint SUBJECT_code_pk primary key(code);
ALTER TABLE sst ADD CONSTRAINT sst_subject_code_fk FOREIGN KEY (code) REFERENCES subject (code);
insert into sst(no,name, kor,eng,mth,sum,avg) values(1000,'홍길동',80,90,70,240,80);
insert into sst(no,name, kor,eng,mth,sum,avg) values(1001,'김두한',50,60,40,150,50);
insert into SUBJECT(name,code) values('국어',12345);
UPDATE sst SET code = 12345 WHERE no = 1000;
UPDATE sst SET code = 12345 WHERE no = 1001;
select * from SST;
select * from SUBJECT;
select * from user_constraints where table_name = 'SST';
desc SST;
--====================================
DROP TABLE EMP001;
CREATE TABLE EMP001(
    NO NUMBER(4),
    NAME VARCHAR2(10) NOT NULL,
    JOB VARCHAR2(9),
    MANAGER NUMBER(4),
    HIREDATE DATE NOT NULL,
    SALARY NUMBER(7,2) NOT NULL,
    COMM NUMBER(7,2) DEFAULT 0.0,
    DEPTNO NUMBER(2) NOT NULL
    );
    ALTER TABLE EMP001 ADD CONSTRAINT EMP001_NO_PK PRIMARY KEY(NO);
    -------------
    INSERT INTO EMP001 VALUES (7369,'SMITH','CLEAK',7836,'80/12/17',800,NULL,20);
    INSERT INTO EMP001 VALUES (7499,'ALLEN','SALESMAN',7369,'87/12/20',1600,300,30);
    INSERT INTO EMP001 VALUES (7839,'KING','PRESIDENT',NULL,'81/02/08',5000,NULL,10);
    SELECT * FROM EMP001;
    SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'EMP001';
    ---------------
    CREATE TABLE MEMBERS(
        ID VARCHAR2(20),
        NAME VARCHAR2(20) NOT NULL,
        REGNO VARCHAR2(13) NOT NULL,
        HP VARCHAR2(13) NOT NULL,
        ADDRESS VARCHAR2(100) NOT NULL
    );
    ALTER TABLE MEMBERS ADD CONSTRAINT MEMBERS_ID_PK PRIMARY KEY(ID);
 ----------------------
 DROP TABLE BOOKS;
 CREATE TABLE BOOKS(
    CODE NUMBER(4),
    TITLE VARCHAR2(50) NOT NULL,
    COUNT NUMBER(6) NOT NULL,
    PRICE NUMBER(10) NOT NULL,
    PUBLISH VARCHAR2(50) NOT NULL
    );
    ALTER TABLE BOOKS ADD CONSTRAINT BOOKS_CODE_PK PRIMARY KEY(CODE);
-----------------------
INSERT INTO MEMBERS VALUES ('고래','철수','9512121212121','010-4444-5555','서울시 서초구 역삼동'); 
INSERT INTO MEMBERS VALUES ('나무','영구','9513131313131','010-5555-7777','서울시 강남구 대치동');
SELECT * FROM MEMBERS;
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'MEMBERS';

INSERT INTO BOOKS VALUES ('1234','누가내머리위에똥쌋어',150,7500,'웅진');
INSERT INTO BOOKS VALUES ('1235','탈무드',188,10000,'그리스출판사');
SELECT * FROM BOOKS;
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'BOOKS';
--비디오--------------------------

CREATE TABLE CUSTOMER(
    C_CODE NUMBER(5),
    C_NAME VARCHAR2(20) NOT NULL,
    C_AGE NUMBER(3),
    C_ADDR VARCHAR(50),
    C_TEL VARCHAR(20)
);
ALTER TABLE CUSTOMER ADD CONSTRAINT CUSTOMER_C_CODE_PK PRIMARY KEY(C_CODE);
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'CUSTOMER';

CREATE TABLE VIDEO(
    V_CODE NUMBER(5),
    V_TITLE VARCHAR2(50) NOT NULL,
    V_GENRE VARCHAR2(30),
    V_PAY NUMBER(7) NOT NULL,
    V_LEND_STATE NUMBER(1),
    v_make_company VARCHAR2(50),
    v_make_date DATE,
    v_view_age NUMBER(1)
);
ALTER TABLE VIDEO ADD CONSTRAINT VIDEO_V_CODE_PK PRIMARY KEY(V_CODE);
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'VIDEO';

CREATE TABLE ENTITY(
    LR_CODE NUMBER(5),
    C_CODE NUMBER(5),
    V_CODE NUMBER(5),
    L_DATE DATE,
    R_PLAN DATE,
    L_TOTAL_PAY NUMBER(7)
);
ALTER TABLE ENTITY ADD CONSTRAINT ENTITY_LR_CODE_PK PRIMARY KEY(LR_CODE);
ALTER TABLE ENTITY ADD CONSTRAINT ENTITY_C_CODE_FK FOREIGN KEY(C_CODE) REFERENCES CUSTOMER(C_CODE);
ALTER TABLE ENTITY ADD CONSTRAINT ENTITY_V_CODE_FK FOREIGN KEY(V_CODE) REFERENCES VIDEO(V_CODE);
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'ENTITY';
--=================================
drop table subject;


create table subject1(
    no number(4),
    code number(2) not null,
    name varchar2(20) not null
);
alter table subject1 add constraint subject1_no_pk primary key(no);
alter table subject1 add constraint subject1_number_uk unique(code);

drop table student;
create table student(
    no number(4),
    num number(8) not null,
    name varchar2(20) not null,
    id varchar(20) not null,
    pwd varchar2(20) not null,
    code number(2) not null,
    identify char(19) not null,
    phone char(13)  not null,
    addr varchar2(50) not null,
    email varchar2(30) not null,
    sd_date date not null
);
alter table student add constraint student_no_pk primary key(no);
alter table student add constraint student_no_uk unique(num);
alter table student add constraint student_code_fk foreign key(code) references subject1(code);
update student set num = to_number(substr(sd_date,1,2)||substr(code,1,2)||code);
update student set sd_date = sysdate;
drop table lesson;
create table lesson(
    no number(4),
    code number(2) not null,
    name varchar2(20) not null
);
alter table lesson add constraint lesson_no_pk primary key(no);
alter table lesson add constraint lesson_code_uk unique(code);
alter table lesson add constraint lesson_code_name
check (
    (code = 'K' AND name = '국어') or
    (code = 'M' AND name = '수학') or
    (code = 'E' AND name = '영어') or
    (code = 'H' AND name = '역사') or
    (code = 'P' AND name = '프로그래밍') or
    (code = 'D' AND name = '데이터베이스') or
    (code = 'ED' AND name = '교육학이론')
);
    drop table trainee;
create table trainee(
    no number(4),
    num number(8) not null,
    code number(2) not null,
    section varchar2(30) not null,
    t_date date not null
    );
alter table trainee add constraint trainee_no_pk primary key(no);    
update trainee set t_date = sysdate;
alter table trainee add constraint tainee_num_fk foreign key(num) references student(num);
alter table trainee add constraint tainee_code_fk foreign key(code) references lesson(code);
alter table trainee add constraint tainee_section_ck check(section 
    in('국어-컴퓨터','국어-데이터베이스','수학-컴퓨터','수학-데이터베이스','영어-컴퓨터',
        '영어-데이터베이스','역사-컴퓨터','역사-데이터베이스'));

 
--일련 번호는 다 자동 증가로 설정한다.
 
    
    
    
    
    
    
    
    
    
    