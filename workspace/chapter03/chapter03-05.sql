-- ��������
-- ������ȣ�� 1�� ������ �̸�
select bookname
from book
where bookid = 1;

-- ������ 20000�� �̻��� ������ �̸�
select bookname
from book
where price>=20000;

-- �������� �� ���ž�
-- �� ��ȣ 1
select * from customer;
select sum(saleprice)
from orders
where custid = 1;

-- �������� ������ ������ ��
select bookid
from orders
where custid =1;
-- �������� ������ ������ ���̵� 1,2,3
select count(distinct publisher)
from book
where bookid in (1,2,3);

-- �������� ������ ���ǻ� ��
select count(distinct bookid)
from orders
where custid =1;

-- �������� ������ ������ �̸�, ����, ������ �ǸŰ����� ����
select *
from book
where bookid in (1,2,3);

select sum(price)
from book
where bookid in(1,2,3);

select sum(saleprice)
from orders
where custid =1;
--39000

-- ���缭�� ������ �� ����
select count(*)
from book;

-- ���缭���� ������ ����ϴ� ���ǻ��� �� ����
select count(distinct publisher)
from book;

-- ��� ���� �̸�, �ּ�
select name, address
from customer;

-- 2020�� 7�� 4��~7�� ���̿� �ֹ����� ������ �ֹ���ȣ
select *
from orders
where orderdate between '20200704' and'20200707';

-- 2020�� 7�� 4��~ 7�� 7�� ���̿� �ֹ����� ������ ������ ������ �ֹ���ȣ
select *
from orders
where orderdate not between '20200704' and'20200707';

-- ���� '��'���� ���� �̸��� �ּ�
select name, address
from customer
where name like '��%';

-- ���� '��'���̰� �̸��� '��'�� ������ ���� �̸��� �ּ�
select name, address
from customer
where name like '��%��';


