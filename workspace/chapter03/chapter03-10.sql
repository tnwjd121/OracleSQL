-- ������ ���Ǿ� (DDL, data definition language)
-- ������ ���Ǿ�� ���̺��� ������ ����� create��
-- ������ �����ϴ� alter��, ������ �����ϴ� drop���� �ִ�
-- create��
-- create���� ����
-- create table ���̺� �̸�
-- ({�Ӽ��̸� ������ Ÿ��
-- (null|not null|unique|default �⺻��|checküũ����]
-- }
-- [primary key �Ӽ��̸�(��)]
-- [foreign key �Ӽ��̸� references ���̺��̸�(�Ӽ��̸�)]
--  [on delete{casecade|set null}]
-- )

-- ������ ���� �Ӽ��� ���� NewBook���̺��� �����Ͻÿ�.
-- �������� number�� ����ϸ� �������� ������ ����Ÿ���� varchar2�� ����Ѵ�
-- bookid(���� ��ȣ) -  number
-- bookname(�����̸�) - varchar2(20)
-- publisher(���ǻ�) - varchar2(20)
-- price(����) - number

-- ������ ������ Ÿ�� - char, varchar, varchar2
-- cahr(n) - n����Ʈ�� ���� ������ Ÿ���̴�
-- ����Ǵ� ������ ���̰� n���� ������ �������� �������� ä����
-- n����Ʈ�� ����� �����Ѵ�
-- ��) char(20)
-- varchar(n) - n����Ʈ�� ���� ������ Ÿ�������� ����Ǵ� ������ ���� ��ŭ�� �����Ҹ� �����ϴ� �������̴�
-- ��) varchar(20)
-- varchar2(n) -- varchar(n)Ÿ�԰� ������ ����Ŭ���� ����� ��õ

create table newbook(
    bookid number,
    bookname varchar2(20),
    publisher varchar2(20),
    price number
);

-- �⺻Ű�� ����
create table newbook(
    bookid number,
    bookname varchar2(20),
    publisher varchar2(20),
    price number,
    primary key(bookid)
);

drop table newbook;

-- �⺻Ű ���� 2��° ���
create table newbook(
    bookid number primary key,
    bookname varchar2(20),
    publisher varchar2(20),
    price number
);
-- �� ���� �Ӽ��� �⺻Ű�� ����
create table newbook(
    bookid number,
    bookname varchar2(20),
    publisher varchar2(20),
    price number,
    primary key(bookname, publisher)
);
-- ������� �߰�
-- bookname�� null ���� ���� �� ����, bublisher�� ���� ���� ������ �ȵȴ�.
-- price�� ���� �Էµ��� ���� ��� �⺻�� 10000�� �����Ѵ�
-- �� ������ �ּ� 1000�� �̻����� �Ѵ�
create table newbook(
    bookname varchar2(20) not null,
    publisher varchar2(20) unique,
    price number default 10000 check(price>1000),
    primary key (bookname, publisher)
    );
    
-- ������ ���� �Ӽ��� ���� NewCustomer ���̺��� �����Ͻÿ�
-- custid(����ȣ) - number, �⺻Ű
-- name(�̸�) - varchar2(40)
-- address(�ּ�) - varchar2(40)
-- phone(��ȭ��ȣ) - varchar2(30)

create table newcustomer(
    custid number primary key,
    name varchar2(40),
    address varchar2(40),
    phone varchar2(30));

    
-- ������ ���� �Ӽ��� ���� neworders ���̺��� �����Ͻÿ�
-- orderid(�ֹ���ȣ) - number, �⺻Ű
-- custid(����ȣ) - number, not null ��������
-- bookid(������ȣ) - number, not null ��������
-- saleprice(�ǸŰ���) - number
-- orderdate(�Ǹ�����) - date
create table neworders(
orderid number primary key,
custid number not null,
bookid number not null,
saleprice number,
orderdate date);

-- custid(����ȣ)- number, not null��������
-- �ܷ�Ű(newcustomer.custid, �������)
drop table neworders;

create table neworders(
orderid number,
custid number not null,
bookid number not null,
saleprice number,
orderdate date,
primary key(orderid),
foreign key(custid) references newcustomer(custid) on delete cascade
);
-- �ܷ�Ű ���������� ����� ���� ������ ��
-- �ݵ�� �����Ǵ� ���̺�(�θ� ���̺�)�� �����ؾ� �ϸ�
-- �����Ǵ� ���̺��� �⺻Ű���� �Ѵ�
-- �ܷ�Ű ���� �� on delete �ɼ�
-- cascade - ���� ����  
-- set null - null ������ �ٲ۴�
-- no action - �⺻������ ��� ���۵� ������ �ʴ´�
-- �Ӽ� ������ Ÿ�� ����
-- number(p,s) / �Ǽ��� p�ڸ� ���� �κ�, s�ڸ��� �Ҽ��κ�
-- p�� s�� �����Ͽ� number��� ���� number(8,2)�� ����ȴ�
-- char(n) / ������ ��������, ���ڸ� �����ϰ� ���� ������ �������� ä���
-- varchar2(n) / ������ ��������, 4000����Ʈ���� ����ȴ�
-- date / ��¥��, ����, ��, ��, �ð��� �����Ѵ�







