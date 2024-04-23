--Documents\dev\database\workspace\chapter03\chapter03-14.sql

--���� ���� Ǯ��
--[���� ������ ���̽�]
-- 3-12���Ͽ� �ִ� ����, �󿵰�, ����, �� ���̺� ����
-- ������ ����
-- ���� ������
insert into theater values(1,'�Ե�','���');
insert into theater values(2,'�ް�','����');
insert into theater values(3,'����','���');
select * from theater;
-- �󿵰� ������
insert into cinema values(1,1,'����� ��ȭ',15000,48);
insert into cinema values(3,1,'���� ��ȭ',7500,120);
insert into cinema values(3,2,'��մ� ��ȭ',8000,110);
select * from cinema;
-- ���� ������
insert into reservation values(3,2,3,15,'2020-09-01');
insert into reservation values(3,1,4,16,'2020-09-01');
insert into reservation values(1,1,9,48,'2020-09-01');
delete reservation;
select * from reservation;
--�� ������
insert into movie_customer values(3,'ȫ�浿','����');
insert into movie_customer values(4,'��ö��','���');
insert into movie_customer values(9,'�ڿ���','����');

--(1) �ܼ�����
-- 1. ��� ������ �̸��� ��ġ�� ���̽ÿ�.
select ttname,ttlocation from theater;
-- 2. ��ǿ� �ִ� ������ ���̽ÿ�
select * from theater where ttlocation like '���';
-- 3. ��ǿ� ��� ���� �̸��� ������������ ���̽ÿ�.
select cusname from movie_customer
where cusaddr like '���' order by cusname;
-- 4. ������ 8000�� ������ ��ȭ�� �����ȣ, �󿵰���ȣ, ��ȭ������ ���̽ÿ�.
select ttid,cid,moviename from cinema
where movieprice<=8000;
-- 5. ���� ��ġ�� ���� �ּҰ� ���� ������ ���̽ÿ�.
select mc.cusname, t.ttlocation from movie_customer mc, theater t
where mc.cusaddr like t.ttlocation;
-- (2) ��������
-- 1. ������ ���� �� ���ΰ�
select count(*) from theater;
-- 2. �󿵵Ǵ� ��ȭ�� ��� ������ ���ΰ�?
select avg(movieprice) from cinema;
-- 3. 2020�� 9�� 1�Ͽ� ��ȭ�� ������ ���� ���� ���ΰ�?
select count(*) from movie_customer mc, reservation r
where mc.cusid=r.cusid and r.rdate='2020-09-01';
select * from reservation;

-- (3) �μ����ǿ� ����
-- 1. ���� ���忡�� �󿵵� ��ȭ������ ���̽ÿ�.
select moviename from cinema
where ttid like 
( select ttid from theater where ttname like '����');

--2. ���� ���忡�� ��ȭ�� �� ���� �̸��� ���̽ÿ�.
select mc.cusname 
from theater t, reservation r, movie_customer mc
where t.ttid=r.ttid and r.cusid=mc.cusid
and t.ttname like '����';
--3. ���� ������ ��ü ������ ���̽ÿ�.
select sum(c.movieprice)
from cinema c
where c.ttid in(
select r.ttid
from theater t ,reservation r
where t.ttid=r.ttid
and t.ttname like '����');

--(4)�׷�����
--1. ���庰 �󿵰� ���� ���̽ÿ�.
select ttid,count(*) from cinema
group by ttid;

--2. ��ǿ� �ִ� ������ �󿵰��� ���̽ÿ�.
select * from theater t, cinema c
where t.ttid=c.ttid and t.ttlocation like '���';

--3. 2020�� 9�� 1�Ͽ� ���庰 ���� ���� ���� ���̽ÿ�.
select count(cusid) from reservation
where rdate = '20-09-01'
group by rdate;

select * from reservation;

-- 4. 2020�� 9�� 1�Ͽ� ���� ���� ���� ������ ��ȭ�� ���̽ÿ�.
select * from reservation;



