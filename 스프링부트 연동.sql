CREATE TABLE jdbcboard (
    board_no NUMBER,
    title    VARCHAR2(100) NOT NULL,
    content  VARCHAR2(1000) NULL,
    writer   VARCHAR2(50) NOT NULL,
    reg_date DATE DEFAULT sysdate,
    PRIMARY KEY ( board_no )
);

CREATE SEQUENCE jdbcboard_seq START WITH 1 INCREMENT BY 1;

INSERT INTO jdbcboard (
    board_no,
    title,
    content,
    writer
) VALUES ( jdbcboard_seq.NEXTVAL,
           'aaa',
           'aaa',
           'aaa' );

SELECT
    *
FROM
    jdbcboard;

SELECT
    board_no,
    title,
    content,
    writer,
    reg_date
FROM
    jdbcboard
WHERE
    board_no > 0
ORDER BY
    board_no DESC,
    reg_date DESC;

COMMIT;

SELECT
    board_no,
    title,
    content,
    writer,
    reg_date
FROM
    jdbcboard;

COMMIT;

SELECT
    board_no,
    title,
    content,
    writer,
    reg_date
FROM
    jdbcboard
WHERE
    title LIKE '%a%';

======================
==JPA==
======================
CREATE TABLE
jpaboard (
    board_no NUMBER,
    title VARCHAR2(100) NOT NULL,
    content VARCHAR2(1000) NULL,
    writer VARCHAR2(50) NOT NULL,
    reg_date DATE DEFAULT sysdate,
    primary key(board_no)
);
create sequence jpaboard_seq
start with 1
increment by 1;

select * from jpaboard;
======================
==MyBatis==
======================
CREATE TABLE
mybatisboard (
    board_no NUMBER,
    title VARCHAR2(100) NOT NULL,
    content VARCHAR2(500) NULL,
    writer VARCHAR2(50) NOT NULL,
    reg_date DATE DEFAULT sysdate,
    primary key(board_no)
);
create sequence mybatisboard_seq
start with 1
increment by 1;
select * from mybatisboard;

CREATE TABLE
mybatismember (
    user_no NUMBER,
    user_id VARCHAR2(50) NOT NULL,
    user_pw VARCHAR2(50) NOT NULL,
    user_name VARCHAR2(100) NOT NULL,
    coin NUMBER(10) DEFAULT 0,
    reg_date DATE DEFAULT sysdate,
    upd_date DATE DEFAULT sysdate,
    enabled CHAR(1) DEFAULT '1',
    primary key(user_no)
);
CREATE TABLE
mybatismember_auth(
    user_no NUMBER NOT NULL, 
    auth VARCHAR2(50) NOT NULL
);
ALTER TABLE mybatismember_auth ADD CONSTRAINT fk_mybatismember_auth_user_no
FOREIGN KEY(user_no) REFERENCES mybatismember(user_no);
create sequence mybatismember_seq
start with 1
increment by 1;
select * from mybatismember;
===============================
CREATE TABLE item(
item_id NUMBER(5),
item_name VARCHAR2(20),
price NUMBER(6),
description VARCHAR2(50),
picture_url VARCHAR2(200),
PRIMARY KEY (item_id)
);
create sequence item_seq
start with 1
increment by 1;
select * from item;


CREATE TABLE item2(
item_id NUMBER(5),
item_name VARCHAR2(20),
price NUMBER(6),
description VARCHAR2(50),
picture_url VARCHAR2(200),
picture_url2 VARCHAR2(200),
PRIMARY KEY (item_id)
);
create sequence item2_seq
start with 1
increment by 1;
create sequence item_seq
start with 1
increment by 1;
select * from item2;
===================
==AOP
===================
CREATE TABLE
aopBoard( board_no
NUMBER,
title VARCHAR2(100) NOT NULL,
content VARCHAR2(1000) NULL,
writer VARCHAR2(50) NOT NULL,
reg_date DATE DEFAULT SYSDATE,
PRIMARY KEY (board_no)
);
create sequence aopBoard_seq
start with 1
increment by 1;
=====================
==보안
======================
CREATE TABLE securitymember (
    user_no NUMBER,
    user_id VARCHAR2(50) NOT NULL,
    user_pw VARCHAR2(100) NOT NULL,
    user_name VARCHAR2(100) NOT NULL,
    coin NUMBER(10) DEFAULT 0,
    reg_date DATE DEFAULT sysdate,
    upd_date DATE DEFAULT sysdate,
    enabled CHAR(1) DEFAULT '1',
    primary key(user_no)
);
CREATE TABLE securitymember_auth
(user_no NUMBER NOT NULL,
auth VARCHAR2(50) NOT NULL
);
ALTER TABLE securitymember_auth ADD CONSTRAINT fk_securitymember_auth_user_no
FOREIGN KEY (user_no) REFERENCES securitymember(user_no);

create sequence securitymember_seq
start with 1
increment by 1;
--user_id: member0 user_pw: pwd0 user_id: member1 user_pw: pwd1
INSERT INTO securitymember(user_no, user_id, user_pw, user_name) VALUES
(securitymember_seq.NEXTVAl,
'member0','$2a$10$ohA1zfwg.el0qEbcUisAtOwfEM/Q0XikaQqzLF4RLvvlQBHjNhkUG','회원 0');
INSERT INTO securitymember(user_no, user_id, user_pw, user_name) VALUES
(securitymember_seq.NEXTVAl,
'member1','$2a$10$0YeNJZi0ZpHNJ962vF4KbOPbiiAW/FWaIOu8PTypWyzKnqmHDXEbe','회원 1');
INSERT INTO securitymember(user_no, user_id, user_pw, user_name) VALUES
(securitymember_seq.NEXTVAl,
'member2','$2a$10$q8SAiCddta4vsxze3klZKOWWLoo1qwgwTQ7MdBcN3ZV8oL435vszm','회원 2');
INSERT INTO securitymember(user_no, user_id, user_pw, user_name) VALUES
(securitymember_seq.NEXTVAl,
'admin3','$2a$10$tu7hm6.6uYkcvMi//ol9A.gLeyGFwezZmtlSnvgUeBhgZ1UaSN1CG','관리자 3');
INSERT INTO securitymember(user_no, user_id, user_pw, user_name) VALUES
(securitymember_seq.NEXTVAl,
'admin4','$2a$10$SAipGDDRGkCStRyrao.pPeseuMoeBFiifUH0RAFDyyb.p/WG59zuS','관리자 4');
INSERT INTO securitymember_auth (user_no, auth) VALUES ((SELECT user_no FROM securitymember
WHERE user_id = 'member0'),'ROLE_MEMBER');
INSERT INTO securitymember_auth (user_no, auth) VALUES ((SELECT user_no FROM securitymember
WHERE user_id = 'member1'),'ROLE_MEMBER');
INSERT INTO securitymember_auth (user_no, auth) VALUES ((SELECT user_no FROM securitymember
WHERE user_id = 'member2'),'ROLE_MEMBER');
INSERT INTO securitymember_auth (user_no, auth) VALUES ((SELECT user_no FROM securitymember
WHERE user_id = 'admin3'),'ROLE_ADMIN');
INSERT INTO securitymember_auth (user_no, auth) VALUES ((SELECT user_no FROM securitymember
WHERE user_id = 'admin4'),'ROLE_ADMIN');
commit;
truncate table securitymember_auth;
select * from securitymember_auth;
select * from securitymember;

==============================
CREATE TABLE persistent_logins (
username VARCHAR2(64) NOT NULL,
series VARCHAR2(64) NOT NULL,
token VARCHAR2(64) NOT NULL,
last_used DATE NOT NULL,
PRIMARY KEY (series)
);