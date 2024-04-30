-- 방탈출 정보
-- 지점(지점번호(기본키), 지점명, 위치)
-- 테마 종류(테마번호(기본키),지점번호(외래키), 테마이름, 장르, 난이도, 가격)
-- 직원(지점번호(외래키), 직원번호(기본키), 직원이름, 성별, 나이)
-- 고객(고객번호(기본키), 사용자이름, 성별, 나이)
-- 방문(방문번호(기본키), 테마번호(외래키), 고객번호(외래키),방문인원, 날짜, 직원번호(외래키))

create table escape_branch(
    bid number primary key,
    bname varchar2(20),
    baddr varchar2(20)
);

create table thema(
    tid number primary key,
    bid number,
    tname varchar2(20),
    tgenre varchar2(20),
    tlevel number,
    price number,
    foreign key (bid) references escape_branch(bid)
);


create table emp(
    bid number,
    eid number primary key,
    ename varchar2(20),
    esex varchar2(10),
    eage number,
    foreign key (bid) references escape_branch(bid)
);

create table customer (
    cid number primary key,
    cname varchar2(20),
    csex varchar2(10),
    cage number
);

create table  visit (
    vid number primary key,
    tid number,
    cid number,
    visitnum number,
    vdate date,
    eid number,
    foreign key (tid) references thema(tid),
    foreign key (cid) references customer(cid),
    foreign key (eid) references emp(eid)
);


-- 테마 정보 입력
-- 서면점
insert into thema values(1,1, '인형의 집', '공포', 2, 20000);
insert into thema values(2,1, '마술사의 집', '판타지', 1, 24000);
insert into thema values(3,1, '범인의 집', '스릴러', 5, 18000);
-- 경성대점
insert into thema values(4,2, '도굴꾼', '판타지', 5, 28000);
insert into thema values(5,2, '학교 괴담', '공포', 1, 17000);
insert into thema values(6,2, '어둠의 마법', '판타지', 4, 22000);
insert into thema values(7,2, '수상한 편의점', '스릴러', 3, 20000);
-- 해운대점
insert into thema values(8,3, '문명을 찾아라', '판타지', 4, 30000);
insert into thema values(9,3, '우체국 살인', '스릴러', 2, 23000);
-- 하단점
insert into thema values(10,4, '모험왕', '판타지', 3, 30000);
insert into thema values(11,4, '보물찾기', '판타지', 5, 26000);
insert into thema values(12,4, '좀비연구', '공포', 1, 24000);
-- 남포점
insert into thema values(13,5, '앨리스', '판타지', 2, 32000);
insert into thema values(14,5, '알리바바', '판타지', 5, 32000);

-- 직원 정보 입력
insert into emp values(1, 1, '강이준', '남', 21);
insert into emp values(1, 2, '도하준', '남', 20);

insert into emp values(2, 3, '유서아', '여', 21);
insert into emp values(2, 4, '이지아', '여', 22);

insert into emp values(2, 5, '이은우', '남', 20);
insert into emp values(3, 6, '정시아', '여', 23);
insert into emp values(3, 7, '김도현', '남', 27);

insert into emp values(4, 8, '김아윤', '여', 25);
insert into emp values(4, 9, '박서준', '남', 24);

insert into emp values(5, 10, '백아린', '여', 26);
insert into emp values(5, 11, '김선우', '남', 22);