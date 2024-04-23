-- ������ ���۾� - ����, ����, ����
-- ���α׷��� �⺻ ��� CRUD - create, read, update, delete
-- ������� ���̺� ����(��)�� ����, ����, �����ϴ� ���

-- insert��
-- ���̺� ���ο� ������ �����ϴ� ����̴�

-- insert�� ����
-- insert into ���̺��̸�[(�Ӽ�����Ʈ)]
-- values (�� ����Ʈ)

--  book���̺� ���ο� ���� '������ ����'�� �����Ͻÿ�
-- ������ ������ �Ѽ����м������� �Ⱓ������ ������ 90000���̴�
select * from book;

insert into book(bookid, bookname, publisher, price)
values(11, '������ ����', '�Ѽ����м���', 90000);
-- ���ο� ������ ������ �� �Ӽ��� �̸��� ������ �� �ִ�
-- �̶� �������� �Է� ������ �Ӽ��� ������ ��ġ�ؾ� �Ѵ�
insert into book
values(12, '����������','�Ѽ����м���' , 900000);

-- �Ӽ��� �̸��� ������ �ٲٰ� �Ǹ� �������� ������ �ٲٸ� �ȴ�
insert into book(bookid, bookname,price,publisher)
values(13, '������ ����', 90000, '�Ѽ����м���');

-- �� ���� �Ӽ��� �Է��ؾ� �Ѵٸ� �ش�Ǵ� �Ӽ��� ����ϸ� �ȴ�

-- book���̺� ���ο� ���� '������ ����'�� �����Ͻÿ�
-- ������������ �Ѽ����м������� �Ⱓ������ ������ �����̴�
insert into book(bookid, bookname, publisher)
values(14, '����������', '�Ѽ����м���');

-- insert���� select���� ����Ͽ� �ۼ��� ���� �ִ�
-- �Ѳ����� ���� ���� ������ �����ϴ� ������� �뷮 ����(bulk insert)�̶�� �Ѵ�
-- ���Ե��� ��� (imported_book)�� book���̺� ��� �����Ͻÿ�
select * from imported_book;

insert into book(bookid, bookname, price, publisher)
select bookid, bookname, price, publisher
from imported_book;

select * from book;

-- ������ ���̽� �̸� ��Ģ
-- ���ο� �ܾ ���� �� �� �����(_)�� ���°� �Ϲ����̴�
-- improted_book
-- �����ͺ��̽� ���� ���̺귯������ importedBook ī�� ǥ������� �Ǿ� �ִ�
-- �̸��� ����ٷ� �ڵ� ��ȯ ����� ��κ� �ִ�

-- update��
-- Ư�� �Ӽ� ���� �����ϴ� ����̴�
-- update�� ����
-- update ���̺��̸�
-- set �Ӽ��̸� 1=��, 1[, �Ӽ��̸� 2= ��2, ..]
-- [where<�˻�����>];

-- customer ���̺��� ����ȣ�� 5�� ���� �ּҸ� '���ѹα� �λ�'���� �����Ͻÿ�
update customer
set address = '���ѹα� �λ�'
where custid = 5;

select * from customer;

-- update���� �ٸ� ���̺��� �Ӽ����� �̿��� ���� �ִ�
-- customer ���̺��� �ڼ��� ���� �ּҸ� �迬�� ���� �ּҷ� �����Ͻÿ�
update customer
set address =(select address from customer where name = '�迬��')
where name = '�ڼ���';

-- update�� �ۼ� �� ���ǻ���
update customer1
set address = '���ѹα� ����';
-- ��� ���� �ּҰ� ���ѹα� ����� �ٲ��
-- update���� �Ϲ������� Ư�� ���� �����ϹǷ� where���� �������� ���� �ؾ� �Ѵ�

-- delete��
-- ���̺� �ִ� ���� ������ �����ϴ� ����̴�
-- delete�� ���� 
-- delete from ���̺��̸�
-- [where �˻�����];
-- delete���� <�˻�����>�� �ش�Ǵ� ������ ����
-- <�˻�����>�� ������ ��� ������ �����Ѵ�.
-- delete���� where���ǹ��� �������� Ư�� ���� �ؾ� �Ѵ�

-- customer ���̺��� ����ȣ�� 5�� ���� ������ �� ����� Ȯ���Ͻÿ�.
delete from customer
where custid=5;

select * from customer;

-- ��� ���� �����Ͻÿ�
delete from customer;

-- ������ �߻� �ȴ�
-- orders ���̺��� customer.custid �Ӽ��� �ܷ�Ű�� �����ϰ� �ִ�
-- ������ �����ǰų� orders ���̺��� �����Ͱ� �������� ������
-- ������ ���� �ȴ�

