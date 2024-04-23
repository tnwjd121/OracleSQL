-- 극장 데이터베이스
-- 극장
create table cinema(
    cinemaid number primary key,
    cinemaname varchar2(20),
    place varchar2(20)
);

-- 상영관
create table screeninghall(
    cinemaid number,
    hallid number check (hallid>=1) check(hallid<=10),
    moviename varchar2(20),
    price number check(price<20000),
    seat number unique,
    primary key(cinemaid, hallid)
);

create table reservation(
    cinemaid number,
    hallid number,
    customerid number,
    seat number,
    movieday date,
    primary key(cinemaid, hallid, customerid) 
);

-- 고객
create table moviecustomer(
    customerid number primary key,
    name varchar2(20),
    address varchar2(20)
);

-- 데이터 삽입(오라클에서는 데이터 여러개 삽입 불가능)
insert into cinema values(1,'롯데', '잠실');
insert into cinema values(2,'메가', '강남');
insert into cinema values(3,'대한', '잠실');
select * from cinema;

insert into screeninghall values(1, 1,'어려운 영화', 15000, 48);
insert into screeninghall values(3, 1,'멋진 영화', 7500, 120);
insert into screeninghall values(3, 2,'재밌는 영화', 8000, 110);
select * from screeninghall;

insert into reservation values(3, 2, 3, 15, '2020-09-01');
insert into reservation values(3, 1, 4, 16, '2020-09-01');
insert into reservation values(1, 1, 9, 48, '2020-09-01');
select * from reservation;

insert into moviecustomer values(3, '홍길동', '강남');
insert into moviecustomer values(4, '김철수', '잠실');
insert into moviecustomer values(9, '박영희', '강남');
select * from moviecustomer;

-- 단순질의
-- 1. 모든 극장의 이름과 위치를 보이시오
select * from cinema;
-- 2. 잠실에 있는 극장을 보이시오
select * from cinema where place = '잠실';
-- 3. 잠실에 사는 고객의 이름을 오름차순으로 보이시오
select * from moviecustomer where address = '잠실' order by name;
-- 4. 가격이 8000원 이하인 영화의 극장번호, 상영관번호, 영화제목
select cinemaid, hallid, moviename from screeninghall where price<=8000;
-- 5. 극장 위치와 고객의 주소가 같은 고객을 보이시오
select c.cinemaname,c.place, mc.name
from cinema c, moviecustomer mc
where c.place = mc.address;

-- 집계질의
-- 1. 극장의 수는 몇개인가?
select count(cinemaname) from cinema;
-- 2. 상영되는 영화의 평균 가격은 얼마인가?
select avg(price) from screeninghall;
-- 3. 2020년 9월 1일에 영화를 관람한 고객의 수는 얼마인가?
select count(cinemaid) from reservation where movieday = '2020-09-01';

-- 부속질의와 조인
-- 1. 대한 극장에서 상영된 영화제목을 보이시오
select s.moviename
from screeninghall s
    left outer join cinema c on s.cinemaid = c.cinemaid
where c.cinemaname = '대한';
-- 2. 대한 극장에서 영화를 본 고객의 이름을 보이시오
select mc.name
from cinema c
    left outer join reservation r on c.cinemaid = r.cinemaid
    left outer join moviecustomer mc on r.customerid = mc.customerid
where c.cinemaname = '대한';
-- 3. 대한극장의 전체 수입을 보이시오
select sum(s.price)
from screeninghall s
    left outer join cinema c on s.cinemaid = c.cinemaid
where c.cinemaname = '대한';
-- 그룹질의
-- 1. 극장별 상영관 수를 보이시오
select c.cinemaname, count(s.cinemaid)
from screeninghall s
    left outer join cinema c on s.cinemaid = c.cinemaid
group by c.cinemaname;
-- 2. 잠실에 있는 극장의 상영관을 보이시오
select c.place, count(s.cinemaid)
from screeninghall s
    left outer join cinema c on s.cinemaid = c.cinemaid
group by c.place;
--3. 2020년 9월 1일의 극장별 평균 관람 고객 수를 보이시오
select c.cinemaname, count(r.cinemaid)
from reservation r
    left outer join cinema c on r.cinemaid = c.cinemaid
where r.movieday = '2020-09-01'
group by c.cinemaname;
-- 4. 2020년 9월 1일에 가장 많은 고객이 관람한 영화를 보이시오
select s.moviename , count(s.moviename)
from reservation r
    left outer join screeninghall s on r.cinemaid = s.cinemaid
    and r.hallid = s.hallid
where r.movieday = '2020-09-01'
group by s.moviename;
-- DML
-- 영화의 가격을 10%씩 인상하시오
update screeninghall
set price = price *1.1;

-- 판매원 데이터베이스
create table salesperson(
    name varchar2(20) primary key,
    age number,
    salary varchar2(20)
);
create table salecustomer(
    name varchar2(20) primary key,
    city varchar2(20),
    industrytype varchar2(20) -- 직업
);
create table ordersale(
    id number,
    custname varchar(20),
    salesperson varchar(20),
    amount number,
    foreign key(custname) references salecustomer(name) on delete cascade,
    foreign key(salesperson) references salesperson(name) on delete cascade
);

-- 데이터 삽입
insert into salesperson values('Tom', '26', 10000);
insert into salesperson values('Roy', '32', 15000);
insert into salesperson values('Sally', '24', 9000);
insert into salesperson values('Nancy', '29', 7000);
insert into salesperson values('Clara', '40', 8500);
select * from salesperson;

insert into salecustomer values('Mary', 'LA', '개발자');
insert into salecustomer values('Carrie', 'LA', '요리사');
insert into salecustomer values('IU', 'KR', '가수');
insert into salecustomer values('Diane', 'LA', '개발자');
insert into salecustomer values('Grace', 'DE', '요리사');
insert into salecustomer values('Nancy', 'MX', '교육자');
insert into salecustomer values('Frank', 'US', '교육자');
select * from salecustomer;

insert into ordersale values(1, 'Mary','Tom', 1000);
insert into ordersale values(2, 'IU','Sally', 2000);
insert into ordersale values(3, 'Diane','Nancy', 3000);
insert into ordersale values(4, 'Grace','Roy', 4000);
insert into ordersale values(5, 'Nancy','Tom', 5000);
insert into ordersale values(6, 'Diane','Sally', 6000);
insert into ordersale values(7, 'Grace','Roy', 7000);
insert into ordersale values(8, 'Nancy','Nancy', 8000);
select * from ordersale;
-- 모든 판매원의 이름과 급여를 보이시오 중복행은 제거
select name, salary
from salesperson;
-- 나이가 30세 미만인 판매원이름
select name
from salesperson
where age<30;
-- s로 끝나는 도시에 사는 고객의 이름을 보이시오
select name, city
from salecustomer
where city like ('%S');
-- 주문을 한 고객의 수(서로 다른 고객만) 구하시오
select count(distinct custname)
from ordersale;
-- 판매원 각각에 대하여 주문의 수를 계산하시오
select salesperson, count(salesperson)
from ordersale
group by salesperson;
-- la사는 고객으로부터 주문을 받은 판매원의 이름과 나이를 보이시오(부속질의)
select name, age
from salesperson
where name in (
    select salesperson
    from ordersale
    where custname in (
        select name
        from salecustomer
        where city = 'LA'));
-- la사는 고객으로부터 주문을 받은 판매원의 이름과 나이를 보이시오(조인을 사용)
select sp.name, sp.age
from ordersale os
    left outer join salecustomer sc on sc.name = os.custname
    left outer join salesperson sp on sp.name = os.salesperson
where sc.city = 'LA';
-- 두 번 이상 주문을 받은 판매원의 이름을 보이시오
select sp.name, count(os.custname)
from ordersale os
    left outer join salecustomer sc on sc.name = os.custname
    left outer join salesperson sp on sp.name = os.salesperson
group by sp.name
having count(os.custname)>=2;
-- 판매원 tom의 봉급을 45000원으로 변경하는 sql문 작성하시오
update salesperson
set salary = 45000
where name = 'Tom';
select * from salesperson;

-- 기업 프로젝트 데이터베이스
-- 사원
create table employee(
    empno number primary key,
    name varchar(20),
    phoneno varchar(20),
    address varchar(20),
    sex varchar(20),
    position varchar(20),
    depton number
);

create table department(
-- 팀장
    deptno number primary key,
    deptname varchar(20),
    manager varchar(20)
);

create table project(
    projno number primary key,
    projname varchar(20),
    deptno number
);

create table works(
    empno number,
    projno number,
    hoursworked number,
    FOREIGN key (empno) REFERENCES employee(empno) on delete cascade,
    foreign key (projno) references project(projno) on delete cascade
);
-- 데이터 삽입
insert into Department values(1, '개발1팀', '홍길동');
insert into Department values(2, '개발2팀', '하윤');
insert into Department values(3, '서비스1팀', '진우');
insert into Department values(4, '서비스2팀', '하윤');
select * from Department;

insert into Project values(1, 'Admin Page Project', 1);
insert into Project values(2, 'Client Page Project', 2);
insert into Project values(3, 'Ad TV', 3);
insert into Project values(4, 'Ad Web', 4);
select * from Project;

insert into Employee values(1, '민준', '010-1234-1230', '서울', '남자', 'IT', 1);
insert into Employee values(2, '서준', '010-1234-1231', '부산', '남자', 'IT', 2);
insert into Employee values(3, '예준', '010-1234-1232', '울산', '여자', 'service', 3);
insert into Employee values(4, '도윤', '010-1234-1233', '김포', '남자', 'IT', 1);
insert into Employee values(5, '시우', '010-1234-1234', '서울', '여자', 'service', 4);
insert into Employee values(6, '주원', '010-1234-1235', '부산', '여자', 'IT', 2);
insert into Employee values(7, '하준', '010-1234-1236', '김포', '남자', 'service', 4);
insert into Employee values(8, '지호', '010-1234-1237', '울산', '여자', 'service', 3);
insert into Employee values(9, '지후', '010-1234-1238', '서울', '남자', 'IT', 1);
insert into Employee values(10, '준서', '010-1234-1239', '서울', '여자', 'IT', 2);
select * from Employee;

insert into Works values(1, 1, 10);
insert into Works values(2, 2, 2);
insert into Works values(3, 3, 40);
insert into Works values(4, 1, 20);
insert into Works values(5, 4, 11);
insert into Works values(6, 2, 5);
insert into Works values(7, 4, 9);
insert into Works values(8, 3, 4);
insert into Works values(9, 1, 4);
insert into Works values(10, 2, 12);
select * from Works;

-- 모든 사원의 이름을 보이시오
    select name
    from employee;
-- 여자 사원의 이름을 보이시오
    select name
    from employee
    where sex ='여자';
-- 팀장(manager)의 이름을 보이시오
    select manager
    from department;
-- it부서에서 일하는 사원의 이름과 주소를 보이시오
    select name, address
    from Employee
    where position = 'IT';
-- 홍길동 팀장부서에서 일하는 사원의 수를 보이시오
    select de.manager, count(em.name)
    from Department de
    left outer join Employee em on de.deptno=em.depton
    where de.manager = '홍길동'
    group by de.manager;
-- 사원들이 일한 시간 수를 부서별, 사원 이름별 오름차순으로 보이시오
    select em.position, em.name, wo.hoursworked
    from Employee em
    left outer join Works wo on em.empno = wo.empno
    order by em.position, em.name;
-- 2명 이상의 사원이 참여한 프로젝트의 번호, 이름 사원의 수를 보이시오
    select p.projno, p.projname, count(em.name)
    from Employee em
    left outer join Works wo on em.empno = wo.empno
    left outer join Project p on p.projno = wo.projno
    group by p.projno, p.projname
    having count(em.name)>=2
    order by p.projno;
    
-- 3명 이상의 사원이 있는 부서의 사원 이름을 보이시오
    select name
    from Employee
    where position in(
        select position
        from Employee
        group by position
        having count(name)>=3);

