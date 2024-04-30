-- ��Ż�� ����
-- ����(������ȣ(�⺻Ű), ������, ��ġ)
-- �׸� ����(�׸���ȣ(�⺻Ű),������ȣ(�ܷ�Ű), �׸��̸�, �帣, ���̵�, ����)
-- ����(������ȣ(�ܷ�Ű), ������ȣ(�⺻Ű), �����̸�, ����, ����)
-- ��(����ȣ(�⺻Ű), ������̸�, ����, ����)
-- �湮(�湮��ȣ(�⺻Ű), �׸���ȣ(�ܷ�Ű), ����ȣ(�ܷ�Ű),�湮�ο�, ��¥, ������ȣ(�ܷ�Ű))

create table escape_branch(
    bid number primary key,
    bname varchar2(20),
    baddr varchar2(20)
);

create table thema(
    tid number primary key,
    bid number,
    tname varchar2(20),
    tgenre varchar2(20),
    tlevel number,
    price number,
    foreign key (bid) references escape_branch(bid)
);


create table emp(
    bid number,
    eid number primary key,
    ename varchar2(20),
    esex varchar2(10),
    eage number,
    foreign key (bid) references escape_branch(bid)
);

create table customer (
    cid number primary key,
    cname varchar2(20),
    csex varchar2(10),
    cage number
);

create table  visit (
    vid number primary key,
    tid number,
    cid number,
    visitnum number,
    vdate date,
    eid number,
    foreign key (tid) references thema(tid),
    foreign key (cid) references customer(cid),
    foreign key (eid) references emp(eid)
);


-- �׸� ���� �Է�
-- ������
insert into thema values(1,1, '������ ��', '����', 2, 20000);
insert into thema values(2,1, '�������� ��', '��Ÿ��', 1, 24000);
insert into thema values(3,1, '������ ��', '������', 5, 18000);
-- �漺����
insert into thema values(4,2, '������', '��Ÿ��', 5, 28000);
insert into thema values(5,2, '�б� ����', '����', 1, 17000);
insert into thema values(6,2, '����� ����', '��Ÿ��', 4, 22000);
insert into thema values(7,2, '������ ������', '������', 3, 20000);
-- �ؿ����
insert into thema values(8,3, '������ ã�ƶ�', '��Ÿ��', 4, 30000);
insert into thema values(9,3, '��ü�� ����', '������', 2, 23000);
-- �ϴ���
insert into thema values(10,4, '�����', '��Ÿ��', 3, 30000);
insert into thema values(11,4, '����ã��', '��Ÿ��', 5, 26000);
insert into thema values(12,4, '���񿬱�', '����', 1, 24000);
-- ������
insert into thema values(13,5, '�ٸ���', '��Ÿ��', 2, 32000);
insert into thema values(14,5, '�˸��ٹ�', '��Ÿ��', 5, 32000);

-- ���� ���� �Է�
insert into emp values(1, 1, '������', '��', 21);
insert into emp values(1, 2, '������', '��', 20);

insert into emp values(2, 3, '������', '��', 21);
insert into emp values(2, 4, '������', '��', 22);

insert into emp values(2, 5, '������', '��', 20);
insert into emp values(3, 6, '���þ�', '��', 23);
insert into emp values(3, 7, '�赵��', '��', 27);

insert into emp values(4, 8, '�����', '��', 25);
insert into emp values(4, 9, '�ڼ���', '��', 24);

insert into emp values(5, 10, '��Ƹ�', '��', 26);
insert into emp values(5, 11, '�輱��', '��', 22);