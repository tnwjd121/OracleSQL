-- ��� ������Ʈ ������ ���̽�
-- chapter03-12���� ���� ���̺� �������� ����
-- 1. ���̺��� ����
-- 2. ��� ����� �̸��� ���̽ÿ�
select name from b_employee;
insert into b_employee values(1, '�����1', '010-1', '�ּ�1', 'm', '���1', 1); 
insert into b_employee values(2, '�����2', '010-2', '�ּ�1', 'm', '���1', 2); 
insert into b_employee values(3, '�����3', '010-3', '�ּ�3', 'f', '���1', 1);
insert into b_employee values(4, '�����4', '010-4', '�ּ�4', 'f', '���1', 2); 

-- 3. ���� ����� �̸��� ���̽ÿ�.
select name from b_employee where sex = 'f';

-- 4. ����(manager)�� �̸��� ���̽ÿ�.
select name 
from b_employee e, b_department d 
where e.deptno = d.deptno and e.empno in(
select manager from b_department);
insert into b_employee values(5, '������5', '010-5', '�ּ�5', 'm', 'manager', 1);
insert into b_employee values(6, '������6', '010-6', '�ּ�6', 'f', 'manager', 2); 

insert into b_department values (1, '�μ�1', 5);
insert into b_department values (2, '�μ�2', 6);

update b_employee set position = '����' where empno = 5;
update b_employee set position = '����' where empno = 6;

-- 5. it�μ����� ���ϴ� ����� �̸��� �ּ�
select e.name, e.address from b_department d, b_employee e
where d.deptno = e.deptno and d.deptname like 'IT';

insert into  b_employee values(7, '������7', '010-7', '�ּ�7', 'm', '���', 3);
insert into  b_employee values(8, '������8', '010-8', '�ּ�8', 'f', '�븮', 3);
insert into  b_employee values(9, '������9', '010-9', '�ּ�9', 'f', '����', 3);
insert into b_department values (3, 'IT', 9);

-- 6. ȫ�浿 ����(manager)�μ����� ���ϴ� ����� ���� ���̽ÿ�.
select count(*) from b_department d, b_employee e where d.deptno=e.deptno and d.manager=
(select empno from b_employee where name like 'ȫ�浿');

insert into  b_employee values(10, '������10', '010-10', '�ּ�10', 'f', '���', 4);
insert into  b_employee values(11, '������11', '010-11', '�ּ�11', 'm', '�븮', 4);
insert into  b_employee values(12, 'ȫ�浿', '010-12', '�ּ�12', 'm', '�̻�', 4);
insert into b_department values (4, '�����ǵ���', 12);

-- 7. ������� ���� �ð� ���� �μ���, ��� �̸��� ������������ ���̽ÿ�

select w.hours_worked, e.deptno, e.name from b_works w,b_employee e where w.empno=e.empno order by e.deptno, e.name;

insert into b_project values(1,'��������ͺ��̽�����', 3);
insert into b_works values(7,1,100);
insert into b_works values(8,1,200);
insert into b_works values(9,1,300);

-- 8. 2�� �̻��� ����� ������ ������Ʈ�� ��ȣ, �̸�, ����� ���� ���̽ÿ�
insert into b_project values(2,'�����Ʈ��ݱ���', 3);
insert into b_works values(10,2,100);

select p.projno, p.projname, count(*) as �����
from b_project p, b_works w
where p.projno = w.projno
group by p.projno, p.projname 
having count(*)>1;

-- 9. 3�� �̻��� ����� �ִ� �μ��� ��� �̸��� ���̽ÿ�.
select name
from b_employee
where deptno in (
    select deptno
    from b_employee
    group by deptno
    having count(*)>=3);
