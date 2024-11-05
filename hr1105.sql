--테이블 설계하기 (사원번호, 사원명, 급여) :DDL
--class EMP01{
--    public int no;
--    public int name;
--    public double salary;
--}
create table EMP01(
    no NUMBER(4),
    name VARCHAR2(20) not null,
    salary NUMBER(10,2) default 1000.0,
    CONSTRAINT EMP01_no_PK primary key(no,name),
    CONSTRAINT EMP01_salary_uk UNIQUE(salary)
);



--get set -> update
--to String-> select
--추가,변경 -> alter
--클래스까지 삭제 drop
--객체 삭제 truncate
--refactor rename
