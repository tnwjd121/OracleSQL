-- ���� ����
-- ���̺��� ������ �����̹Ƿ� ���̺� ���� ���տ����� �̿��Ͽ�
-- ������, ������, �������� ���� �� �ִ�
-- sql���� ���տ���
-- ������ union
-- ������ minus
-- ������ intersect

-- ������ �ֹ����� ���� ���� �̸��� ���̽ÿ�.
select name
from customer
minus
select name
from customer
where custid in(select custid from orders);

-- existis
-- existis�� ��� �μ����ǹ� �����̴�
-- ���ǿ� �´� ������ �����ϸ� ����� ���� ��Ų��
-- not existis�� �μ����ǹ��� ��� ���� ���ǿ� �������� ���� ���� ���̴�

-- �ֹ��� �ִ� ���� �̸��� �ּҸ� ���̽ÿ�.
select name, address
from customer c
where exists (select * 
    from orders o
    where c.custid=o.custid);



