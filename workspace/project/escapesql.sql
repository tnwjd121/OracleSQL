select * from escape_branch;
select * from thema;
select * from emp;
select * from customer;
select * from visit;

-- 1. 지점별 테마수
select e.bname 지점명, count(*) 테마수
from escape_branch e, thema t
where e.bid = t.bid
group by e.bname;

-- 2. 지점별 장르수
select e.bname 지점명, t.tgenre 장르, count(*) 장르수
from escape_branch e, thema t
where e.bid = t.bid
group by e.bname, t.tgenre
order by e.bname;

-- 3. 지점별 직원수
select e.bname 지점명, count(*) 인원수
from escape_branch e, emp em
where e.bid = em.bid
group by e.bname
order by e.bname;

-- 4. 지점별 직원수(성별 분류)
select e.bname 지점명, em.esex 성별, count(em.esex) 인원수
from escape_branch e, emp em
where e.bid = em.bid
group by e.bname, em.esex
order by e.bname, em.esex;

-- 5. 3번 고객이름 박지영에서 박지연으로 변경
update customer set cname= '박지연' where cid=3;

-- 6. 테마 방문수(내림차순)
select t.tname 테마명, count(*) 방문수
from thema t
left outer join visit v on t.tid=v.tid
group by t.tname
order by count(*) desc;

-- 7. 가장 많은 사람이 방문한 날짜
select vdate 방문일
from visit
group by vdate
having count(*)>= (select max(visitcount)
from (select count(*) as visitcount from visit group by vdate));

-- 8. 가장 많이 일한 직원
select e.ename 직원명
from visit v, emp e
where v.eid=e.eid
group by e.ename
having count(*) > = (select max(workcount)
from (select count(*) as workcount from visit group by visit.eid));

-- 9. 방탈출 방문 리스트에 결제금액 표기(price는 인당 요금)
select e.bname 지점명, t.tname 테마명, c.cname 고객명, v.visitnum 플레이인원,v.visitnum*t.price 결제금액
,v.vdate 방문일, em.ename
from visit v
left outer join thema t on v.tid =t.tid
left outer join customer c on c.cid = v.cid
left outer join emp em on em.eid=v.eid
left outer join escape_branch e on e.bid=t.bid;

-- 10. 지점별 순이익(총매출금액-인건비(건당 10000원))
select e.bname 지점명, sum(v.visitnum*t.price) 매출금액, count(*)*10000 as 인건비, sum(v.visitnum*t.price)-count(*)*10000 순이익
from visit v
left outer join thema t on v.tid =t.tid
left outer join customer c on c.cid = v.cid
left outer join emp em on em.eid=v.eid
left outer join escape_branch e on e.bid=t.bid
group by e.bname
order by sum(v.visitnum*t.price)-count(*)*10000 desc;

-- 11. 뷰를 생성하여 판타지 장르 테마만 넣기
create view vw_thema
as select * from thema where tgenre like '판타지';
select * from vw_thema;

-- 12. 10만원 이상 결제한 고객
select c.cname 고객명, sum(v.visitnum*t.price)
from visit v
left outer join customer c on v.cid=c.cid
left outer join thema t on v.tid=t.tid
group by c.cname
having sum(v.visitnum*t.price)>=100000
order by sum(v.visitnum*t.price) desc;

--13. 성이 김씨인 직원의 근무지

-- 테마별 평균 플레이 인원수와 금액 

