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
 