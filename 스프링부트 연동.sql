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
    jdbcboard
WHERE
    board_no = 1;
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