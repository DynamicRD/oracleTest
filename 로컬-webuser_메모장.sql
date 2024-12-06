CREATE SEQUENCE visit_seq  -- 시퀀스이름
   START WITH 1             -- 시작을 1로 설정
   INCREMENT BY 1          -- 증가 값을 1씩 증가
   NOMAXVALUE             -- 최대 값이 무한대
   NOCACHE
   NOCYCLE;

drop table visit;
CREATE table VISIT (
    NO NUMBER(5,0) NOT NULL,
    WRITER  VARCHAR2(20) NOT NULL,
    MEMO   VARCHAR2(4000) NOT NULL,
    REGDATE  DATE DEFAULT SYSDATE
);
alter table visit add constraint visit_no_pk primary key(no);
select * from visit;

create sequence member_seq
start with 1
increment by 1;

create table member(
    no number(4),
    id varchar2(100),
    pw varchar2(100)
);

select * from member order by no;
insert into member values(member_seq.nextval,'dd','aa');

-------------------------------------------------------------------------------
drop table login;
CREATE table LOGIN (
    ID         VARCHAR2(30) not null,
    PASS      VARCHAR2(30) NOT NULL,
    name varchar2(30) not null
);
alter table login add constraint login_id_pk primary key(id);
insert into login values('admin',123456,'김동욱');
select * from login;
truncate table login;
delete from login where id = 'zzz';