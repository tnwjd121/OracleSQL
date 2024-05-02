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

