-- 1. 영화관 테이블 생성
CREATE TABLE cinema (
    c_id number(8),                                             -- 영화관 ID pk
    name VARCHAR(100) NOT NULL,             -- 영화관 이름
    location VARCHAR(255) NOT NULL,         -- 영화관 위치
    ad_num number(3) NOT NULL                   -- 수용 가능 인원
);
alter table cinema add constraint cinema_c_id_pk primary key(c_id);


drop table movie;
-- 2. 영화 테이블 생성
CREATE TABLE movie (
    m_id number(8),                                            -- 영화 ID  pk
    title VARCHAR(100) NOT NULL,                  -- 영화 제목 uk
    genre VARCHAR(50),                                    -- 장르
    duration number(3),                                      -- 상영 시간 (분 단위)
    c_id number(8)                                              -- 영화관 ID fk
);
alter table movie add constraint movie_m_id_pk primary key(m_id);
alter table movie add constraint movie_title_uk unique(title);
alter table movie add constraint movie_c_id_fk foreign key(c_id) REFERENCES cinema(c_id) ON DELETE SET NULL;

-- 3. 관객 테이블 생성
CREATE TABLE audience (
    a_id number(8),                                     -- 관객 ID pk
    name VARCHAR(100) NOT NULL,      -- 관객 이름
    phone number(13),                                -- 전화 번호   uk
    c_id number(8)                                       -- 영화관 ID fk
);
alter table audience add constraint audience_a_id_pk primary key(a_id);
alter table audience add constraint audience_phone_uk unique(phone);
alter table audience add constraint audience_c_id_fk foreign key(c_id) REFERENCES cinema(c_id) ON DELETE SET NULL;

CREATE SEQUENCE AUDIENCE_a_ID_SEQ
START WITH 1
INCREMENT BY 1