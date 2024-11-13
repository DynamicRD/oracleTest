--테이블 설계하기 (사원번호, 사원명, 급여) :DDL
--class EMP01{
--    public int no;
--    public int name;
--    public double salary;
--}
create table EMP01(
    no NUMBER(4),
    name VARCHAR2(20) constraint emp01_name_nn not null,
    salary NUMBER(10,2) default 1000.0,
    CONSTRAINT EMP01_no_PK primary key(no),
    CONSTRAINT EMP01_name_uk UNIQUE(name)
);

--SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'EMP01';
--SELECT OWNER, CONSTRAINT_NAME,TABLE_NAME,COLUMN_NAME FROM USER_CONS_COLUMNS WHERE TABLE_NAME = 'EMP01';

--테이블 정보 구하기
SELECT * FROM TAB;
--테이블 삭제하기 ddl
drop table emp01;
--휴지통 보기
select * from recyclebin;
purge recyclebin;
--휴지통 복원
flashback table emp01 to before drop;
--테이블 복사(제약조건은 복사가 안됨)
desc employees;
select count(*) from employees;
create table emple02 as select * from employees;
desc emple02;
select count(*) from emple02;
--제약조건 걸기 primary key, unique
alter table emple02 add constraint emple02_id_pk primary key(employee_id);
alter table emple02 add constraint emple02_email_uk    unique(email);
--제약조건 삭제하기 unique
alter table emple02 drop constraint emple02_email_uk;
--제약조건 검색
select * from user_constraints;
select * from user_constraints where table_name = upper('emple02');

 --테이블 구조 변경
 --컬럼 추가 emp01
alter table emp01 add job varchar2(10) not null;
desc emp01;

--컬럼 제거
alter table emp01 drop column job;
--컬럼변경(주의: 기존 값이 존재할 때 생각을 할것)->타입변경불가,사이즈 큰것으로 변경
alter table emp01 modify job number(10) default 0;
--컬럼 이름변경
alter table emp01 rename column job to job2;
alter table emp01 rename column job2 to job; 
 
 --테이블명 변경 emp01 -> emp02 ddl(create,alter,drop,rename,truncate)
 rename emp01 to emp02;
 select * from tab;
 
 --제약조건 NOT NULL
 ALTER TABLE EMP01 MODIFY SALARY NUMBER(10,2) NOT NULL;
 
--get set -> update
--to String-> select
--추가,변경 -> alter
--클래스까지 삭제 drop
--객체 삭제 truncate
--refactor rename
