select * from escape_branch;
select * from thema;
select * from emp;
select * from customer;
select * from visit;

-- 1. ������ �׸���
select e.bname ������, count(*) �׸���
from escape_branch e, thema t
where e.bid = t.bid
group by e.bname;

-- 2. ������ �帣��
select e.bname ������, t.tgenre �帣, count(*) �帣��
from escape_branch e, thema t
where e.bid = t.bid
group by e.bname, t.tgenre
order by e.bname;

-- 3. ������ ������
select e.bname ������, count(*) �ο���
from escape_branch e, emp em
where e.bid = em.bid
group by e.bname
order by e.bname;

-- 4. ������ ������(���� �з�)
select e.bname ������, em.esex ����, count(em.esex) �ο���
from escape_branch e, emp em
where e.bid = em.bid
group by e.bname, em.esex
order by e.bname, em.esex;

-- 5. 3�� ���̸� ���������� ���������� ����
update customer set cname= '������' where cid=3;

-- 6. �׸� �湮��(��������)
select t.tname �׸���, count(*) �湮��
from thema t
left outer join visit v on t.tid=v.tid
group by t.tname
order by count(*) desc;

-- 7. ���� ���� ����� �湮�� ��¥
select vdate �湮��
from visit
group by vdate
having count(*)>= (select max(visitcount)
from (select count(*) as visitcount from visit group by vdate));

-- 8. ���� ���� ���� ����
select e.ename ������
from visit v, emp e
where v.eid=e.eid
group by e.ename
having count(*) > = (select max(workcount)
from (select count(*) as workcount from visit group by visit.eid));

-- 9. ��Ż�� �湮 ����Ʈ�� �����ݾ� ǥ��(price�� �δ� ���)
select e.bname ������, t.tname �׸���, c.cname ����, v.visitnum �÷����ο�,v.visitnum*t.price �����ݾ�
,v.vdate �湮��, em.ename
from visit v
left outer join thema t on v.tid =t.tid
left outer join customer c on c.cid = v.cid
left outer join emp em on em.eid=v.eid
left outer join escape_branch e on e.bid=t.bid;

-- 10. ������ ������(�Ѹ���ݾ�-�ΰǺ�(�Ǵ� 10000��))
select e.bname ������, sum(v.visitnum*t.price) ����ݾ�, count(*)*10000 as �ΰǺ�, sum(v.visitnum*t.price)-count(*)*10000 ������
from visit v
left outer join thema t on v.tid =t.tid
left outer join customer c on c.cid = v.cid
left outer join emp em on em.eid=v.eid
left outer join escape_branch e on e.bid=t.bid
group by e.bname
order by sum(v.visitnum*t.price)-count(*)*10000 desc;

-- 11. �並 �����Ͽ� ��Ÿ�� �帣 �׸��� �ֱ�
create view vw_thema
as select * from thema where tgenre like '��Ÿ��';
select * from vw_thema;

-- 12. 10���� �̻� ������ ��
select c.cname ����, sum(v.visitnum*t.price) �����ݾ�
from visit v
left outer join customer c on v.cid=c.cid
left outer join thema t on v.tid=t.tid
group by c.cname
having sum(v.visitnum*t.price)>=100000
order by sum(v.visitnum*t.price) desc;

-- 13. ���� �达�� ������ �ٹ���
select em.ename ������, e.baddr �ٹ���
from emp em, escape_branch e
where em.bid = e.bid and em.ename like '��%';

--14. �׸��� ��� �÷��� �ο����� �ݾ� 
select t.tname �׸���, round(avg(v.visitnum)) ����÷����ο�, avg(v.visitnum*t.price) ��ձݾ�
from thema t, visit v
where t.tid=v.tid
group by t.tname;

-- 15. �帣�� ��� �÷��� �ο����� �ݾ�
select t.tgenre �帣��, round(avg(v.visitnum)) ����÷����ο�, round(avg(v.visitnum*t.price)) ��ձݾ�
from thema t, visit v
where t.tid=v.tid
group by t.tgenre;

--16. ��պ��� ���� ������ ������ ������ �׸�
select t.tname �׸���, round(avg(c.cage)) ��ճ���
from visit v, customer c, thema t
where c.cid = v.cid and t.tid=v.tid
group by t.tname
having avg(c.cage) > (select avg(cage) from customer)
order by round(avg(c.cage));

--17. ��պ��� ���� ������ �������� �ٹ��ϴ� ����
select e.bname, round(avg(em.eage))
from emp em, escape_branch e
where em.bid = e.bid
group by e.bname
having avg(em.eage) < (select avg(eage) from emp);
--18. ������ ������ ��Ż�� �÷��� Ƚ���� ���� ������ �帣 ��ŷ
select c.csex, count(*) from customer c, visit v where c.cid =v.cid group by c.csex;

--19. �����ư� �ȳ��� �׸��� �׸����

--20. �並 �����Ͽ� �漺���� �湮 ����Ʈ �����ֱ�

