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

