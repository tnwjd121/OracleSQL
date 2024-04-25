-- �μ����ǿ� ���� ���� sql���� �����غ��� � ���ǿ� ���� ������ �����Ͻÿ�
select custid, (select address from customer cs where cs.custid =od.custid) "address", sum(saleprice) "total"
from Orders od
group by od.custid;

select cs.name,s 
from (select custid, avg(saleprice) s 
      from orders 
      group by custid) od, customer cs
where  cs.custid = od.custid;

select sum(saleprice) "total"
from orders od
where exists (select * from customer cs where custid <=3 and cs.custid = od.custid);

-- ���缭�� �����ͺ��̽��� �̿��� ������ �ش��ϴ� �並 �ۼ��Ͻÿ�
select * from book;
select * from orders;
select * from customer;
--1 �ǸŰ����� 20,000�� �̻��� ������ ������ȣ, �����̸�, ���̸�, ���ǻ�, �ǸŰ����� �����ִ� highorders �並 �����Ͻÿ�
create view highorders (������ȣ, �����̸�, ���̸�, ���ǻ�, �ǸŰ���)
as select b.bookid , b.bookname , c.name , b.publisher , o.saleprice 
from book b, orders o, customer c
where b.bookid = o.bookid and c.custid = o.custid and o.saleprice>=20000;
select * from highorders;

--2 ������ �並 �̿��Ͽ� �Ǹŵ� ������ �̸��� ���� �̸��� ����ϴ� sql���� �ۼ��Ͻÿ�
select �����̸�, ���̸�
from highorders;
--3 highorders �並 �����ϰ��� �Ѵ�. �ǸŰ��� �Ӽ��� �����ϴ� ����� �����Ͻÿ�. ���� ��(2)�� sql���� �ٽ� �����Ͻÿ�
alter view highorders drop column �ǸŰ���;
-- ����Ŭ������ ����ó�� �Ϻ� ������ �ȵ� ����� �ٽ� �����ߵ�
drop view highorders;
create view highorders (������ȣ, �����̸�, ���̸�, ���ǻ�)
as select b.bookid , b.bookname , c.name , b.publisher
from book b, orders o, customer c
where b.bookid = o.bookid and c.custid = o.custid and o.saleprice>=20000;
select * from highorders;

-- ��������ͺ��̽��� �̿��Ͽ� ���� ���ǿ� �ش��ϴ� sql���� �ۼ��Ͻÿ�
select * from dept;
select * from emp;
-- 1. ����(mgr)�� ���� ������ �̸��� ���̽ÿ�
select ename
from emp
where mgr is null;
-- 2. ����� �̸��� �μ��� �̸��� ���̽ÿ�(����/��Į�� �μ����� ���)
select e.ename, (select d.dname from dept d where e.deptno = d.deptno) as dname
from  emp e;
-- 3. CHICAGO�� �ٹ��ϴ� ����� �̸��� ���̽ÿ� (����/�ζ��κ� / ��ø���� / EXISTS ���)
update dept 
set loc = 'CHICAGO'
where DEPTNO in 30;

select e.ename
from emp e
where exists (select * from dept d where loc like 'CHICAGO' and e.deptno = d.deptno);

-- 4. ��պ��� �޿��� ���� ������ �̸��� ���̽ÿ�
select ename
from emp 
where sal > (select avg(sal) from emp);
-- 5. �ڱ� �μ��� ��� ���� �޿��� ���� ������ �̸��� ���̽ÿ�(��� �μ����� ���)
select ename
from emp eout
where sal > (
    select avg(sal)
    from emp ein
    where eout.deptno = ein.deptno);
    


