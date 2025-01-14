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