-- 사원 데이터베이스
create table Dept( -- 부서 테이블
    deptno number(2) primary key, -- 부서번호
    dname varchar2(14), -- 부서이름
    loc varchar2(13) -- 위치
);

create table Emp( -- 사원 테이블
    empno number(4) primary key, -- 사원번호
    ename varchar2(10), -- 사원이름
    job varchar2(9), -- 업무
    mgr number(4), -- 팀장번호
    hiredate date, -- 고용날짜
    sal number(7,2), -- 급여
    comm number (7,2), -- 커미션 금액
    deptno number(2), -- 부서번호
    foreign key(deptno) references Dept(deptno)
);
-- 사원번호 7100~8000, 영어이름, 업무 SALESMAN(영업), OFFICEMANAGER(사무관리), HR(인사),Sales support(영업지원)
insert into Dept values(1, '영업1팀', 'DALLAS');
insert into Dept values(2, '영업2팀', '대구');
insert into Dept values(21, '인사1팀', '서울');
insert into Dept values(30, '사무1팀', '부산');
insert into Dept values(31, '사무2팀', '대구');
insert into Dept values(32, '사무3팀', '서울');
insert into Dept values(11, '총무1팀', '서울');

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
-- 1,2,21,32,30,31 팀장
insert into Emp values(1, 'AA', 'SALESMAN', NULL, '2015-05-25', 5000, 100, 1);
insert into Emp values(2, 'BB', 'SALESMAN', NULL, '2015-05-25', 5000, 100, 1);
insert into Emp values(21, 'CC', 'HR', NULL, '2015-05-25', 5000, 100, 1);
insert into Emp values(32, 'DD', 'OM', NULL, '2015-05-25', 5000, 100, 1);
insert into Emp values(30, 'EE', 'OM', NULL, '2015-05-25', 5000, 100, 1);
insert into Emp values(31, 'FF', 'OM', NULL, '2015-05-25', 5000, 100, 1);


-- 1. 사원의 이름과 업무를 출력하시오. 단 사원의 이름은 '사원이름', 업무는 '사원업무' 머리글이 나오도록 출력한다
select ename 사원이름, job 사원업무
from emp;

-- 2. 30번 부서에 근무하는 모든 사원의 이름과 급여를 출력하시오
select ename 사원이름, sal 급여
from emp
where deptno = 30;

--3. 사원번호와 이름, 현재 급여, 증가된 급여분(열이름은 증가액), 10% 인상된 급여(열 이름은 인상된 급여)를 사원번호 순으로 출력하시오
select empno 사원번호, ename 사원이름, sal 급여,sal*1.1-sal 증가액  ,sal*1.1 "인상된 급여"
from emp
order by empno;

-- 4. s로 시작하는 모든 사원과 부서번호를 출력하시오
select ename 사원번호, deptno 부서번호
from emp
where ename like 'S%';

-- 5. 모든 사원의 최대 및 최소 급여, 합계 및 평균 급여를 출력하시오. 열 이름은 각각 MAX, MIN, SUM, AVG로 한다.
-- 단, 소수점이하는 반올림하여 정수로 출력한다.
select round(max(sal)) MAX, round(min(sal)) MIN, round(sum(sal)) SUM, round(avg(sal)) AVG
from emp;

-- 6. 업무 이름과 업무별로 동일한 업무를 하는 사원의 수를 출력하시오. 열 이름은 각각 '업무'와 '업무별 사원수'로 한다
select job 업무, count(*) "업무별 사원수"
from emp
group by job;

--7. 사원의 최대 급여와 최소 급여의 차액을 출력하시오
select round(max(sal)) "최대 급여", round(min(sal)) "최소 급여", round(max(sal)) - round(min(sal)) "차액"
from emp;

--8. 30번 부서의 사원 수와 사원들 급여의 합계와  평균을 출력하시오
select count(*) "사원 수", round(sum(sal)) "급여 합계", round(avg(sal)) "급여 평균"
from emp
where deptno = 30;

--9. 평균 급여가 가장 높은 부서의 번호를 출력하시오
select deptno
from emp
group by deptno
having avg(sal) = (select max(avgsal)from 
    (
    select round(avg(sal)) avgsal
    from emp
    group by deptno));
-- 10. 세일즈맨을 제외하고, 각 업무별 사원의 총급여가 3000이상인 각 업무에 대해서, 업무명과, 각 업무별 평균급여를 출력
-- 평균 급여는 내림차순으로 출력한다
select job 업무명, round(avg(sal)) "업무별 평균급여" 
from emp
where job not in 'SALESMAN'
group by job
having round(avg(sal)) >= 3000;

-- 11. 전체 사원 가운데 직속상관이 있는 사원의 수를 출력하시오
select count(*)
from emp
where not mgr is null;

-- 12. emp 테이블에서 이름, 급여, 커미션 금액, 총액(sal*12+comm)을 구하여 총액이 많은 순서대로 출력하시오
-- 커미션이 null인 사람은 제외한다
select ename 이름, sal 급여, comm "커미션 금액", sal*12+comm "총액"
from emp
where not comm is null
order by sal*12+comm desc;

-- 13. 각 부서별로 같은 업무를 하는 사람의 인원수를 구하여 부서번호, 업무이름, 인원수를 출력하시오
select deptno 부서번호, job 업무이름, count(*) 
from emp
group by deptno, job
order by deptno;

-- 14. 사원이 1명도 없는 부서의 이름을 출력하시오
select dname 부서이름
from dept d
    left outer join emp e on d.deptno = e.deptno
group by dname
having count(ename)<1;

-- 15. 같은 업무를 하는 사람의 수가 4명 이상인 업무와 인원수를 출력하시오
select job 업무, count(ename) 인원수
from emp
group by job
having count(ename)>=4;

-- 16. 사원번호가 7400이상 7600이하인 사원의 이름을 출력하시오
select ename 이름
from emp
where empno>=7400 and empno<=7600;

-- 17. 사원의 이름과 사원의 부서이름을 출력하시오
select e.ename 이름, d.dname 부서이름
from emp e
    left outer join dept d on e.deptno = d.deptno;
    
-- 18. 사원의 이름과 팀장의 이름을 출력하시오
select e1.ename 사원이름, e2.ename 팀장이름 
from emp e1
join emp e2 on e1.mgr =e2.empno;

-- 19. 사원 scott보다 급여를 많이 받는 사람의 이름을 출력하시오
select ename
from emp
where sal >= (
    select sal
    from emp
    where ename in 'SCOTT');
-- 20. 사원 scott이 일하는 부서번호 혹은 DALLAS에 있는 부서번호를 출력하시오
select distinct(d.dname)
from emp e
    left outer join dept d on e.deptno = d.deptno
where e.ename in 'SCOTT' or d.loc in 'DALLAS';





