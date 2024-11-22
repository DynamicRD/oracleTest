create table subject( 
    no number, --pk, sequence
    num varchar2(2) not null, --학과번호 01,02,03,04,05
    name varchar2(24) not null --학과이름
); 

alter table subject add constraint subject_no_pk primary key(no);
alter table subject add constraint subject_num_uk unique (num);

create sequence subject_seq
start with 1
increment by 1;
--------------------------------------------------
create table student( 
    no number,                               --pk,seq
    num varchar2(8) not null,          --학번(년도학과번호)
    name varchar2(12) not null,      --이름
    id varchar2(12) not null,            --아이디
    passwd varchar2(12) not null,    --패스워드
    s_num varchar2(2) not null,       --학과번호(fk)
    birthday varchar2(8) not null,     --생년월일
    phone varchar2(15) not null,      --전화번호
    address varchar2(80) not null,   --주소
    email varchar2(40) not null,       --이메일   
    sdate date default sysdate         --등록일
); 
alter table student add constraint student_no_pk primary key(no);
alter table student add constraint student_id_uk unique(id);
alter table student add constraint student_num_uk unique(num);
alter table student add constraint student_subject_num_fk 
    foreign key(s_num) REFERENCES subject(num) on delete set null;
alter table student drop constraint student_subject_num_fk ; --기존 제약조건 제거

create sequence student_seq
start with 1
increment by 1;
----------------------------------------------------------
--lesson 과목
create table lesson( 
    no number,                              --pk seq 
    abbre varchar2(2) not null,         --과목 요약 
    name varchar2(20) not null   --과목이름
); 
alter table lesson add constraint lesson_no_pk primary key(no);
alter table lesson add constraint lesson_abbre_uk   unique(abbre);

create sequence lesson_seq 
start with 1  
increment by 1; 
-------------------------------------------------------
--trainee 수강신청
create table trainee( 
    no number,                                --pk seqeunce 
    s_num varchar2(8) not null,        --fk(student) 학생번호
    abbre varchar2(2) not null,         --fk(lesson) 과목요약 
    section varchar2(20) not null,      --전공,부전공,교양
    tdate date default sysdate           --수강신청일
); 

alter table trainee add constraint trainee_no_pk primary key(no);
alter table trainee add constraint trainee_student_s_num_fk 
    foreign key(s_num) REFERENCES student(num) on delete set null;
 alter table trainee add constraint trainee_lesson_abbre_fk 
    foreign key(abbre) REFERENCES lesson(abbre) on delete set null;
 
create sequence trainee_seq 
start with 1  
increment by 1; 