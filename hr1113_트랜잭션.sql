--?Transaction
drop table dep02;

--테이블 복사(구조만 복사)
create table dep02 
    as
    select * from departments where 1=0;

--내용 복사
insert into dep02 select * from departments;

select * from dep02;

savepoint C1;

delete from dep02 where department_id = 90;

select * from dep02;

rollback to C1;

--view 생성하기
create view viewemp01
    as select employee_id,first_name,salary,department_id from emp_copy
    where department_id = 10;
    
select * from viewemp01;

--employees 복사해서emp_copy
create table emp_copy
    as
    select * from employees;
    
select * from emp_copy;

--view 제거하기
drop view view_copy;

--view 생성하기
create view view_emp01
    as
    select employee_id,first_name,salary,department_id 
    from emp_copy where department_id = 10;

--select
select * from view_emp01;
select * from emp_copy where employee_id = 200;
--view 수정하기
update view_emp01 set salary = 4500 where employee_id = 200;

--data dictionary
--(user_tables,user_constraintsmuser_cons_columns,user_views,user_indexes)
select * from user_tables;
select * from user_constraints;
select * from user_cons_columns where table_name = 'EMPLOYEES';
select * from user_views;
select * from user_indexes;

--가상 뷰에 입력하기(가상테이블에 컬럼 4개 입력, 원본 10개인데
--  그중에 NOT NULL인데 가상테이블에 포함되어 있지 않으면)
insert into  view_emp01 values(1000,'jdk',2000,50);
select * from view_emp01;

select * from user_constraints where table_name = 'emp_copy';

--view 생성하기
create view view_emp02
    as select employee_id,first_name,last_name,email,hire_date,job_id from emp_copy
    where department_id = 10;
    
select * from view_emp02;
insert into view_emp02 values(1000,'dong_jin','kim','rrrr@naver.com',to_date('2020/01/01','YYYY/MM/DD'),'IT_dev');

select * from emp_copy where employee_id = 1000;

create view view_emp03
    as select employee_id,first_name,last_name,email,hire_date,job_id from emp_copy;

--가상뷰에서 삭제를 진행하기
delete from view_emp03 where employee_id = 2000;

--복합뷰 생성하기(EMPLOYEES,DEPARTMENTS)두개의 테이블에서 조인해서 새로운 테이블 만들기
create view view_emp_dep
    as
    select employee_id,first_name,salary,e.department_id,department_name,location_id
    from employees e inner join departments d on e.department_id = d.department_id
    order by e.department_id desc with read only;

select * from view_emp_dep;
select distinct department_id,department_name from view_emp_dep;
--부서명 it 연봉 평균,최고값,최저값 구하기
select department_name, round(avg(salary)),max(salary),min(salary) from view_emp_dep 
    where department_name = 'IT' group by department_name;

--view force
create or replace force view VIEW_FORCE
as
select EMPLOYEE_ID,FIRST_NAME,LAST_NAME,DEPARTMENT_ID from EMP20;

desc  VIEW_FORCE;

--rownum
select * from employees;
select rownum,department_id,first_name from employees 
    where department_id = 100 order by first_name desc;
    
--rownumm 정렬하면 순서 흐트러진걸 다시 순차적으로 보여주고싶을때
select rownum,employee_id,first_name, hire_date from employees
    order by hire_date desc;
    
create view view_hiredate 
    as  
    select employee_id,first_name, hire_date from employees
    order by hire_date desc;

select rownum,employee_id,first_name,hire_date from view_hiredate;    

select rownum,employee_id,first_name,hire_date from
(
 select employee_id,first_name, hire_date from employees order by hire_date desc
)where rownum <= 4;