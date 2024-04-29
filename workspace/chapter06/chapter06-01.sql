-- summer ���̺��� �����ϰ� �����͸� ����
drop table summer;

create table summer(
    sid number,
    class varchar2(20),
    price number
);

insert into summer values(100, 'fortran', 20000);
insert into summer values(150, 'pascal', 15000);
insert into summer values(200, 'C', 10000);
insert into summer values(250, 'fortran', 20000);

select * from summer;

-- select���� �̿��� ��ȸ �۾�
-- �л��� �й� sid, �����ϴ� ������ class, ���� ������ ������� price
-- �����б⸦ ��� �л��� �й��� �����ϴ� ������?
select sid, class from summer;
-- �����ᰡ ���� ��� ������?
select distinct class from summer
where price = (select max (price) from summer);

-- ���� �̻�
-- 200�� �л��� �����б� ������û�� ����Ͻÿ�.
delete summer where sid = 200;
select * from summer;

-- c ���� ������ ��ȸ
select price "C ������" from summer where class ="C";

-- 200�� �л��� ������û�� ����Ͽ� ���� ������ ���� �Ͽ���
-- 200�� �л��� ������û�� �� ��� �Ǿ���
-- C������ �����Ḧ ��ȸ�� �� ���� �Ǿ���
-- �л��� ������û�� ����ϸ鼭 �����ᵵ �Բ� �����Ͽ��� �����̴�
-- ����  �̻��� �߻��Ͽ���

-- ���� �ǽ��� ���� 200�� �л� �ڷ� �ٽ� �Է�
insert into summer values(200, 'C', 10000);

-- �����̻�
-- �����б⿡ ���ο� �ڹ� ���¸� �����Ͻÿ�
-- �ڹ� ���� ����
insert into summer values(null, 'java', 25000);

-- ��ü ������ ��ȸ
select * from summer;

-- ������ �л��� �Ѽ��� ���Ͻÿ�
select count(*) from summer;
-- ������ �л��� �Ѽ��� 4���ε� 5��� ����� ���Դ�
-- ���̺��� �����Ͱ� ���� �� ��ü �����͸� �����ϰ� �ľ��Ͽ� sql ���� ������ �ϴ� ������ �ִ�.
select count(sid) from summer;
-- �����̻�

-- �ڹ� ���°� ���� �����Ǿ���
-- ������� 25000���̰� ���� ��û�� �л��� ����
-- �ڹ� ���¸� �߰��ϱ� ���� insert���� ����ϴµ�
-- ��û�� �л��� ���� �й����� null���� �ԷµǾ���
-- null ���� ���� �Լ� ��� �� ������ �ʴ� ����� ����� �´�

-- fortran ������ �����Ḧ 20000������ 15000������ �����Ͻÿ�
update summer set price = 15000 where class = 'fortran' and sid = 100;

-- fortran �����Ḧ ��ȸ
select price from summer where class = 'fortran';
-- �ΰ��� ��ȸ�Ǿ� ������ ����ġ ���� �߻�

-- �����̻�
-- fortran ������ �����ᰡ 20000������ 15000������ ����Ǿ� update���� �̿��Ͽ� �����Ͽ���
-- update���� ���ǿ� �´� ���� �ϰ� ����������, ������ �߸� �ָ� ������ ����ġ ������ �߻��Ѵ�

-- ������ �����б� ���� ���̺�
-- ���̺� ������ �����Ͽ� �̻������� �߻����� �ʵ��� �����
-- summer���̺��� summer_price�� summer_enroll���̺�� �и��Ѵ�
-- summer_price���̺��� ���� ���� ������ ������ ����
-- summer_enroll ���̺��� �л����� ������û ������ ����

drop table SummerPrice;
drop table SummerEnroll;

create table summerprice (
    class varchar(20),
    price integer
    );
    
insert into summerprice values('FORTRAN', 20000);
insert into summerprice values('PASCAL', 15000);
insert into summerprice values('C', 10000);

select * from summerprice;

-- ���ο� �ܾ ���յɶ� �Ϲ������� ���̺��̳� �Ӽ��̸��� _�� �����Ѵ�
-- ��) summer_price, summer_enroll

-- summerenroll ���̺� ����
create table summerenroll(
    sid integer,
    calss varchar(20)
);
insert into summerenroll values (100, 'fortran');
insert into summerenroll values (150, 'pascal');
insert into summerenroll values (200, 'c');
insert into summerenroll values (250, 'fortran');
select * from summerenroll;

-- 200�� �л��� �����б� ������û�� ����Ͻÿ�
-- c ���� ������ ��ȸ
select price from summerprice where class = 'C' or class = 'c';
-- �������
delete from summerenroll where sid = 200;
select * from summerenroll;
-- c���� ������ ��ȸ
select price from summerprice where class = 'C' or class = 'c';
-- �����̻� ����
-- 200�� �л��� ������û ��ҵ� �� ó�� �Ǿ��� 
-- ������� ������ ��Ÿ���� �ʾҴ�
-- c������ ������� ��ȸ �����ϴ�

-- �����б⿡ ���ο� �ڹ� ���¸� �����Ͻÿ�.
insert into summerprice values('java', 25000);
select * from summerprice;

-- �����̻� ����
-- ���� ��û�� �л��� ������, null���� �Է��� �ʿ䰡 ����
-- �����̻� �߻� ����

-- fortran ������ �����Ḧ 20000������ 15000������ �����Ͻÿ�
select * from summerprice;
update summerprice set price = 15000 where class = 'FORTRAN';
select price from summerprice where class = 'FORTRAN';
-- �����̻� ����
-- fortran ������ ������� �ϳ��� ����Ǿ� �����Ƿ� ���� �� 
-- �������� ����ġ�� ����� �ʿ䰡 ����

-- ���̺��� �и��� ���� �̻������� �ذ� �� �� �־���




    