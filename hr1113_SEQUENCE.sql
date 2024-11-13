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
