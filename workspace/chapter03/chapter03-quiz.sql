-- ���缭���� ���� �䱸�ϴ� ���� ������ ���� sql���� �ۼ��Ͻÿ�
--(1) ������ȣ�� 1�� ������ �̸�
select bookname
from book
where bookid in(1);
--(2) ������ 20,000�� �̻��� ������ �̸�
select bookname
from book
where price >=20000;
--(3) �������� �ѱ��ž�
select sum(saleprice) "�ѱ��ž�"
from orders
where custid in (1);
--(4) �������� ������ ������ ���ǻ� ��
select count(distinct book.publisher)
from book book
    left outer join orders ord on book.bookid = ord.bookid
where ord.custid = 1;
--(5) �������� ������ ������ �̸�, ����, ������ �ǸŰ����� ����
select book.bookname, book.price, book.price - ord.saleprice as " ������ �ǸŰ��� ����"
from book book
    left outer join orders ord on book.bookid = ord.bookid
where ord.custid = 1;
--(6) �������� �������� ���� ������ �̸�
select book.bookname
from book book
    left outer join orders ord on book.bookid = ord.bookid
where ord.custid not in(1);


-- ���� ������ ��ڿ� �濵�ڰ� �䱸�ϴ� ���� ������ ���� sql���� �ۼ��Ͻÿ�
select * from book;
select * from orders;
select * from customer;
select * from imported_book;
--(1) ���缭�� ������ �Ѽ�
select count(bookname) "���� ����"
from book;
--(2) ���缭���� ������ ����ϴ� ���ǻ��� �Ѽ�
select count(DISTINCT publisher)
from book;
--(3) ��� ���� �̸�, �ּ�
select name, address
from customer;
--(4) 2020�� 7�� 4�� ~ 7�� 7�� ���̿� �ֹ����� ������ �ֹ���ȣ
select orderid
from orders
where orderdate between '2020-07-04' and '2020-07-07';
--(5) 2020�� 7�� 4�� ~ 7�� 7�� ���̿� �ֹ����� ������ ������ ������ �ֹ���ȣ
select orderid
from orders
where orderdate not between '2020-07-04' and '2020-07-07';
--(6) ���� '��'���� ���� �̸� �ּ�
select name, address
from customer
where name like '��%';
--(7) ���� '��'���̰� �̸��� '��'�� ������ ���� �̸��� �ּ�
select name, address
from customer
where name like '��_��';