SELECT * FROM STUDENT;
DROP TABLE STUDENT;
DROP TABLE TRAINEE;
CREATE TABLE STUDENT(
    NO NUMBER(4),   --pk
    NAME VARCHAR2(20) NOT NULL,
    KOR NUMBER(4) NOT NULL,
    ENG NUMBER(4)NOT NULL,
    MAT NUMBER(4)NOT NULL,
    TOTAL NUMBER(4),
    AVE NUMBER(5,1),
    RANK NUMBER(4)
);

ALTER TABLE STUDENT ADD CONSTRAINT STUDENT_NO_PK PRIMARY KEY(NO);

DROP SEQUENCE STUDENT_NO_SEQ;
CREATE SEQUENCE STUDENT_NO_SEQ
START WITH 1
INCREMENT BY 1;

SELECT * FROM STUDENT;

-- 성적을 입력하면 총점과 평균이 자동 계산되어 입력되는 트리거
CREATE OR REPLACE TRIGGER STUDENT_INSERT_TRIGGER
BEFORE INSERT ON STUDENT
FOR EACH ROW
BEGIN
    :NEW.TOTAL := :NEW.KOR + :NEW.ENG + :NEW.MAT;
    :NEW.AVE := ROUND((:NEW.KOR + :NEW.ENG + :NEW.MAT) / 3, 1);
END;
/

-- 성적을 수정하면 총점과 평균이 같이 변하는 트리거
CREATE OR REPLACE TRIGGER STUDENT_UPDATE_TRIGGER
BEFORE UPDATE ON STUDENT
FOR EACH ROW
BEGIN
    :NEW.TOTAL := :NEW.KOR + :NEW.ENG + :NEW.MAT;
    :NEW.AVE := ROUND((:NEW.KOR + :NEW.ENG + :NEW.MAT) / 3, 1);
END;
/

-- 등수를 처리하는 저장 프로시저 생성
CREATE OR REPLACE PROCEDURE STUDENT_RANK_PROC
IS 
    VSTUDENT_RT STUDENT%ROWTYPE; 
    CURSOR C1 IS
    SELECT NO, RANK() OVER(ORDER BY TOTAL DESC) RANK FROM STUDENT ORDER BY TOTAL DESC; 
BEGIN
    FOR  VSTUDENT_RT IN C1 LOOP
        UPDATE STUDENT SET RANK = VSTUDENT_RT.RANK WHERE NO =  VSTUDENT_RT.NO; 
    END LOOP;
    COMMIT;
END;
/
drop table student;
EXECUTE STUDENT_RANK_PROC;
----------------------------------------
SELECT a.table_name, a.constraint_name, a.column_name, c.owner, c.r_owner, c_pk.table_name r_table_name, c_pk.constraint_name r_constraint_name
FROM all_cons_columns a
JOIN all_constraints c ON a.owner = c.owner
                       AND a.constraint_name = c.constraint_name
JOIN all_cons_columns c_pk ON c.r_owner = c_pk.owner
                            AND c.r_constraint_name = c_pk.constraint_name
WHERE c.constraint_type = 'R'
AND c_pk.table_name = 'STUDENT';