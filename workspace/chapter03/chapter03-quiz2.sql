-- 극장 데이터베이스
create table cinema(
    cinemaid number primary key,
    cinemaname varchar2(20),
    place varchar2(20)
);

create table screeninghall(
    cinemaid number,
    hallid number,
    moviename varchar2(20),
    price number,
    seat number,
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

create table moviecustomer(
    customerid number primary key,
    name varchar2(20),
    address varchar2(20)
);

-- 판매원 데이터베이스
create table salesperson(
    name varchar2(20) primary key,
    age number,
    salary varchar2(20)
);
create table salecustomer(
    name varchar2(20) primary key,
    city varchar2(20),
    industrytype varchar2(20)
);
create table ordersale(
    id number,
    custname varchar(20),
    salesperson varchar(20),
    amount number,
    foreign key(custname) references salesperson(name) on delete cascade,
    foreign key(salesperson) references salecustomer(name) on delete cascade
);

-- 기업 데이터 베이스
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