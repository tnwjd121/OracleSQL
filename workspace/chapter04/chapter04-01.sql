-- SQL ���
-- 01 �����Լ�
-- sql ���� �Լ�
-- sql ���� �Լ��� ������ ���� select���� where��, update����� ��� ����� �� �ִ�
-- select �Լ���(����1, ����2, ...)
-- from ���̺� �̸� 
-- where ���̸� = �Լ���(����1, ����2, ...);
-- update ���̺� �̸�
-- set ���̸� = �Լ���(����1, ����2...);

-- ����Ŭ���� �����ϴ� ���� �Լ�
-- ���� �Լ�
-- sql�������� ������ �⺻���� ��Ģ ������(+,-,*,/)�� ������ (%)������ ��ȣ�� �״�� ����Ѵ�
-- ��Ģ ������ �ܿ��� ���� �����ڰ� �ִ�
-- �̷��� ������ �߿� ���󵵰� ���� ���� ���� �Լ� ���·� �����Ѵ�
-- abs�Լ� - ������ ���� ���
-- -78�� +78�� ������ ���Ͻÿ�
select abs(-78), (+78)
from dual;

-- from������ dual���̺�
-- dual ���̺��� ������ �����ϴ� ���̺��� �ƴ϶� ����Ŭ����
-- �Ͻ����� ���� �۾��� ����ϱ� ���� ���� ������ ���̺��̴�

-- round �Լ�(����, m) �Լ� - m�ڸ��� �������� ���� �ݿø�
-- 4.875�� ���� ù° �ڸ����� �ݿø��� ���� ���ϱ�
select round(4.875,1)
from dual;

-- ���� �Լ��� ����
-- ���ڿ� ���� ��� ���̸��� ����� �� �ְ� ���� �Լ��� ���������� ����� ���� �ִ�
-- ���� ��� �ֹ� �ݾ��� ��� ������ �ݿø��� ���� ���Ͻÿ�
select custid "�� ��ȣ", round(sum(saleprice)/count(*),-2) ��ձݾ� from orders group by custid;

-- ���� �Լ�
-- ���� ������ Ÿ���� ������ ����� ��ȯ�Ѵ�.
-- replace(s1,s2,s3) �Լ� ����ڿ�(s1)�� ������ ���ڸ�(s2)
-- ���ϴ� ����(s3)�� ����
-- ���� ���� �߱��� ���Ե� ������ '��'�� ���� �� ���� ����� ���̼���
select bookid, replace(bookname, '�߱�', '��') bookname, publisher, price from book;

-- legnth(s) �Լ� - ��� ���ڿ��� ���� ���� ��ȯ
-- length - ������ ��                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
-- �½��������� ������ ������ ����� ������ ����, ����Ʈ ���� ���̽ÿ�
select bookname, length(bookname), lengthb(bookname)from book where publisher = '�½�����';

-- substr(s,n,k) �Լ� - ��� ���ڿ��� ������ �ڸ��������� ������ ���̸�ŭ �߶� ��ȯ
-- ���缭���� �� �߿��� ���� ��(last name)�� ���� ����� ����̳� �Ǵ��� ���� �ο����� ���Ͻÿ�
select substr(name,1,1), count(*) from customer group by substr(name, 1,1);
insert into customer values(5,'�ڼ���', '���ѹα� ����', null);

-- ��¥ �ð� �Լ�
-- ��¥ �ð� �Լ��� ����
-- to _date(char)
-- char - ���ڳ� ���ڿ�
-- to_date(char, datetime)
-- ������ (char) ����Ʈ�� date������ ��ȯ
-- to_char(date, datetime)
-- date�� �����͸� ���ڿ�(varchar2)�� ��ȯ
-- add_months(date, ����)
-- ��¥�� ������ ���� ���� date������ ��ȯ(1: ������, -1: ������)
-- last_day(date)
-- ��¥�� ���� ������ ���� date������ ��ȯ
-- sysdate
-- dbms �ý��� ���� ���� ��¥�� date������ ��ȯ�ϴ� ���ڰ� ���� �Լ�

-- ���缭���� �ֹ��Ϸκ��� 10�� �� ������ Ȯ���Ѵ�, �� �ֹ��� Ȯ�����ڸ� ���Ͻÿ�
select orderid, orderdate+10 from orders;
-- ��¥�� �����ʹ� -��+�� ����Ͽ� ���ϴ� ��¥�κ��� ������ ���ĸ� ����� �� �ִ�

-- dbms ������ ������ ���� ��¥�� �ð�, ������ Ȯ���Ͻÿ�
-- sysdate�Լ��� �����ͺ��̽��� ������ ���� ��¥�� �ð��� ��ȯ
-- systimestamp �Լ��� ���� ��¥, �ð��� �Բ� �� ������ �ð��� ������
-- timezone���� ����� �ش�
select sysdate, to_char(sysdate, 'yyy/mm/dd/ dy hh24:mi:ss') from dual;

select * from orders;
insert into orders values(12,1,1,6000,sysdate);

-- null �� ó��
-- null ���� ���� ����� ���� �Լ�
-- ���� �Լ��� ����� ���� null ���� ���Ե� �࿡ ���� ���ǻ���
-- 1. null + ���� ������ ����� null�̴�
-- 2. ���� �Լ��� ����� �� null�� ���Ե� ���� ���迡�� ������
-- 3. ���� �Լ��� ����Ǵ� ���� �ϳ��� ������, sum, avg �Լ�
-- sum, avg �Լ��� ����� null�� �ǰ�, count �Լ��� ����� 0�̴�

create table mybook(
    bookid number primary key,
    price number
);

insert into mybook values(1,1000);
insert into mybook values(2,2000);
insert into mybook values(3,null);
select * from mybook;

-- 1. null+���� ������ ����� null�̴�
select price + 100 from mybook where bookid=3;
-- 2. ���� �Լ��� ����� �� null�� ���Ե� ���� ���迡�� ������
select count(*), count(price), sum(price), avg(price) from mybook;
-- 3. ���� �Լ��� ����Ǵ� ���� �ϳ��� ������, sum, avg �Լ� sum, avg �Լ��� ����� null�� �ǰ�, count �Լ��� ����� 0�̴�
select sum(price), avg(price), count(*)
from mybook where bookid >=4;

-- null ���� Ȯ���ϴ� ��� - is null, is not null
-- mybook ���̺��� price�� null �� ã��
select * from mybook where price is null;
-- mybook ���̺��� price�� null�� �ƴ� �� ã��
select * from mybook where price is not null;

-- nvl �Լ�
-- nvl �Լ��� null ���� �ٸ� ������ ��ġ�Ͽ�
-- �����ϰų� �ٸ� ������ ���
-- null ���� ������ �ٸ� ������ ������ �� �ִ�
-- nvl(�Ӽ�, ��) �������� ���
-- �Ӽ��� null���̸� ������ ��ġ�Ѵ�
-- �̸�, ��ȭ��ȣ�� ���Ե� ������� ���̽ÿ�
-- ��, ��ȭ��ȣ�� ���� ���� '����ó����'���� ǥ���Ͻÿ�
select * from customer;
select name, nvl(phone, '����ó����') from customer; 

-- rownum ����
-- ����Ŭ ���������� �����Ǵ� ���� �÷����� sql ��ȸ ����� ������ ��Ÿ����

-- ����Ͽ��� ����ȣ, �̸�, ��ȭ��ȣ�� ���� �� �� ���̽ÿ�
select rownum, custid, name, phone from customer
where rownum <=2;

-- rownum ��� �� ���ǻ���
-- �����ټ����� ������ ����Ͽ��� ����ȣ, �̸�, ��ȭ��ȣ��
-- ���� �� �� ���̽ÿ�
select rownum, custid, name, phone
from customer
where rownum <=2
order by name;

-- ����Ŭ�� select�� ó������
-- 1. from customer - customer ���̺��� �о� ����
-- 2. where rownum <=2 - ����Ŭ�� �����͸� ���� ������� �� �� ���� ����
-- 3. select rownum. custid, name, phone - �Ӽ� ���� ����
-- 4. order by name - �̸������� ����

-- �μ����Ǹ� ���
select rownum ����, custid, name, phone
from (select custid, name, phone from customer order by name)
where rownum <= 2;


