SELECT * FROM STUDENT;
DROP TABLE STUDENT1;
CREATE TABLE STUDENT1(
    NO NUMBER(4),   --pk
    NAME VARCHAR2(20) NOT NULL,
    KOR NUMBER(4) NOT NULL,
    ENG NUMBER(4)NOT NULL,
    MAT NUMBER(4)NOT NULL,
    TOTAL NUMBER(4),
    AVE NUMBER(5,1),
    RANK NUMBER(4)
);

ALTER TABLE STUDENT1 ADD CONSTRAINT STUDENT1_NO_PK PRIMARY KEY(NO);

DROP SEQUENCE STUDENT1_NO_SEQ;
CREATE SEQUENCE STUDENT1_NO_SEQ
START WITH 1
INCREMENT BY 1;

SELECT * FROM STUDENT;

-- 성적을 입력하면 총점과 평균이 자동 계산되어 입력되는 트리거
CREATE OR REPLACE TRIGGER STUDENT1_INSERT_TRIGGER
BEFORE INSERT ON STUDENT1
FOR EACH ROW
BEGIN
    :NEW.TOTAL := :NEW.KOR + :NEW.ENG + :NEW.MAT;
    :NEW.AVE := ROUND((:NEW.KOR + :NEW.ENG + :NEW.MAT) / 3, 1);
END;
/

-- 성적을 수정하면 총점과 평균이 같이 변하는 트리거
CREATE OR REPLACE TRIGGER STUDENT1_UPDATE_TRIGGER
BEFORE UPDATE ON STUDENT1
FOR EACH ROW
BEGIN
    :NEW.TOTAL := :NEW.KOR + :NEW.ENG + :NEW.MAT;
    :NEW.AVE := ROUND((:NEW.KOR + :NEW.ENG + :NEW.MAT) / 3, 1);
END;
/

-- 등수를 처리하는 저장 프로시저 생성
CREATE OR REPLACE PROCEDURE STUDENT1_RANK_PROC
IS 
    VSTUDENT1_RT STUDENT1%ROWTYPE; 
    CURSOR C1 IS
    SELECT NO, RANK() OVER(ORDER BY TOTAL DESC) RANK FROM STUDENT1 ORDER BY TOTAL DESC; 
BEGIN
    FOR  VSTUDENT1_RT IN C1 LOOP
        UPDATE STUDENT1 SET RANK = VSTUDENT1_RT.RANK WHERE NO =  VSTUDENT1_RT.NO; 
    END LOOP;
    COMMIT;
END;
/

EXECUTE STUDENT_RANK_PROC;

