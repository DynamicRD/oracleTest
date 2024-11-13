-- susan의 부서아이디 보기
select department_id from employees where first_name = 'Susan';

-- 부서테이블에서 40번 부서명을 조회
select department_name from departments where department_id = 40;

-- susan 소속되어있는 부서명을 검색하시오.
select * from employees where first_name = 'Susan';
select * from departments where department_id = 40;

--join으로 찾기
select first_name,department_name from departments d inner join employees e 
    on d.department_id = e.department_id
    where upper(first_name) = upper('Susan');
 
 --단일행은 비교,크기, 연산이 가능하다
 --다중행은 비교,크기, 연산 불가능하다(in=or, any=1개이상, all=모두, exists=존재하나)
select department_id from employees where first_name = 'susan';
select * from departments where department_id = 
    (select department_id from employees where  first_name = 'Susan');
    
--employees  테이블에서 Lex와 같은부서에 있는 모든 사원의 이름과
--입사일자를 출력하는 select문을 작성하시오
select department_id from employees where first_name = 'Lex';
select first_name,to_char(hire_date,'YYYY-MM-DD') from employees where department_id = 
(select department_id from employees where first_name = 'Lex');
--상사가 null인 사람은 ceo
select * from employees where manager_id = (select employee_id from employees where manager_id is null);

--고용테이블에서 전체 연봉 평균
select round(avg(salary)) as "평균연봉" from employees group by department_id;
--전체 평균연봉보다 높은 직원 정보 출력
 select * from employees where salary > (select round(avg(salary)) as salary from employees);
 --다중행일시 비교
select * from employees where exists (select round(avg(salary)) as salary from employees  group by department_id);
select * from employees where 1 = 0; --구조만 복사

create table imsiTBL
as
select * from employees where 1 =1 ;

select * from imsiTBL;
select * from user_constraints where table_name = 'imsiTBL';
drop table imsiTBL;

--월급이 13000 이상인 사람의 부서를 보여주시오
select distinct department_id from employees where salary >= 13000;
select * from employees where department_id in( 90,80,20);
select * from employees where department_id 
in(select distinct department_id from employees where salary >= 13000);

--employees 테이블에서 Susan 또는 Lex 월급
select * from employees where first_name = 'Susan' or first_name = 'Lex';

-- employees 테이블에서 Susan  또는 Lex와 월급이 같은 직원의 이름, 업무,급여를 출력(Susan,Lex는 제외)
select salary from employees where first_name = 'Susan' or first_name = 'Lex';
select first_name, job_id,salary from employees where 
    salary in (select salary from employees where first_name = 'Susan' or first_name = 'Lex') 
    and first_name <> 'Susan' and first_name <> 'Lex';
    --and first_name not in('Susan','Lex');

--한명 이상으로 부터 보고를 받는다 = 
select distinct manager_id from employees where manager_id is not null;
select distinct manager_id as "상사" from employees;
--한명 이상으로부터 보고를 받을 수 있는 직원의 직원번호,이름, 업무,부서번호를 출력하라
select employee_id,first_name,job_id,department_id from employees 
    where manager_id in (select distinct manager_id from employees);

select first_name, job_id from employees 
    where job_id in (select job_id from employees where department_id = 
    (select department_id from departments where department_name = 'Accounting'));
    
--exists
select * from employees where department_id = 110;

--테이블 복사
drop table emp02;
create table emp02 as select first_name,employee_id from employees;
select * from emp02;

-- 서브쿼리를 이용해서 데이터 복사
-- 구조만 복사 departments 테이블 생성(DEP01)
create table dep01
as
select * from departments;

--내용을 서브쿼리를 이용해서 저장하시오
--insert into dep01(커럼명...) values(컬럼값...)
insert into DEP01 (select * from departments);

--updata 서브쿼리를 활용한다
--부서 10번에 지역위치를 부서 40번 지역위치로 수정하시오
update dep01 set location_id = (select location_id from departments where department_id = 40) where department_id = 10;
select location_id from departments where department_id = 40;
select * from dep01;
desc employees;
--문제
--직급이 'st_man'인 직원이 받는 급여들의 최소 급여보다 적게받는 직원들 min(salary) 써도 된다
select first_name, salary from employees 
    where salary > any(select salary from employees where job_id = 'ST_MAN') 
    and department_id <> 20;
---------------------------
select job_id,salary from employees where first_name = 'Valli';
select * from employees where job_id = 'It_PROG' and salary = 4800;

select * from employees where 
    salary = (select salary from employees where first_name = 'Valli') 
    and job_id = (select job_id from employees where first_name = 'Valli')   
    and first_name <> 'Valli';
  
    
select department_id,first_name,salary from employees 
    where salary > (select round(avg(salary)) from employees where first_name = 'Valli');
-----과제
select first_name,last_name as "Name" ,job_id,salary from employees 
    where salary > (select salary from employees where last_name ='Tucker');
    
select e.first_name,e.last_name as "Name",e.job_id,e.salary,e.hire_date 
    from employees e
    inner join(select department_id, min(salary) as min_salary
    from employees
    group by department_id) d on e.department_id = d.department_id
    where e.salary = d.min_salary;


select e.first_name,e.last_name as "Name",e.salary,e.department_id,e.job_id
    from employees e
    inner join(select department_id, avg(salary) as avg_salary
    from employees
    group by department_id) d on e.department_id = d.department_id
    where e.salary > d.avg_salary;
    

select e.first_name,e.last_name as "Name",e.job_id,e.salary,e.department_id,d.avg_salary
    from employees e
    inner join(select department_id, round(avg(salary)) as avg_salary 
    from employees group by department_id) d on  e.department_id = d.department_id;