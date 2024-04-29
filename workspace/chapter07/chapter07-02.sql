-- ���Ȱ� ����
-- �α��� ����� ����
-- �����ͺ��̽��� �����ϴ� �� ����ڴ� ����� ID�� ������ ������
-- ��й�ȣ�� ������ ���ȴ�

-- ���� ����
-- ��� ������ ���̺� ������ SQL���� ����ں��� �����ؼ� ������ �� �ִ� ������ ���� ���� �ȴ�

-- ���̺����̽��� �α��� ����� ����
-- ����Ŭ�� ������������ ������ ������ ���̺����̽� ������ ���ȴ�
-- ����Ŭ���� ���̺����̽��� ����� �ű� ����ڸ� �����Ͽ�
-- �Ҵ��ϴ� ������ ���캸��
-- ����Ŭ �����ϴ� USER�� system,sys�� �ֽ��ϴ�.

-- CDB, PDB
-- CDB�� �⺻������ DB�� �����Ǹ� default�� �����ϴ� cdb ��ü ������ 
-- ��) ����Ʈ
-- PDB�� ����� ��Ű��, ������ �ڵ�� ��Ÿ �����ͺ��̽� ���� ������Ʈ�� ��� �ִ� ������ ���� ��ü�̴�
-- �ϳ��� CDB�� ���� ���� PDB�� ���� �� �ִ�
-- ��) ����Ʈ ���� ������ �����ڸ� ����
-- cdb user�� c##�� �տ� �پ�� �Ѵ�

-- xe������ ��� xepd1�̶�� �̸����� pdb�� �����Ǿ� �ִ�

-- ���̺����̽� �����ϱ�
-- ���̺����̽��� ����Ŭ���� �����͸� ������ �� ����ϴ� 
-- ������ ��������� �ǹ��Ѵ�
-- �ڵ����� ��������� �ý��� ���̺����̽��� �ְ�
-- ����ڰ� �ʿ信 ���� ����� ����ϴ� ����� ���̺����̽��� �ִ�

-- ��) �����͸� ����ϱ� ���ؼ� ���

-- ��� ���̺����̽� ����
-- DBA(�ְ� ������) ������ �ο��� system �������θ� ������ �� �ִ�.
-- create tablespace ����
/*
    create tablespace ���̺����̽���
    datafile "����� ��� �� ����� ���ϸ�"
    size ���� ����
*/

-- 10m�� �뷮�� ���� ���̺� �����̽��� md_tbs,mb_test��
-- C:\Users\ITPS\Documents\dev\database\sqldeveloper\workspace\chapter07
-- ������ �����Ͻÿ�
-- �̶� ���������� �̸��� ���� md_tbs_data01.dbf, md_test_data01.dbf
-- (���� ��ġ�� ������ ������ �̸� �����ؾ� �Ѵ�)
create tablespace md_tbs1
datafile 'C:\Users\ITPS\Documents\dev\database\sqldeveloper\workspace\chapter07\md_tbs.data01.dbf'
size 10M;

create tablespace md_tbs
datafile 'C:\dev\md_tbs_data01.dbf'
size 10M;

create tablespace md_test
datafile 'C:\dev\md_test_data01.dbf'
size 10M;

--drop tablespace
-- ���̺� �����̽� ������ ����ϴ� ��ɾ�
-- ����
/*
    drop tablespace ���̺� �����̽���
    [including contents [and datafiles][cascade constraints]] 
*/

-- including contents : ���̺����̽��� ��� �����͸� �����Ѵ�
-- and datafiles : os���� �������� ������ ������ �����Ѵ�
-- (�� �ɼ��� ���ٸ� ���� ������ ������ �������� �ʴ´�)
-- cascade constranints : �ٸ� ���̺����̽��� ���̺�κ��� �����Ǵ� �������ǵ���� ��� �����Ѵ�

--md_test ���̺����̽��� ������ ���ϱ��� �����Ͽ� ��� �����Ͻÿ�
drop tablespace md_test including contents and datafiles;
-- �ű� ����� ���� �����ϱ�
-- create user
-- ����� ������ �����ϴ� ����̴�
-- ����
/*
create user [����� �̸�]
    indentified by [��й�ȣ]
    default tablespace [���̺����̽�];
*/

-- default tablespace�� �������� ������ ����Ŭ���� �⺻���� users ���̺����̽��� �Ҵ��Ѵ�

-- alter user
-- ��й�ȣ�� ���� ����� ������ ������ �����ϴ� ����̴�
-- ����
/*
    alter user [������̸�]
        identified by [��й�ȣ];
*/

-- drop user
-- ����� ������ �����ϴ� ����̴�.
-- casecade�� ����ϸ� ���� ������ ����ڰ� ������ ��� �����͸� ���� �����Ѵ�
--����
/*
    drop user [����� �̸�] casecade;
*/
-- ���ο� ����� mdguest�� �����Ͻÿ�. ��й�ȣ�� mdguest, 
-- ���̺� �����̽��� �⺻���� users�� �����Ѵ�
create user mdguest
    identified by mdgues;
    
-- ���ο� ����� mdguest2�� �����Ͻÿ�. ��й�ȣ�� mdguest2,
-- �׽�Ʈ�����̽��� �տ��� ������ md_tbs�� �����Ѵ�
create user mdguest2 identified by mdguest2
default tablespace md_tbs;

-- ���� ����
