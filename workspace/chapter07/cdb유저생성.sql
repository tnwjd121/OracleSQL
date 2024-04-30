-- system 계정으로 접속 및 실행
-- cdb 사용자 생성한다
-- cdb 사용자 생성을 위해 c##을 붙인다
create user c##university identified by university;
-- 모든 권한 주기
grant connect, resource, dba to c##university;

--변경 사항을 적용한다
commit;