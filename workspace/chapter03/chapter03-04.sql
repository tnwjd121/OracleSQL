-- ���� �Լ��� group by �˻�
-- ����� ���� ����� �ǹ̷� �����ͺ��̽������� ��躸�� ������ �� ����Ѵ�
-- ���� �Ǹ� �Ѿ�, �Ϻ� �Ǹŷ� �� ����� ����
-- �����ϱ� ���ؼ��� group by ���� ����ϰ� ��ü���� ���� ������ ���� �Լ��� ����Ѵ�

-- ���� �Լ�
-- sum  / sum ([all | distinct] �Ӽ��̸�) / �հ�
-- avg / avg([all | distinct] �Ӽ��̸�) / ���
-- count / count ([all|distinct] �Ӽ��̸� | *) / ����
-- max / max ([all|distinct] �Ӽ��̸�) / �ִ밪
-- min / min([all|distinct] �Ӽ��̸�) / �ּҰ�

-- ���� �ֹ��� ������ ���Ǹž��� ���Ͻÿ�
select * from orders;
select sum(saleprice)
from orders;

-- sql������ sum(saleprice)�� ����� �����͸� �����Ͽ� ���� ���ο� ��� ���̱� ������
-- ��� ���̺� ������ �̸� ���� 'sum(saleprice)'��� ��µȴ�
-- �ǹ� �ִ� �� �̸��� ����ϰ� ������ �Ӽ��̸��� ��Ī�� ��Ī�ϴ�
-- asŰ���带 ����Ͽ� �� �̸��� �ο� �Ѵ�
-- as ���� ����
select sum(saleprice) �Ѹ���
from orders;
select sum(saleprice) "��ü����"
from orders;

-- 2�� �迬�� ���� �ֹ��� ������ ���Ǹž��� ���Ͻÿ�
select saleprice
from orders
where custid = 2;

-- ���� �Լ��� ���� ���� ȥ���Ͽ� �� �� �ִ�
-- ���� �ֹ��� ������ ���Ǹž�, ��հ�, ������, �ְ��� ���Ͻÿ�.
select sum(saleprice) as total, 
    avg(saleprice) as average,
    min(saleprice) as minimum,
    max(saleprice) as maximun
from orders;
-- ���� �Լ� count�� ���� ������ ����
-- count()�� ��ȣ �ȿ��� * Ȥ�� �Ӽ��� �̸��� ���Ǹ�
-- �ش� �Ӽ��� ������ ������ ���� �ش�
-- ������ ���� - ī��θ�Ƽ
-- count(*)�� ��ü ������ ���� �����ش�
-- count(publisher)�� ���ǻ��� ���� �����ִµ� null���� ���ܵȴ�
-- count(distinct publisher)�� �ߺ��� ������ ���ǻ��� ���� ���� �ش�(null ���� ����)

-- ���㼭���� ���� �Ǹ� �Ǽ��� ���Ͻÿ�.
select count(*)
from orders;

-- group by �˻�
-- sql������ group by ���� ����ϸ� ���� �Ӽ������� �׷��� ���� �� �ִ�

-- ������ �ֹ��� ������ �Ѽ����� ���Ǹž��� ���Ͻÿ�
select custid, count(*) as ��������, sum(saleprice) as �Ѿ�
from orders
group by custid;
select * from orders order by custid;

-- having ���� group by ���� ������� ��Ÿ���� �׷��� �����ϴ� ������ �Ѵ�
-- ������ 8000�� �̻��� ������ ������ ���� ���Ͽ�
-- ���� �ֹ� ������ �Ѽ����� ���Ͻÿ�
-- ��, 2�� �̻� ������ ���� ���Ͻÿ�
select custid, count(*) as ��������
from orders
where saleprice >=8000
group by custid
having count(*)>=2;

-- group by having �� ���� ���� ����
-- group by�� ������ �׷����� ���� �� 
-- select������ group by���� ����� �Ӽ��� �����Լ��� ���� �� �ִ�
select sum(saleprice), bookid --Ʋ�� ��
from orders
group by custid;
select sum(saleprice), custid --�´� ��
from orders
group by custid;

-- where���� having���� ���� ���ѵ� sql���� �˻������� ��ȣ���� �� �ִ�
-- having�� ���� ����
-- 1. �ݵ�� group by ���� ���� �ۼ��ؾ� �Ѵ�
-- 2. where������ �ڿ� ���;� �Ѵ�
-- 3. �˻����ǿ��� sum, avg, max, min, count�� ���� ���� �Լ��� �;� �Ѵ�

-- group by ���� ���Ե� sql ���� ���� ����
select custid, count(*) as �������� ----- 5
from orders ---------------------------- 1
where saleprice>=8000 ------------------ 2
group by custid ------------------------ 3
having count(*)>1 ---------------------- 4
order by custid; ----------------------- 6



