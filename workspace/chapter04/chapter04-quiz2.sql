-- 부속질의에 관한 다음 sql문을 수행해보고 어떤 질의에 대한 답인지 설명하시오
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

-- 마당서점 데이터베이스를 이용해 다음에 해당하는 뷰를 작성하시오
select * from book;
select * from orders;
select * from customer;
--1 판매가격이 20,000원 이상인 도서의 도서번호, 도서이름, 고객이름, 출판사, 판매가격을 보여주는 highorders 뷰를 생성하시오
create view highorders (도서번호, 도서이름, 고객이름, 출판사, 판매가격)
as select b.bookid , b.bookname , c.name , b.publisher , o.saleprice 
from book b, orders o, customer c
where b.bookid = o.bookid and c.custid = o.custid and o.saleprice>=20000;
select * from highorders;

--2 생성한 뷰를 이용하여 판매된 도서의 이름과 고객의 이름을 출력하는 sql문을 작성하시오
select 도서이름, 고객이름
from highorders;
--3 highorders 뷰를 변경하고자 한다. 판매가격 속성을 삭제하는 명령을 수행하시오. 삭제 후(2)번 sql문을 다시 수행하시오
alter view highorders drop column 판매가격;
-- 오라클에서는 위에처럼 일부 삭제가 안됨 지우고 다시 만들어야됨
drop view highorders;
create view highorders (도서번호, 도서이름, 고객이름, 출판사)
as select b.bookid , b.bookname , c.name , b.publisher
from book b, orders o, customer c
where b.bookid = o.bookid and c.custid = o.custid and o.saleprice>=20000;
select * from highorders;

-- 사원데이터베이스를 이용하여 다음 질의에 해당하는 sql문을 작성하시오
select * from dept;
select * from emp;
-- 1. 팀장(mgr)이 없는 직원의 이름을 보이시오
select ename
from emp
where mgr is null;
-- 2. 사원의 이름과 부서의 이름을 보이시오(조인/스칼라 부속질의 사용)
select e.ename, (select d.dname from dept d where e.deptno = d.deptno) as dname
from  emp e;
-- 3. CHICAGO에 근무하는 사원의 이름을 보이시오 (조인/인라인뷰 / 중첩질의 / EXISTS 사용)
update dept 
set loc = 'CHICAGO'
where DEPTNO in 30;

select e.ename
from emp e
where exists (select * from dept d where loc like 'CHICAGO' and e.deptno = d.deptno);

-- 4. 평균보다 급여가 많은 직원의 이름을 보이시오
select ename
from emp 
where sal > (select avg(sal) from emp);
-- 5. 자기 부서의 평균 보다 급여가 많은 직원의 이름을 보이시오(상관 부속질의 사용)
select ename
from emp eout
where sal > (
    select avg(sal)
    from emp ein
    where eout.deptno = ein.deptno);
    


