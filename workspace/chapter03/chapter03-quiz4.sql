-- ��� �����ͺ��̽�
create table Dept( -- �μ� ���̺�
    deptno number(2) primary key, -- �μ���ȣ
    dname varchar2(14), -- �μ��̸�
    loc varchar2(13) -- ��ġ
);

create table Emp( -- ��� ���̺�
    empno number(4) primary key, -- �����ȣ
    ename varchar2(10), -- ����̸�
    job varchar2(9), -- ����
    mgr number(4), -- �����ȣ
    hiredate date, -- ��볯¥
    sal number(7,2), -- �޿�
    comm number (7,2), -- Ŀ�̼� �ݾ�
    deptno number(2), -- �μ���ȣ
    foreign key(deptno) references Dept(deptno)
);
-- �����ȣ 7100~8000, �����̸�, ���� SALESMAN(����), OFFICEMANAGER(�繫����), HR(�λ�),Sales support(��������)
insert into Dept values(1, '����1��', 'DALLAS');
insert into Dept values(2, '����2��', '�뱸');
insert into Dept values(21, '�λ�1��', '����');
insert into Dept values(30, '�繫1��', '�λ�');
insert into Dept values(31, '�繫2��', '�뱸');
insert into Dept values(32, '�繫3��', '����');
insert into Dept values(11, '�ѹ�1��', '����');

insert into Emp values(7100, 'SAM', 'SALESMAN', 1, '2020-07-21', 3000, 500, 1);
insert into Emp values(7200, 'HAM', 'SALESMAN', 1, '2020-05-21', 4000, 300, 1);
insert into Emp values(7300, 'AAM', 'SALESMAN', 2, '2020-04-21', 2000, 200, 2);
insert into Emp values(7400, 'BAM', 'SALESMAN', 2, '2020-03-21', 3000, 100, 2);
insert into Emp values(7500, 'CAM', 'HR', 21, '2021-07-21', 5000, 500, 21);
insert into Emp values(7600, 'DAM', 'OM', 32, '2020-07-25', 2000, 400, 32);
insert into Emp values(7700, 'EAM', 'OM', 30, '2018-05-21', 3000, 300, 30);
insert into Emp values(7800, 'FAM', 'OM', 30, '2023-05-12', 4000, 200, 30);
insert into Emp values(7900, 'GAM', 'OM', 31, '2022-09-21', 3000, 100, 31);
insert into Emp values(8000, 'SUN', 'OM', 30, '2023-09-12', 3000, 200, 30);
insert into Emp values(8100, 'JUN', 'OM', NULL, '2024-01-01', 3000, NULL, 30);
insert into Emp values(8200, 'JAM', 'SS', 1, '2022-03-21', 3000, 100, 1);
insert into Emp values(8300, 'YAM', 'SS', 2, '2022-03-21', 3000, 100, 2);
insert into Emp values(8400, 'SCOTT', 'OM', 31, '2022-01-21', 3000, 100, 31);
-- 1,2,21,32,30,31 ����
insert into Emp values(1, 'AA', 'SALESMAN', NULL, '2015-05-25', 5000, 100, 1);
insert into Emp values(2, 'BB', 'SALESMAN', NULL, '2015-05-25', 5000, 100, 1);
insert into Emp values(21, 'CC', 'HR', NULL, '2015-05-25', 5000, 100, 1);
insert into Emp values(32, 'DD', 'OM', NULL, '2015-05-25', 5000, 100, 1);
insert into Emp values(30, 'EE', 'OM', NULL, '2015-05-25', 5000, 100, 1);
insert into Emp values(31, 'FF', 'OM', NULL, '2015-05-25', 5000, 100, 1);


-- 1. ����� �̸��� ������ ����Ͻÿ�. �� ����� �̸��� '����̸�', ������ '�������' �Ӹ����� �������� ����Ѵ�
select ename ����̸�, job �������
from emp;

-- 2. 30�� �μ��� �ٹ��ϴ� ��� ����� �̸��� �޿��� ����Ͻÿ�
select ename ����̸�, sal �޿�
from emp
where deptno = 30;

--3. �����ȣ�� �̸�, ���� �޿�, ������ �޿���(���̸��� ������), 10% �λ�� �޿�(�� �̸��� �λ�� �޿�)�� �����ȣ ������ ����Ͻÿ�
select empno �����ȣ, ename ����̸�, sal �޿�,sal*1.1-sal ������  ,sal*1.1 "�λ�� �޿�"
from emp
order by empno;

-- 4. s�� �����ϴ� ��� ����� �μ���ȣ�� ����Ͻÿ�
select ename �����ȣ, deptno �μ���ȣ
from emp
where ename like 'S%';

-- 5. ��� ����� �ִ� �� �ּ� �޿�, �հ� �� ��� �޿��� ����Ͻÿ�. �� �̸��� ���� MAX, MIN, SUM, AVG�� �Ѵ�.
-- ��, �Ҽ������ϴ� �ݿø��Ͽ� ������ ����Ѵ�.
select round(max(sal)) MAX, round(min(sal)) MIN, round(sum(sal)) SUM, round(avg(sal)) AVG
from emp;

-- 6. ���� �̸��� �������� ������ ������ �ϴ� ����� ���� ����Ͻÿ�. �� �̸��� ���� '����'�� '������ �����'�� �Ѵ�
select job ����, count(*) "������ �����"
from emp
group by job;

--7. ����� �ִ� �޿��� �ּ� �޿��� ������ ����Ͻÿ�
select round(max(sal)) "�ִ� �޿�", round(min(sal)) "�ּ� �޿�", round(max(sal)) - round(min(sal)) "����"
from emp;

--8. 30�� �μ��� ��� ���� ����� �޿��� �հ��  ����� ����Ͻÿ�
select count(*) "��� ��", round(sum(sal)) "�޿� �հ�", round(avg(sal)) "�޿� ���"
from emp
where deptno = 30;

--9. ��� �޿��� ���� ���� �μ��� ��ȣ�� ����Ͻÿ�
select deptno
from emp
group by deptno
having avg(sal) = (select max(avgsal)from 
    (
    select round(avg(sal)) avgsal
    from emp
    group by deptno));
-- 10. ��������� �����ϰ�, �� ������ ����� �ѱ޿��� 3000�̻��� �� ������ ���ؼ�, �������, �� ������ ��ձ޿��� ���
-- ��� �޿��� ������������ ����Ѵ�
select job ������, round(avg(sal)) "������ ��ձ޿�" 
from emp
where job not in 'SALESMAN'
group by job
having round(avg(sal)) >= 3000;

-- 11. ��ü ��� ��� ���ӻ���� �ִ� ����� ���� ����Ͻÿ�
select count(*)
from emp
where not mgr is null;

-- 12. emp ���̺��� �̸�, �޿�, Ŀ�̼� �ݾ�, �Ѿ�(sal*12+comm)�� ���Ͽ� �Ѿ��� ���� ������� ����Ͻÿ�
-- Ŀ�̼��� null�� ����� �����Ѵ�
select ename �̸�, sal �޿�, comm "Ŀ�̼� �ݾ�", sal*12+comm "�Ѿ�"
from emp
where not comm is null
order by sal*12+comm desc;

-- 13. �� �μ����� ���� ������ �ϴ� ����� �ο����� ���Ͽ� �μ���ȣ, �����̸�, �ο����� ����Ͻÿ�
select deptno �μ���ȣ, job �����̸�, count(*) 
from emp
group by deptno, job
order by deptno;

-- 14. ����� 1�� ���� �μ��� �̸��� ����Ͻÿ�
select dname �μ��̸�
from dept d
    left outer join emp e on d.deptno = e.deptno
group by dname
having count(ename)<1;

-- 15. ���� ������ �ϴ� ����� ���� 4�� �̻��� ������ �ο����� ����Ͻÿ�
select job ����, count(ename) �ο���
from emp
group by job
having count(ename)>=4;

-- 16. �����ȣ�� 7400�̻� 7600������ ����� �̸��� ����Ͻÿ�
select ename �̸�
from emp
where empno>=7400 and empno<=7600;

-- 17. ����� �̸��� ����� �μ��̸��� ����Ͻÿ�
select e.ename �̸�, d.dname �μ��̸�
from emp e
    left outer join dept d on e.deptno = d.deptno;
    
-- 18. ����� �̸��� ������ �̸��� ����Ͻÿ�
select e1.ename ����̸�, e2.ename �����̸� 
from emp e1
join emp e2 on e1.mgr =e2.empno;

-- 19. ��� scott���� �޿��� ���� �޴� ����� �̸��� ����Ͻÿ�
select ename
from emp
where sal >= (
    select sal
    from emp
    where ename in 'SCOTT');
-- 20. ��� scott�� ���ϴ� �μ���ȣ Ȥ�� DALLAS�� �ִ� �μ���ȣ�� ����Ͻÿ�
select distinct(d.dname)
from emp e
    left outer join dept d on e.deptno = d.deptno
where e.ename in 'SCOTT' or d.loc in 'DALLAS';





