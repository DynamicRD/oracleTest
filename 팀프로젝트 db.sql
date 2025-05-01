CREATE TABLE users (
    id number(6) primary key,   -- 회원 고유 ID
    email VARCHAR2(255) UNIQUE,              -- 이메일 (중복 불가)
    name VARCHAR2(20),                      -- 이름 (옵션)
    profile_image_url VARCHAR2(255),         -- 프로필 이미지 URL (옵션)
    provider VARCHAR2(50),                   -- OAuth 제공자 (google, naver 등)
    provider_id VARCHAR2(255),               -- OAuth 제공자의 고유 ID
    password VARCHAR2(255),                  -- 비밀번호 (선택 사항)
    regdate date DEFAULT sysdate  -- 가입일
);