-- [�Ǹſ� �����ͺ��̽�]
-- 1. chapter03-12���� ���� ���̺� �������� ����
-- 2. ��� �Ǹſ��� �̸��� �޿��� ���̽ÿ�. ��, �ߺ����� �����Ѵ�
select distinct name, salary from sales_person;
-- 3. sales_person�� ������ ����
insert into sales_person values('���Ǹ�1', 31, 3001);
insert into sales_person values('���Ǹ�2', 32, 3002);
insert into sales_person values('���Ǹ�3', 33, 3003);
insert into sales_person values('���Ǹ�4', 34, 3004);
insert into sales_person values('���Ǹ�5', 35, 3005);

-- ���̰� 30�� �̸��� �Ǹſ��� �̸��� ���̽ÿ�
insert into sales_person values('���Ǹ�6', 26, 2006);
insert into sales_person values('���Ǹ�7', 27, 2007);
select name from sales_person where age < 30;


-- 4. 'S'�� ������ ���ÿ� ��� ���� �̸��� ���̽ÿ�
select name from sales_customer where city like '%s';
insert into sales_customer values('���1', 'New York', '���ǰŷ���');
insert into sales_customer values('���2', 'Los Angeles', 'movie star');
insert into sales_customer values('���3', 'chicago', 'pizza owner');
insert into sales_customer values('���4', 'Houston', 'farmer');
insert into sales_customer values('���5', 'Phoenix', 'pilot');

-- 5. �ֹ��� �� ���� ��(���� �ٸ� ����)�� ���Ͻÿ�
select count(distinct custname) from sales_order;
insert into sales_order values(1, '���1', '���Ǹ�1', 1001);
insert into sales_order values(2, '���2', '���Ǹ�1', 1001);
insert into sales_order values(3, '���2', '���Ǹ�2', 1001);
insert into sales_order values(4, '���3', '���Ǹ�3', 1001);
insert into sales_order values(5, '���4', '���Ǹ�4', 1001);

-- 6. �Ǹſ� ������ ���Ͽ� �ֹ��� ���� ����Ͻÿ�
select salesperson, count(*) from sales_order group by salesperson;

-- 7. 'LA'�� ��� �����κ��� �ֹ��� ���� �Ǹſ��� �̸��� ���̸� ���̽ÿ�
-- (�μ����� ���)
-- sales_customer ���̺��� �⺻Ű�� onumber �Ӽ����� ����
select * from sales_person where name in 
(select salesperson from sales_order 
where custname in (select name from sales_customer where city = 'LA'));

insert into sales_customer values('���6', 'LA', '����6');
insert into sales_customer values('���7', 'LA', '����7');
insert into sales_order values(6, '���6', '���Ǹ�1', 1006);
insert into sales_order values(7, '���6', '���Ǹ�1', 1007);
insert into sales_order values(8, '���6', '���Ǹ�3', 1008);

-- 8. LA�� ��� �����κ��� �ֹ��� ���� �Ǹſ��� �̸��� ���̸� ���̽ÿ�
-- (������ ���)
select distinct(p.name), p.age from sales_customer c, sales_order o, sales_person p
where c.name=o.custname and p.name = o.salesperson and c.city like 'LA';

-- 9. �� �� �̻� �ֹ��� ���� �Ǹſ��� �̸��� ���̽ÿ�
select salesperson from sales_order
group by salesperson having count(*)>=2;

-- 10. �Ǹſ� TOM�� ������ 45,000������ �����ϴ� SQL���� �ۼ��Ͻÿ�
insert into sales_person values('TOM', 38, 2008);
update sales_person set salary = 45000 where name like 'TOM';
select * from sales_person where name like 'TOM';



