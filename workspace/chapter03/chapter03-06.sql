-- �� �� �̻��� ���̺��� sql ����
-- ��) �������� ������ ������ �̸�, ����, ������ �ǸŰ����� ����
-- sql�� ���� ���� ���̺��� �̿��Ͽ� �����ϴ� �� ���� ����� ����
-- 1. ����(join)
-- 2. �μ�����(subquery)
-- ���� 
-- �� ���� ���̺��� �����Ѵ�
-- ������ �� ���̺��� ���� �ٸ� ���̺��� �࿡ �����Ͽ�
-- �� �� �̻��� ���̺��� �����ϴ� �����̴�

-- customer ���̺��� orders ���̺�� ���� ���� ����
select *
from customer, orders;
-- ���� 5�� x �ֹ��� 10���̹Ƿ� �� 50���� ���̵ȴ�
select * from customer;
select * from orders;
-- ��) �������� custid�� 1�̹Ƿ� orders���̺��� custid�� 1�� �Ͱ� ����

-- ���� ���� �ֹ��� ���� �����͸� ��� ���̽ÿ�.
select *
from customer, orders
where customer.custid = orders.custid;

-- order by ���� �̿��Ͽ� ����
-- ���� ���� �ֹ��� ���� �����͸� ������ �����Ͽ� ���̽ÿ�
select *
from customer, orders
where customer.custid = orders.custid
order by customer.custid;

-- ������ ����ϸ� �� �� �̻��� ���̺��� �Ϻ� �����͸� ���� �� �ִ�
-- ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� �˻��Ͻÿ�.
select name, saleprice
from customer, orders
where coustomer.custid = orders.custid;

-- ������ �ֹ��� ��� ������ �� �Ǹž��� ���ϰ�, ������ �����Ͻÿ�
select name, sum (saleprice)
from customer, orders
where customer.custid = orders.custid
group by customer.name
order by customer.name;

-- �� �� �̻��� ���̺��� ������ ���� �ִ�
select * from orders;
-- ���� ������ �ֹ��� ������ �� ������ å �������� ��� ���̽ÿ�.
select * 
from customer, orders, book
where customer.custid=orders.custid and orders.bookid = book.bookid;

-- ���� �̸��� ���� �ֹ��� ������ �̸��� ���Ͻÿ�
select customer.name, book.bookname
from customer, orders, book
where customer.custid=orders.custid and orders.bookid = book.bookid;

-- ������ 20000���� ������ �ֹ��� ���� �̸��� ������ �̸��� ���Ͻÿ�
select customer.name, book.bookname
from customer, orders, book
where customer.custid=orders.custid and orders.bookid = book.bookid
    and book.price=20000;

-- ������ �������� ���� ���� �����Ͽ� ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� ���Ͻÿ�
-- ���� ����, �ܺ� ����
select customer.name, saleprice
from customer left outer join orders on customer.custid = orders.custid;

-- ���� ����
-- ���� ���� 
-- select <�Ӽ���>
-- from ���̺�1, ���̺�2
-- where <��������> and <�˻�����>
-- selcet <�Ӽ���>
-- from ���̺�1 inner join ���̺�2 on <��������>
-- where <�˻�����>

-- �ܺ� ����
-- select <�Ӽ���>
-- from ���̺�1 {left | right | full[outer]} join ���̺�2 on <���� ����>
-- where <�˻�����>

 -- ����Ŭ + ��ȣ�� �ܺ������� ������ �� �ִ�
 -- ���� �ܺ������� ��� (+) ��ȣ�� ���������� �����ʿ�
 -- ������ �ܺ������� ���(+) ��ȣ�� ���ʿ� ���δ�
 
 -- ������ �������� ���� ���� �����Ͽ� ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� ���Ͻÿ�
 select customer.name, saleprice
 from customer, orders
 where customer.custid = orders.custid(+);
 

