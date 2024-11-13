--사용자 계정 만들기 (시스템 관리자 모드에서 진행해야함)
ALTER SESSION SET "_ORACLE_SCRIPT"=true;
DROP USER SHOPPINGMALL CASCADE; -- 기존 사용자 삭제
CREATE USER SHOPPINGMALL IDENTIFIED BY 123456 -- 사용자 이름: Model, 비밀번호 : 1234
    DEFAULT TABLESPACE USERS        --데이터 저장소
    TEMPORARY TABLESPACE TEMP;  --임시저장장소
GRANT connect, resource, dba TO SHOPPINGMALL; -- 권한 부여