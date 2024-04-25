-- 내장 함수 결과
SELECT ABS(-15) FROM DUAL; -- 15
SELECT CEIL(15.7) FROM DUAL;  -- 16
SELECT COS(3.14159) FROM DUAL; -- 0.9999999...
SELECT FLOOR(15.7) FROM DUAL; -- 15
SELECT LOG(10,100) FROM DUAL; -- 2
SELECT MOD(11,4) FROM DUAL; -- 3
SELECT POWER(3,2) FROM DUAL; -- 9
SELECT ROUND(15.7) FROM DUAL; -- 16
SELECT SIGN(-15) FROM DUAL; -- 1
SELECT TRUNC(15.7) FROM DUAL; -- 15
SELECT CHR(67) FROM DUAL; -- C
SELECT CONCAT('HAPPY', 'Birthday') FROM DUAL; -- HAPPYBirthday
SELECT LOWER('Birthday') FROM DUAL; -- birthday
SELECT LPAD('Page 1', 15, '*.') FROM DUAL; -- *.*.*.*.*Page 1
SELECT LTRIM('Page 1','ae') FROM DUAL; --Page 1
SELECT REPLACE('JACK', 'J', 'BL') FROM DUAL; -- BLACK
SELECT RPAD('Page 1', 15, '*.') FROM DUAL; -- Page 1*.*.*.*.*
SELECT RTRIM('Page 1', 'ae') FROM DUAL; --Page 1
SELECT SUBSTR('AVECEFG', 3.4) FROM DUAL; --ECEFG
SELECT TRIM(LEADING 0 FROM '00AA00') FROM DUAL; --AA00
SELECT UPPER('Birthday') FROM DUAL; -- BIRTHDAY
SELECT ASCII('A') FROM DUAL; --65
SELECT INSTR('CORPORATE FLOOR', 'OR', 3, 2) FROM DUAL; --14
SELECT LENGTH('Birthday') FROM DUAL; -- 8
SELECT ADD_MONTHS('14/05/21', 1) FROM DUAL; -- 14/06/21
SELECT LAST_DAY(SYSDATE) FROM DUAL; -- 24/04/30
SELECT NEXT_DAY(SYSDATE, '화') FROM DUAL; -- 24/04/30
SELECT ROUND(SYSDATE) FROM DUAL; -- 24/04/26
SELECT SYSDATE FROM DUAL; -- 24/04/25
SELECT TO_CHAR(SYSDATE) FROM DUAL; -- 24/04/25
SELECT TO_CHAR(123) FROM DUAL; -- 123
SELECT TO_DATE('12 05 2020', 'DD MM YYYY') FROM DUAL; -- 20/05/15
SELECT TO_NUMBER('12.3') FROM DUAL; -- 12.3
SELECT DECODE(1,1,'aa', 'bb') FROM DUAL; -- aa
SELECT NULLIF(123,345) FROM DUAL; -- 123
SELECT NVL(NULL, 123) FROM DUAL; -- 123

-- Mybook 테이블을 생성한후 null에 관한 sql 문에 답하시오
create table mybook2 (
    bookid number,
    price number
);
insert into mybook2 values(1,10000);
insert into mybook2 values(2,20000);
insert into mybook2 values(3,NULL);

SELECT * FROM Mybook;
select bookid, NVL(price,0) from mybook;
select * from mybook where price is null;
select * from mybook where price ="";
select bookid, price+100 from mybook;
select sum(price), avg(price), count(*) from mybook where bookid >=4;
select count(*), count(price) from mybook;
select sum(price), avg(price) from mybook;

-- rownum에 관한 sql 문에 답하시오
select * from book;
select * from book where rownum <=5;
select * from book where rownum <= 5 order by price;
select * from (select*from book order by price) b where rownum <=5;
select * from (select*from book where rownum <=5) b order by price;
select * from (select*from book where rownum <=5 order by price)b;