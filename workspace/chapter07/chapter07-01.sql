-- commit���� rollback��
select * from customer;

-- �� ���̺��� 5�� ���� �����Ѵ�
delete from customer where custid = 5;
select * from customer;

-- �Ͻ������� �ݿ��� �����͸� ������Ű���� rollback ��ɾ ����Ѵ�
rollback;
select * from customer;

-- �ٽ� �� ���̺��� 5�� ���� �����Ѵ�
delete from customer where custid = 5;

-- commit ��ɾ�� �����ͺ��̽��� ���� �۾��� �ݿ����� ����
commit;

-- �ٽ� rollback ��ɾ� ���
rollback;
select * from customer;

-- commit�̶�� ��ɾ�� ���� commit �������� ����ƴ�
-- sql���� ������ �����ϴ� ��ɾ�
-- rollback ������ commit��ɾ������� �ǵ����� ��ɾ��Դϴ�

insert into customer values(5, '�ڼ���', '���ѹα� ����', null);


