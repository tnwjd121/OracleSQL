-- ���� �����ͺ��̽�
-- ����
create table cinema(
    cinemaid number primary key,
    cinemaname varchar2(20),
    place varchar2(20)
);

-- �󿵰�
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

-- ��
create table moviecustomer(
    customerid number primary key,
    name varchar2(20),
    address varchar2(20)
);

-- ������ ����(����Ŭ������ ������ ������ ���� �Ұ���)
insert into cinema values(1,'�Ե�', '���');
insert into cinema values(2,'�ް�', '����');
insert into cinema values(3,'����', '���');
select * from cinema;

insert into screeninghall values(1, 1,'����� ��ȭ', 15000, 48);
insert into screeninghall values(3, 1,'���� ��ȭ', 7500, 120);
insert into screeninghall values(3, 2,'��մ� ��ȭ', 8000, 110);
select * from screeninghall;

insert into reservation values(3, 2, 3, 15, '2020-09-01');
insert into reservation values(3, 1, 4, 16, '2020-09-01');
insert into reservation values(1, 1, 9, 48, '2020-09-01');
select * from reservation;

insert into moviecustomer values(3, 'ȫ�浿', '����');
insert into moviecustomer values(4, '��ö��', '���');
insert into moviecustomer values(9, '�ڿ���', '����');
select * from moviecustomer;

-- �ܼ�����
-- 1. ��� ������ �̸��� ��ġ�� ���̽ÿ�
select * from cinema;
-- 2. ��ǿ� �ִ� ������ ���̽ÿ�
select * from cinema where place = '���';
-- 3. ��ǿ� ��� ���� �̸��� ������������ ���̽ÿ�
select * from moviecustomer where address = '���' order by name;
-- 4. ������ 8000�� ������ ��ȭ�� �����ȣ, �󿵰���ȣ, ��ȭ����
select cinemaid, hallid, moviename from screeninghall where price<=8000;
-- 5. ���� ��ġ�� ���� �ּҰ� ���� ���� ���̽ÿ�
select c.cinemaname,c.place, mc.name
from cinema c, moviecustomer mc
where c.place = mc.address;

-- ��������
-- 1. ������ ���� ��ΰ�?
select count(cinemaname) from cinema;
-- 2. �󿵵Ǵ� ��ȭ�� ��� ������ ���ΰ�?
select avg(price) from screeninghall;
-- 3. 2020�� 9�� 1�Ͽ� ��ȭ�� ������ ���� ���� ���ΰ�?
select count(cinemaid) from reservation where movieday = '2020-09-01';

-- �μ����ǿ� ����
-- 1. ���� ���忡�� �󿵵� ��ȭ������ ���̽ÿ�
select s.moviename
from screeninghall s
    left outer join cinema c on s.cinemaid = c.cinemaid
where c.cinemaname = '����';
-- 2. ���� ���忡�� ��ȭ�� �� ���� �̸��� ���̽ÿ�
select mc.name
from cinema c
    left outer join reservation r on c.cinemaid = r.cinemaid
    left outer join moviecustomer mc on r.customerid = mc.customerid
where c.cinemaname = '����';
-- 3. ���ѱ����� ��ü ������ ���̽ÿ�
select sum(s.price)
from screeninghall s
    left outer join cinema c on s.cinemaid = c.cinemaid
where c.cinemaname = '����';
-- �׷�����
-- 1. ���庰 �󿵰� ���� ���̽ÿ�
select c.cinemaname, count(s.cinemaid)
from screeninghall s
    left outer join cinema c on s.cinemaid = c.cinemaid
group by c.cinemaname;
-- 2. ��ǿ� �ִ� ������ �󿵰��� ���̽ÿ�
select c.place, count(s.cinemaid)
from screeninghall s
    left outer join cinema c on s.cinemaid = c.cinemaid
group by c.place;
--3. 2020�� 9�� 1���� ���庰 ��� ���� �� ���� ���̽ÿ�
select c.cinemaname, count(r.cinemaid)
from reservation r
    left outer join cinema c on r.cinemaid = c.cinemaid
where r.movieday = '2020-09-01'
group by c.cinemaname;
-- 4. 2020�� 9�� 1�Ͽ� ���� ���� ���� ������ ��ȭ�� ���̽ÿ�
select s.moviename , count(s.moviename)
from reservation r
    left outer join screeninghall s on r.cinemaid = s.cinemaid
    and r.hallid = s.hallid
where r.movieday = '2020-09-01'
group by s.moviename;
-- DML
-- ��ȭ�� ������ 10%�� �λ��Ͻÿ�
update screeninghall
set price = price *1.1;

-- �Ǹſ� �����ͺ��̽�
create table salesperson(
    name varchar2(20) primary key,
    age number,
    salary varchar2(20)
);
create table salecustomer(
    name varchar2(20) primary key,
    city varchar2(20),
    industrytype varchar2(20) -- ����
);
create table ordersale(
    id number,
    custname varchar(20),
    salesperson varchar(20),
    amount number,
    foreign key(custname) references salecustomer(name) on delete cascade,
    foreign key(salesperson) references salesperson(name) on delete cascade
);

-- ������ ����
insert into salesperson values('Tom', '26', 10000);
insert into salesperson values('Roy', '32', 15000);
insert into salesperson values('Sally', '24', 9000);
insert into salesperson values('Nancy', '29', 7000);
insert into salesperson values('Clara', '40', 8500);
select * from salesperson;

insert into salecustomer values('Mary', 'LA', '������');
insert into salecustomer values('Carrie', 'LA', '�丮��');
insert into salecustomer values('IU', 'KR', '����');
insert into salecustomer values('Diane', 'LA', '������');
insert into salecustomer values('Grace', 'DE', '�丮��');
insert into salecustomer values('Nancy', 'MX', '������');
insert into salecustomer values('Frank', 'US', '������');
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
-- ��� �Ǹſ��� �̸��� �޿��� ���̽ÿ� �ߺ����� ����
select name, salary
from salesperson;
-- ���̰� 30�� �̸��� �Ǹſ��̸�
select name
from salesperson
where age<30;
-- s�� ������ ���ÿ� ��� ���� �̸��� ���̽ÿ�
select name, city
from salecustomer
where city like ('%S');
-- �ֹ��� �� ���� ��(���� �ٸ� ����) ���Ͻÿ�
select count(distinct custname)
from ordersale;
-- �Ǹſ� ������ ���Ͽ� �ֹ��� ���� ����Ͻÿ�
select salesperson, count(salesperson)
from ordersale
group by salesperson;
-- la��� �����κ��� �ֹ��� ���� �Ǹſ��� �̸��� ���̸� ���̽ÿ�(�μ�����)
select name, age
from salesperson
where name in (
    select salesperson
    from ordersale
    where custname in (
        select name
        from salecustomer
        where city = 'LA'));
-- la��� �����κ��� �ֹ��� ���� �Ǹſ��� �̸��� ���̸� ���̽ÿ�(������ ���)
select sp.name, sp.age
from ordersale os
    left outer join salecustomer sc on sc.name = os.custname
    left outer join salesperson sp on sp.name = os.salesperson
where sc.city = 'LA';
-- �� �� �̻� �ֹ��� ���� �Ǹſ��� �̸��� ���̽ÿ�
select sp.name, count(os.custname)
from ordersale os
    left outer join salecustomer sc on sc.name = os.custname
    left outer join salesperson sp on sp.name = os.salesperson
group by sp.name
having count(os.custname)>=2;
-- �Ǹſ� tom�� ������ 45000������ �����ϴ� sql�� �ۼ��Ͻÿ�
update salesperson
set salary = 45000
where name = 'Tom';
select * from salesperson;

-- ��� ������Ʈ �����ͺ��̽�
-- ���
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
-- ����
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
-- ������ ����
insert into Department values(1, '����1��', 'ȫ�浿');
insert into Department values(2, '����2��', '����');
insert into Department values(3, '����1��', '����');
insert into Department values(4, '����2��', '����');
select * from Department;

insert into Project values(1, 'Admin Page Project', 1);
insert into Project values(2, 'Client Page Project', 2);
insert into Project values(3, 'Ad TV', 3);
insert into Project values(4, 'Ad Web', 4);
select * from Project;

insert into Employee values(1, '����', '010-1234-1230', '����', '����', 'IT', 1);
insert into Employee values(2, '����', '010-1234-1231', '�λ�', '����', 'IT', 2);
insert into Employee values(3, '����', '010-1234-1232', '���', '����', 'service', 3);
insert into Employee values(4, '����', '010-1234-1233', '����', '����', 'IT', 1);
insert into Employee values(5, '�ÿ�', '010-1234-1234', '����', '����', 'service', 4);
insert into Employee values(6, '�ֿ�', '010-1234-1235', '�λ�', '����', 'IT', 2);
insert into Employee values(7, '����', '010-1234-1236', '����', '����', 'service', 4);
insert into Employee values(8, '��ȣ', '010-1234-1237', '���', '����', 'service', 3);
insert into Employee values(9, '����', '010-1234-1238', '����', '����', 'IT', 1);
insert into Employee values(10, '�ؼ�', '010-1234-1239', '����', '����', 'IT', 2);
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

-- ��� ����� �̸��� ���̽ÿ�
    select name
    from employee;
-- ���� ����� �̸��� ���̽ÿ�
    select name
    from employee
    where sex ='����';
-- ����(manager)�� �̸��� ���̽ÿ�
    select manager
    from department;
-- it�μ����� ���ϴ� ����� �̸��� �ּҸ� ���̽ÿ�
    select name, address
    from Employee
    where position = 'IT';
-- ȫ�浿 ����μ����� ���ϴ� ����� ���� ���̽ÿ�
    select de.manager, count(em.name)
    from Department de
    left outer join Employee em on de.deptno=em.depton
    where de.manager = 'ȫ�浿'
    group by de.manager;
-- ������� ���� �ð� ���� �μ���, ��� �̸��� ������������ ���̽ÿ�
    select em.position, em.name, wo.hoursworked
    from Employee em
    left outer join Works wo on em.empno = wo.empno
    order by em.position, em.name;
-- 2�� �̻��� ����� ������ ������Ʈ�� ��ȣ, �̸� ����� ���� ���̽ÿ�
    select p.projno, p.projname, count(em.name)
    from Employee em
    left outer join Works wo on em.empno = wo.empno
    left outer join Project p on p.projno = wo.projno
    group by p.projno, p.projname
    having count(em.name)>=2
    order by p.projno;
    
-- 3�� �̻��� ����� �ִ� �μ��� ��� �̸��� ���̽ÿ�
    select name
    from Employee
    where position in(
        select position
        from Employee
        group by position
        having count(name)>=3);

