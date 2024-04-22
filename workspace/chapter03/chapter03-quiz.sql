-- 마당서점의 고객이 요구하는 다음 질문에 대해 sql문을 작성하시오
--(1) 도서번호가 1인 도서의 이름
select bookname
from book
where bookid in(1);
--(2) 가격이 20,000원 이상인 도서의 이름
select bookname
from book
where price >=20000;
--(3) 박지성의 총구매액 
select sum(saleprice) "총구매액"
from orders ord
    left outer join customer cus on ord.custid = cus.custid
where cus.name = '박지성';
--(4) 박지성이 구매한 도서의 출판사 수
select count(distinct book.publisher)
from book book
    left outer join orders ord on book.bookid = ord.bookid
    left outer join customer cus on ord.custid = cus.custid
where cus.name = '박지성';
--(5) 박지성이 구매한 도서의 이름, 가격, 정가와 판매가격의 차이
select book.bookname, book.price, book.price - ord.saleprice as " 정가와 판매가격 차이"
from book book
    left outer join orders ord on book.bookid = ord.bookid
    left outer join customer cus on ord.custid = cus.custid
where cus.name = '박지성';
--(6) 박지성이 구매하지 않은 도서의 이름
select book.bookname
from book book
    left outer join orders ord on book.bookid = ord.bookid
    left outer join customer cus on ord.custid = cus.custid
where cus.name not in ('박지성');


-- 마당 서점의 운영자와 경영자가 요구하는 다음 질문에 대해 sql문을 작성하시오
select * from book;
select * from orders;
select * from customer;
select * from imported_book;
--(1) 마당서점 도서의 총수
select count(bookname) "도서 개수"
from book;
--(2) 마당서점에 도서를 출고하는 출판사의 총수
select count(DISTINCT publisher)
from book;
--(3) 모든 고객의 이름, 주소
select name, address
from customer;
--(4) 2020년 7월 4일 ~ 7월 7일 사이에 주문받은 도서의 주문번호
select orderid
from orders
where orderdate between '2020-07-04' and '2020-07-07';
--(5) 2020년 7월 4일 ~ 7월 7일 사이에 주문받은 도서를 제외한 도서의 주문번호
select orderid
from orders
where orderdate not between '2020-07-04' and '2020-07-07';
--(6) 성이 '김'씨인 고객의 이름 주소
select name, address
from customer
where name like '김%';
--(7) 성이 '김'씨이고 이름이 '아'로 끝나는 고객의 이름과 주소
select name, address
from customer
where name like '김_아';

select * from book;
select * from orders;
select * from customer;
select * from imported_book;
--(10) 고객의 이름과 고객별 구매액
select cus.name, sum(ord.saleprice)
from customer cus
    left outer join orders ord on cus.custid = ord.custid
group by cus.name
having sum(ord.saleprice)>=0
order by cus.name;
--(11) 고객의 이름과 고객이 구매한 도서목록
select cus.name, book.bookname
from book book
    left outer join orders ord on book.bookid = ord.bookid
    left outer join customer cus on ord.custid = cus.custid
where cus.name is not null
order by cus.name;
--(12) 도서의 가격(Book 테이블)과 판매가격(Orders 테이블)의 차이가 가장 많은 주문
select max(book.price - ord.saleprice)
from book book
    left outer join orders ord on book.bookid = ord.bookid;
--(13) 도서의 판매액 평균보다 자신의 구매액 평균이 더 높은 고객의 이름
select cus.name
from orders ord
    left outer join customer cus on ord.custid = cus.custid
group by cus.name
having avg(ord.saleprice) > (select avg(book.price) from book);

select * from book;
select * from orders;
select * from customer;
select * from imported_book;
--(1) 박지성이 구매한 도서의 출판사와 같은 출판사에서 도서를 구매한 고객의 이름
select cus.name
from customer cus
    left outer join orders ord on cus.custid = ord.custid
    left outer join book book on book.bookid = ord.bookid
where book.publisher in(select book.publisher
        from book
        where book.bookid in (select ord.bookid
        from orders ord 
            left outer join customer cus on ord.custid = cus.custid
        where cus.name = '박지성')) and cus.name not in ('박지성');
--(2) 두 개 이상의 서로 다른 출판사에서 도서를 구매한 고객의 이름
-- 출판사 갯수 카운트 사람별로 2개 이상 뽑고 사람 뽑기
select cus.name
from customer cus
    left outer join orders ord on cus.custid = ord.custid
    left outer join book book on book.bookid = ord.bookid
group by cus.name
having count(distinct book.publisher) >=2;
--(3) 전체 고객의 30% 이상이 구매한 도서
-- 도서별 카운트
select bookname
from book
where bookid in (
    select bookid
    from orders
    group by bookid
    having count(bookid)>=(select count(*) from customer)*0.3);
