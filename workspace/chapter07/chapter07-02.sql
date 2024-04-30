-- ���Ȱ� ����
-- �α��� ����� ����
-- �����ͺ��̽��� �����ϴ� �� ����ڴ� ����� ID�� ������ ������
-- ��й�ȣ�� ������ ���ȴ�

-- ���� ����
-- ��� ������ ���̺� ������ SQL���� ����ں��� �����ؼ� ������ �� �ִ� ������ ���� ���� �ȴ�

-- ���̺����̽��� �α��� ����� ����
-- ����Ŭ�� ������������ ������ ������ ���̺����̽� ������ ���ȴ�
-- ����Ŭ���� ���̺����̽��� ����� �ű� ����ڸ� �����Ͽ�
-- �Ҵ��ϴ� ������ ���캸��
-- ����Ŭ �����ϴ� USER�� system,sys�� �ֽ��ϴ�.

-- CDB, PDB
-- CDB�� �⺻������ DB�� �����Ǹ� default�� �����ϴ� cdb ��ü ������ 
-- ��) ����Ʈ
-- PDB�� ����� ��Ű��, ������ �ڵ�� ��Ÿ �����ͺ��̽� ���� ������Ʈ�� ��� �ִ� ������ ���� ��ü�̴�
-- �ϳ��� CDB�� ���� ���� PDB�� ���� �� �ִ�
-- ��) ����Ʈ ���� ������ �����ڸ� ����
-- cdb user�� c##�� �տ� �پ�� �Ѵ�

-- xe������ ��� xepd1�̶�� �̸����� pdb�� �����Ǿ� �ִ�

-- ���̺����̽� �����ϱ�
-- ���̺����̽��� ����Ŭ���� �����͸� ������ �� ����ϴ� 
-- ������ ��������� �ǹ��Ѵ�
-- �ڵ����� ��������� �ý��� ���̺����̽��� �ְ�
-- ����ڰ� �ʿ信 ���� ����� ����ϴ� ����� ���̺����̽��� �ִ�

-- ��) �����͸� ����ϱ� ���ؼ� ���

-- ��� ���̺����̽� ����
-- DBA(�ְ� ������) ������ �ο��� system �������θ� ������ �� �ִ�.
-- create tablespace ����
/*
    create tablespace ���̺����̽���
    datafile "����� ��� �� ����� ���ϸ�"
    size ���� ����
*/

-- 10m�� �뷮�� ���� ���̺� �����̽��� md_tbs,mb_test��
-- C:\Users\ITPS\Documents\dev\database\sqldeveloper\workspace\chapter07
-- ������ �����Ͻÿ�
-- �̶� ���������� �̸��� ���� md_tbs_data01.dbf, md_test_data01.dbf
-- (���� ��ġ�� ������ ������ �̸� �����ؾ� �Ѵ�)
create tablespace md_tbs1
datafile 'C:\Users\ITPS\Documents\dev\database\sqldeveloper\workspace\chapter07\md_tbs.data01.dbf'
size 10M;

create tablespace md_tbs
datafile 'C:\dev\md_tbs_data01.dbf'
size 10M;

create tablespace md_test
datafile 'C:\dev\md_test_data01.dbf'
size 10M;

--drop tablespace
-- ���̺� �����̽� ������ ����ϴ� ��ɾ�
-- ����
/*
    drop tablespace ���̺� �����̽���
    [including contents [and datafiles][cascade constraints]] 
*/

-- including contents : ���̺����̽��� ��� �����͸� �����Ѵ�
-- and datafiles : os���� �������� ������ ������ �����Ѵ�
-- (�� �ɼ��� ���ٸ� ���� ������ ������ �������� �ʴ´�)
-- cascade constranints : �ٸ� ���̺����̽��� ���̺�κ��� �����Ǵ� �������ǵ���� ��� �����Ѵ�

--md_test ���̺����̽��� ������ ���ϱ��� �����Ͽ� ��� �����Ͻÿ�
drop tablespace md_test including contents and datafiles;
-- �ű� ����� ���� �����ϱ�
-- create user
-- ����� ������ �����ϴ� ����̴�
-- ����
/*
create user [����� �̸�]
    indentified by [��й�ȣ]
    default tablespace [���̺����̽�];
*/

-- default tablespace�� �������� ������ ����Ŭ���� �⺻���� users ���̺����̽��� �Ҵ��Ѵ�

-- alter user
-- ��й�ȣ�� ���� ����� ������ ������ �����ϴ� ����̴�
-- ����
/*
    alter user [������̸�]
        identified by [��й�ȣ];
*/

-- drop user
-- ����� ������ �����ϴ� ����̴�.
-- casecade�� ����ϸ� ���� ������ ����ڰ� ������ ��� �����͸� ���� �����Ѵ�
--����
/*
    drop user [����� �̸�] casecade;
*/
-- ���ο� ����� mdguest�� �����Ͻÿ�. ��й�ȣ�� mdguest, 
-- ���̺� �����̽��� �⺻���� users�� �����Ѵ�
create user mdguest
    identified by mdguest;
    
-- ���ο� ����� mdguest2�� �����Ͻÿ�. ��й�ȣ�� mdguest2,
-- �׽�Ʈ�����̽��� �տ��� ������ md_tbs�� �����Ѵ�
create user mdguest2 identified by mdguest2
default tablespace md_tbs;

-- ���� ����
-- mdguest, mdguest2 ����ڿ��� �����ͺ��̽� ����(connect) ��
-- ���̺� ����(resource) ����, 
-- ���̺� �����̽��� ���������� ����� �� �ִ� ����(unlimited tablespace)�� �ο��Ͻÿ�
-- pdb1/system �������� ����
grant connect, resource, unlimited tablespace to mdguest;
grant connect, resource, unlimited tablespace to mdguest2;

-- ���� �㰡 - grant
-- grant ���� ��ü�� ������ �����ڰ� ��� ��ü�� ���� ������ 
-- �ٸ� ����ڿ��� �㰡�ϴ� ����̴�
-- ����
/*
    grant ���� [(�÷�[,...])][,...n]
        [on��ü]to{�����|��|public[,...n]}
        [with grant option]
*/
-- [,...n]�� �ݺ� ������ �ǹ��Ѵ�
-- ���� : �㰡�� ������ �����Ѵ�
-- alter, delete, execute, index, insert, references, select, update
-- �÷� : ��� ������ �ο��� ���̺��� �� �̸��� �����Ѵ�
-- ��ü : ��� ������ �ο��� ��ü�� �����Ѵ�. ��ü�� ���̺��̳� �� ���� ���Ѵ�
-- to �����: ����ڳ� ������ ������ ��(role)�� ������ �߰��� �� �ִ�
-- public�� ��� ����ڰ� ����� �� �ֵ��� ���������� ������ �ο��Ѵٴ� �ǹ�
-- with grant option : �㰡 ���� ������ �ٸ� ����ڿ��� �ٽ� �ο��� �� �ִ�

-- madang/madang ������ ����
create user madang identified by madang;
-- madang ����ڿ��� ���� �ο�
grant connect, resource, unlimited tablespace to madang;

commit;

-- pdb1_madnag �������� ����
CREATE TABLE Book (
bookid NUMBER(2) PRIMARY KEY,
bookname VARCHAR2(40),
publisher VARCHAR2(40),
price NUMBER(8)
);


INSERT INTO Book VALUES(1, '�౸�� ����', '�½�����', 7000);
INSERT INTO Book VALUES(2, '�౸�ƴ� ����', '������', 13000);
INSERT INTO Book VALUES(3, '�౸�� ����', '���ѹ̵��', 22000);
INSERT INTO Book VALUES(4, '���� ���̺�', '���ѹ̵��', 35000);
INSERT INTO Book VALUES(5, '�ǰ� ����', '�½�����', 8000);
INSERT INTO Book VALUES(6, '���� �ܰ躰���', '�½�����', 6000);
INSERT INTO Book VALUES(7, '�߱��� �߾�', '�̻�̵��', 20000);
INSERT INTO Book VALUES(8, '�߱��� ��Ź��', '�̻�̵��', 13000);
INSERT INTO Book VALUES(9, '�ø��� �̾߱�', '�Ｚ��', 7500);
INSERT INTO Book VALUES(10, 'Olympic Champions', 'Pearson', 13000);

select * from book;

CREATE TABLE Customer (
custid NUMBER(2) PRIMARY KEY,
name VARCHAR2(40),
address VARCHAR2(50),
phone VARCHAR2(20)
);
INSERT INTO Customer VALUES (1, '������', '���� ��ü��Ÿ', '000-5000-0001');
INSERT INTO Customer VALUES (2, '�迬��', '���ѹα� ����', '000-6000-0001');
INSERT INTO Customer VALUES (3, '��̶�', '���ѹα� ������', '000-7000-0001');
INSERT INTO Customer VALUES (4, '�߽ż�', '�̱� Ŭ������', '000-8000-0001');
INSERT INTO Customer VALUES (5, '�ڼ���', '���ѹα� ����', NULL);
select * from Customer;

CREATE TABLE Orders (
orderid NUMBER(2) PRIMARY KEY,
custid NUMBER(2) REFERENCES Customer(custid),
bookid NUMBER(2) REFERENCES Book(bookid),
saleprice NUMBER(8),
orderdate DATE
);
INSERT INTO Orders VALUES (1, 1, 1, 6000, TO_DATE('2020-07-01','yyyy-mm-dd'));
INSERT INTO Orders VALUES (2, 1, 3, 21000, TO_DATE('2020-07-03','yyyy-mm-dd'));
INSERT INTO Orders VALUES (3, 2, 5, 8000, TO_DATE('2020-07-03','yyyy-mm-dd'));
INSERT INTO Orders VALUES (4, 3, 6, 6000, TO_DATE('2020-07-04','yyyy-mm-dd'));
INSERT INTO Orders VALUES (5, 4, 7, 20000, TO_DATE('2020-07-05','yyyy-mm-dd'));
INSERT INTO Orders VALUES (6, 1, 2, 12000, TO_DATE('2020-07-07','yyyy-mm-dd'));
INSERT INTO Orders VALUES (7, 4, 8, 13000, TO_DATE('2020-07-07','yyyy-mm-dd'));
INSERT INTO Orders VALUES (8, 3, 10, 12000, TO_DATE('2020-07-08','yyyy-mm-dd'));
INSERT INTO Orders VALUES (9, 2, 10, 7000, TO_DATE('2020-07-09','yyyy-mm-dd'));
INSERT INTO Orders VALUES (10, 3, 8, 13000, TO_DATE('2020-07-10','yyyy-mm-dd'));
select * from Orders;

commit;

-- pdb1_madang �������� ����
-- mdguest���� book ���̺��� select������ �ο��Ͻÿ�
grant select, update on customer to mdguest with grant option;

-- public�� ��� ����ڿ��� ������ �ο��ϴ� ����̴�
-- orders���̺��� ��� ����ڰ� select�� �� �ֵ��� ������ �ο��Ͻÿ�
grant select on orders to public;

-- ���� ��� - revoke
-- grang������ �㰡�� ������ ���, ȸ���ϴ� ����̴�
-- ����
/*
    revoke ���� [(�÷�[,...n])[,...n]
        [on ��ü] from {�����|��|public[,...n]}
*/
-- mdguest���� �ο��� book���̺��� select������ ����Ͻÿ�
revoke select on book from mdguest;



