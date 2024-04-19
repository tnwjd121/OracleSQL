-- �μ����� 
-- sql�� ���� �� �ٸ� sql���� �ۼ��Ѵ�
-- ��) ������ ���� ��� ������ �̸��� ���ΰ�?
-- ���� ��� ���� ���ϱ�
select max(price)
from book;
-- ���� ��� �������� ������ �̸� ���ϱ�
select bookname
from book
where price = 35000;

-- ���� ��� ������ �̸��� ���̽ÿ�
select bookname ----1
from book
where price = (select max(price) from book);  ---1
-- ��ȣ�� ��� sql���� ��ø��Ű�� ���� �μ�����(subquery)
-- �μ����Ǵ� ���ǰ� ��ø�Ǿ� �ִٴ� �ǹ̿��� ��ø����(nested query)��� �Ѵ�
-- �μ������� ���� ������ where���� �μ����Ǹ� ���� ó���ϰ� ��ü���Ǹ� ó���Ѵ�

-- �μ����Ǵ� sql���̴�
-- sql���� ����� ���̺�
-- ���̺��� ����� �� ���� �� �ϳ��� �ȴ�
-- ������-���Ͽ�(1x1), ������-���Ͽ�(nx1), ������-���߿�(1xn), ������-���߿�(nxn)

-- �μ������� ����� ������-���Ͽ��� ���� ���� ���� ��ȯ�ϸ�
-- �տ��� ��� inŰ���带 ����Ѵ�

-- ��) ������ ������ ���� �ִ� ���� �̸��� �˻��Ͻÿ�
-- ������ ������ ���� �ִ� �� ��ȸ
select custid
from orders;

select name 
from customer
where custid in(1,2,3,4);

-- ������ ������ ���� �ִ� ���� �̸��� ���ÿ�
select name
from customer
where custid in (select custid from orders);

-- �� �� �̻��� ��ø�� �μ����ǵ� �����ϴ�

-- ���ѹ̵��� ������ ������ ������ ���� �̸��� ���̽ÿ�.
select name
from customer
where custid in (select custid from orders where bookid in (select bookid from book where publisher = '���ѹ̵��'));

-- ���๮ ������ ���� �������� ���� �����ϰ� �� ����� �̿��Ͽ�
-- ���� �μ����Ǹ� �����Ѵ�

-- ���ǻ纰�� ���ǻ��� ��� ���� ���ݺ��� ��� ������ ���Ͻÿ�
SELECT b1.bookname
FROM book b1
WHERE b1.price > (
    SELECT AVG(b2.price)
    FROM book b2
    WHERE b2.publisher = b1.publisher
);
-- ���̺��� ��Ī�� �� ���ִ�




