create table zipcode (
 seq NUMBER(10) not null,
 zipcode VARCHAR2(50),
 sido VARCHAR2(50),
 gugun VARCHAR2(50),
 dong VARCHAR2(50),
 bunji VARCHAR2(100)
);
alter table zipcode add constraint ZIPCODE_SEQ_PK primary key(seq);

drop table member;
create table member(
    ID VARCHAR2(20) NOT NULL,
    PASS VARCHAR2(20) NOT NULL,
    NAME VARCHAR2(20) NOT NULL,
    PHONE VARCHAR2(13) NOT NULL,
    EMAIL VARCHAR2(40) NOT NULL,
    gender varchar2(6) not null,
    ZIPCODE VARCHAR2(7) NOT NULL,
    ADDRESS1 VARCHAR2(120) NOT NULL,
    ADDRESS2 VARCHAR2(50) NOT NULL,
    REG_DATE DATE DEFAULT sysdate,
    MONEY NUMBER(8, 0) DEFAULT 0
);

alter table member add constraint member_ID_PK primary key(id);
alter table member add constraint member_PHONE_UK unique(PHONE);
alter table member add constraint member_EMAIL_UK unique(EMAIL);
commit;
insert into member values ('아이디','비번','이름','전화','메일','성별','code','주소1','주소2',sysdate,0);