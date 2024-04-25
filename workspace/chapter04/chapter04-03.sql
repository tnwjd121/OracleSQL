-- ��(view)
-- ���缭������ �ù� ����� �ϱ� ���� �ù迡 �ʿ��� ������ ����
-- �Ź� ������ ������ �����̳� �μ����Ǹ� �ϴ� ���� ����� ���ŷӴ�
-- �ù� ������ ����Ǿ� ������ ���߿� �����ϰ� ������ ��ȸ�� �� �ִ�
-- ��� �ϳ� �̻��� ���̺��� ���Ͽ� ���� ������ ���̺��̴�
-- select���� ���� ���� ���� ����� ������ ���̺�� �����Ͽ� ���� ���̺�ó�� ����� �� �ֵ��� ����
-- �����ͺ��̽� ��ü�̴�

-- ���� ����
-- �並 �����ϴ� ����
-- create view ���̸� [(���̸�[,....n])]
-- as <select ��> 

-- book���̺��� '�౸'��� ������ ���Ե� �ڷḸ ���� �ִ� �並 ������
select * from book where bookname like '%�౸%';
-- select ���� �̿��� �� ���ǹ��� �ۼ�
create view vw_book
as select *from book where bookname like '%�౸%';
-- vw_book�̶�� �䰡 �����Ǹ� �Ϲ� ���̺�ó�� ����� �� �ִ�
-- ��� ���� �����Ͱ� ����Ǵ� �� �ƴ϶� ���� ���ǰ� dbms�� ����Ǵ� ���̴�
-- book ���̺� '�౸'��� ������ ������ ������ ���� �߰��Ǹ�
-- �� ������ ���� �信�� ��Ÿ����
-- ���� �߰� �Ǵ� ���� �̸��� '�౸' ��� ������ ���ԵǾ� ���� ������ 
-- book ���̺��� ���������� �信���� ��Ÿ���� �ʴ´�

-- '�౸'��� ������ ���Ե� �ڷḦ ���̽ÿ�
select * from book where bookname like '%�౸%';
-- �並 �̿�
select * from vw_book;

-- �ּҿ� '���ѹα�'�� �����ϴ� ����� ������ �並 ����� ��ȸ�Ͻÿ�.
-- ���� �̸��� vw_customer�� �����Ͻÿ�
create view vw_customer
as select * from customer where address like '%���ѹα�%';
select * from vw_customer;

-- orders ���̺��� ���̸��� �����̸��� �ٷ� Ȯ���� �� �ִ� �並 ������ ��,
-- '�迬��' ���� ������ ������ �ֹ���ȣ, �����̸�, �ֹ����� ���̽ÿ�
select od.orderid, od.custid, cs.name,
    od.bookid, bk.bookname, od.saleprice, od.orderdate
from orders od, customer cs, book bk
where od.custid = cs.custid and od.bookid = bk.bookid;

create view vw_orders(orderid, cusitd, name, bookid, bookname, saleprice,orderdate)
as select od.orderid, od.custid, cs.name,
    od.bookid, bk.bookname, od.saleprice, od.orderdate
from orders od, customer cs, book bk
where od.custid = cs.custid and od.bookid = bk.bookid;

-- �迬�� ���� ������ ������ �ֹ���ȣ, �����̸�, �ֹ����� ���̽ÿ�
select orderid, bookname, saleprice from vw_orders
where name = '�迬��';


