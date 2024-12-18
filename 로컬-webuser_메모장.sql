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
--장표회원가입-------------------------------------------------------------------------
create table signup(
    id varchar2(12),
    pwd varchar2(12) not null,
    email varchar2(100) not null,
    name varchar2(50) not null,
    birth number(10)
);
--TEMP MEMBER--------------------------------------------------------
CREATE TABLE TEMPMEMBER (
    ID VARCHAR2(20),
    PASSWD VARCHAR2(20),
    NAME VARCHAR2(20),
    MEM_NUM1 VARCHAR2(6),
    MEM_NUM2 VARCHAR2(7),
    E_MAIL VARCHAR2(30),
    PHONE VARCHAR2(30),
    ZIPCODE VARCHAR2(7),
    ADDRESS VARCHAR2(60),
    JOB VARCHAR2(30)
 );
alter table TEMPMEMBER add constraint TEMPMEMBER_ID_PK primary key (ID);
insert into tempMember values('aaaa', '1111', '홍길동', '123456', '7654321',
'hong@hanmail.net', '02-1234', '100-100', '서울', '프로그래머');
insert into tempMember values('bbbb', '1111', '홍길동', '123456', '7654321',
'hong@hanmail.net', '02-1234', '100-100', '서울', '프로그래머');
insert into tempMember values('cccc', '1111', '홍길동', '123456', '7654321',
'hong@hanmail.net', '02-1234', '100-100', '서울', '프로그래머');
commit;
select * From tempmember;
------------------------------------------------------------
--학생관리 프로그램
CREATE table STUDENT (
 ID VARCHAR2(12) NOT NULL,
 PASS VARCHAR2(12) NOT NULL,
 NAME VARCHAR2(10) NOT NULL,
 PHONE1 VARCHAR2(3) NOT NULL,
 PHONE2 VARCHAR2(4) NOT NULL,
 PHONE3 VARCHAR2(4) NOT NULL,
 EMAIL VARCHAR2(30) NOT NULL,
 ZIPCODE VARCHAR2(7) NOT NULL,
 ADDRESS1 VARCHAR2(120) NOT NULL,
 ADDRESS2 VARCHAR2(50) NOT NULL
);
select * from student;
alter table student add constraint STUDENT_ID_PK primary key(id);
drop table zipcode;
create table zipcode (
 seq NUMBER(10) not null,
 zipcode VARCHAR2(50),
 sido VARCHAR2(50),
 gugun VARCHAR2(50),
 dong VARCHAR2(50),
 bunji VARCHAR2(50)
);
alter table zipcode add constraint ZIPCODE_SEQ_PK primary key(seq);
alter table zipcode modify bunji VARCHAR2(100);
describe zipcode;
select * from zipcode;
SELECT count(*) as count FROM Student WHERE ID = 'aaa';
select * from zipcode where dong like '서초%';

-------------------답변형 게시판
drop table board;
CREATE TABLE  BOARD (
    NUM     NUMBER(7,0) NOT NULL, 
    WRITER  VARCHAR2(12) NOT NULL, 
    EMAIL   VARCHAR2(30) NOT NULL, 
    SUBJECT VARCHAR2(50) NOT NULL, 
    PASS    VARCHAR2(10) NOT NULL, 
    READCOUNT NUMBER(5,0) DEFAULT 0, 
    "REF"   NUMBER(5,0) DEFAULT 0, 
    STEP    NUMBER(3,0) DEFAULT 0, 
    "DEPTH" NUMBER(3,0) DEFAULT 0, 
    REGDATE TIMESTAMP (6) DEFAULT SYSDATE, 
    "CONTENT" VARCHAR2(4000) NOT NULL, 
    IP      VARCHAR2(20) NOT NULL
   );
   CREATE SEQUENCE BOARD_SEQ  -- 시퀀스이름
   START WITH 1                -- 시작을 1로 설정
   INCREMENT BY 1             -- 증가값을 1씩 증가
   NOMAXVALUE               -- 최대값이 무한대..
   NOCACHE
   NOCYCLE;
ALTER TABLE BOARD ADD CONSTRAINTS BOARD_NUM_PK PRIMARY KEY(NUM); 
------------------------------------메인페이지 - 회원
drop table member;
CREATE table member (
 ID VARCHAR2(20) NOT NULL,
 PASS VARCHAR2(20) NOT NULL,
 NAME VARCHAR2(20) NOT NULL,
 PHONE VARCHAR2(13) NOT NULL,
 EMAIL VARCHAR2(40) NOT NULL,
 ZIPCODE VARCHAR2(7) NOT NULL,
 ADDRESS1 VARCHAR2(120) NOT NULL,
 ADDRESS2 VARCHAR2(50) NOT NULL
);
select * from member;
alter table member add constraint MEMBER_ID_PK primary key(id);

--게시판
drop table boardmember;
CREATE TABLE  boardmember (
    NUM     NUMBER(7,0) NOT NULL, 
    WRITER  VARCHAR2(30) NOT NULL, 
    SUBJECT VARCHAR2(50) NOT NULL, 
    PASS    VARCHAR2(10) NOT NULL, 
    READCOUNT NUMBER(5,0) DEFAULT 0, 
    "REF"   NUMBER(5,0) DEFAULT 0, 
    STEP    NUMBER(3,0) DEFAULT 0, 
    "DEPTH" NUMBER(3,0) DEFAULT 0, 
    REGDATE TIMESTAMP (6) DEFAULT SYSDATE, 
    "CONTENT" VARCHAR2(4000) NOT NULL, 
    COMMENTS NUMBER(5,0) DEFAULT 0,
    IP      VARCHAR2(20) NOT NULL
   );
   CREATE SEQUENCE BOARDMEMBER_SEQ  -- 시퀀스이름
   START WITH 1                -- 시작을 1로 설정
   INCREMENT BY 1             -- 증가값을 1씩 증가
   NOMAXVALUE               -- 최대값이 무한대..
   NOCACHE
   NOCYCLE;
ALTER TABLE BOARDMEMBER ADD CONSTRAINTS BOARDMEMBER_NUM_PK PRIMARY KEY(NUM); 
select * from boardmember;
--댓글 
drop table commentmember;
CREATE TABLE  commentmember (
    NUM     NUMBER(7,0) NOT NULL,
    b_num    NUMBER(7,0) NOT NULL, 
    WRITER  VARCHAR2(30) NOT NULL, 
    PASS    VARCHAR2(10) NOT NULL, 
    "REF"   NUMBER(5,0) DEFAULT 0, 
    STEP    NUMBER(3,0) DEFAULT 0, 
    "DEPTH" NUMBER(3,0) DEFAULT 0, 
    REGDATE TIMESTAMP (6) DEFAULT SYSDATE, 
    "CONTENT" VARCHAR2(4000) NOT NULL, 
    IP      VARCHAR2(20) NOT NULL
   );
   CREATE SEQUENCE commentmember_SEQ  -- 시퀀스이름
   START WITH 1                -- 시작을 1로 설정
   INCREMENT BY 1             -- 증가값을 1씩 증가
   NOMAXVALUE               -- 최대값이 무한대..
   NOCACHE
   NOCYCLE;
ALTER TABLE commentmember ADD CONSTRAINTS COMMENTMEMBER_NUM_PK PRIMARY KEY(NUM);
ALTER TABLE commentmember ADD CONSTRAINTS COMMENTMEMBER_B_NUM_PK FOREIGN KEY(b_num) REFERENCES boardmember(num) ON DELETE cascade;


