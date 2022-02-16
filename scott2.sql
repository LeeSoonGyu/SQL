-- 사원 정보를 저장하기 위한 salesman 테이블을 생성한다.;
create table salesman (
id char(6),
name varchar2(12),
age number(3),
address varchar2(60)
);
commit;
desc salesman;

-- 게시판 정보를 저장하기 위한 board 테이블을 생성한다.;
create table board (
num number(4),
title varchar2(30),
author varchar2(12),
content varchar2(600),
writeday date default sysdate
);
desc board;

-- salesman 테이블에 sal 컬럼을 추가한다.;
alter table salesman
add (sal number(7, 2));
desc salesman;

-- salesman 테이블에 sal 컬럼의 최대 자릿수를 10자리로 수정한다.;
alter table salesman
modify (sal number(10, 2));
desc salesman;

-- salesman 테이블에 sal 컬럼을 삭제한다.;
alter table salesman
drop (sal);
desc salesman;

-- salesman 테이블을 삭제한다.;
drop table salesman;
select * from tab;

-- recyclebin 에서 삭제된 salesman 테이블의 정보를 확인한다.;
show recyclebin;
select * from recyclebin;
select * from user_recyclebin;

-- 삭제된 salesman 테이블을 복구한다.;
flashback table salesman to before drop;
select * from tab;

-- salesman 테이블을 완전히 삭제한다.;
drop table salesman;
purge recyclebin;
select * from tab;

-- board 테이블의 이름을 변경한다.;
rename board to copy_board;

-- copy_board 테이블의 저장공간을 삭제한다.;
truncate table copy_board;

-- 컬럼 레벨 방식으로 제약조건을 지정하여 customer 테이블 생성
create table customer(
num number(4) primary key,
name varchar2(12) not null,
address varchar2(60) unique,
age number(3) check(age >= 30)
);

-- emp 테이블에서 사원의 직급이 중복되는 값이 없도록 조회한다.;
select distinct job from emp;

-- dept 테이블에서 컬럼명 대신에 별칭을 이용해서 조회한다.
select dname as 부서명, loc as "부서 위치" from dept;

-- emp 테이블에서 사원의 연봉을 산술 연산자를 적용하여 조회한다.
select ename, sal, sal*12 from emp;

/*emp 테이블에서 커미션을 추가한 연봉을 조회하고 null 이면 null 값을 조회한다.
특정 컬럼에 대한 컬럼값이 없는 경우 해당 값이 null 이거나 null 을 포함한다.
null 은 할당되지 않았거나 알 수 없는 값이다.
null 은 0 이나 공백과는 다르며 0 은 숫자이며 공백은 문자이다.
모든 컬럼은 null 을 포함할 수 있지만, 제약조건인 not null 이나 primary key 가 지정된
컬럼에서는 null 을 사용할 수 없다.*/
select ename, sal, sal*12, comm, sal*12+comm from emp;

-- emp 테이블에서 특정 컬럼을 더블 버티컬바 연산자로 연결하여 조회한다
select empno||'-'||ename as 명단 from emp;

-- emp 테이블에서 급여가 2000이상인 사원만 조회한다.
select empno, ename, sal from emp
where sal >= 2000;

-- emp 테이블에서 직급이 CLERK이고 부서번호가 10인 사원의 정보를 조회한다.
select empno, ename, job, deptno from emp
where deptno = 10 and job = 'CLERK';

-- emp 테이블에서 직급이 MANAGER이거나 입사일이 1982년1월1일 이후에 입사한 사원의 정보를 조회한다.;
select empno, ename, job, hiredate from emp
where hiredate >= '1982/01/01' or job = 'MANAGER';

-- emp 테이블에서 입사일이 1981년5월5일과 1981년 12월31일 사이의 사원정보를 조회한다.
select empno, ename, hiredate from emp
where hiredate between '1981/0505' and '1981/12/31';

-- emp 테이블에서 급여가 1500과 4000사이가 아닌 사원정보를 조회한다.
select empno, ename, sal from emp
where sal not between 1500 and 4000;

-- emp 테이블에서 job이 MANAGER, SALESMAN, SALESOMAN인 사원의 정보를 조회한다.
select empno, ename, job from emp
where job in ('MANAGER', 'SALESMAN', 'SALESOMAN');

-- emp 테이블에서 사원번호가 7369, 7521, 7698이 아닌 사원의 정보를 조회한다.
select empno, ename, job from emp
where empno not in(7369, 7521, 7698);

-- emp 테이블에서 이름이 J 문자로 시작하는 사원의 정보를 조회한다.
select empno, ename, hiredate, sal from emp
where ename like 'J%';

-- emp 테이블에서 이름이 N문자로 끝나는 사원의 정보를 조회한다.
select empno, ename, hiredate, sal from emp
where ename like '%N';

-- emp 테이블에서 이름에서 두 번째 문자가 A 문자인 사원의 정보를 조회한다.
select empno, ename, hiredate, sal from emp
where ename like '_A%';

-- emp 테이블에서 이름에 N 문자를 포함하는 사원의 정보를 조회한다.
select empno, ename, hiredate, sal from emp
where ename like '%N%';

-- emp 테이블에서 이름에 N 문자를 포함하지 않는 사원의 정보를 조회한다.
select empno, ename, hiredate, sal from emp
where ename not like '%N%';

-- emp 테이블에서 이름이 FORD인 사원의 정보를 조회한다.
select empno, ename from emp
where ename = 'FORD';

-- emp 테이블에서 입사일이 1982년1월1일 이후에 입사한 사원의 정보를 조회한다.
select empno, ename, hiredate from emp
where hiredate >= '1982/01/01';

-- emp 테이블에서 커미션이 null인 사원의 정보를 조회한다.
select empno, ename, job, comm from emp
where comm is null;

-- emp 테이블에서 커미션이 null이 아닌 사원의 정보를 조회한다.
select empno, ename, job, comm from emp
where comm is not null;

-- 테이블의 구조와 데이터를 모두 복사하여 새로운 테이블을 생성한다.
create table sonboard
as
select * from copy_board;

-- 테이블의 데이터는 복사하지 않고 테이블의 구조만 복사한 새로운 테이블을 생성한다.
create table board
as
select * from sonboard
where 2=1;

-- emp 테이블에서 급여가 낮은 순으로 사원 정보를 조회한다.
select empno, ename, sal from emp
order by sal asc;

-- emp 테이블에서 입사일이 가장 최근인 순서로 사원정보를 조회한다.
select empno, ename, hiredate from emp
order by hiredate desc;

-- emp 테이블에서 급여 순으로 정렬하고 급여가 같으면 다시 이름순으로 조회한다.
select empno, ename, sal from emp
order by sal desc, ename;

-- board 테이블에 새로운 컬럼값을 저장한다.
insert into board(num, title, author, content)
values(1, '테스트', '홍길동', '테스트입니다');
select * from board;

-- dept 테이블에 새로운 부서 정보를 저장한다.
insert into dept(deptno, dname, loc)
values(50, '개발부', '서울');
select * from dept;

-- 부모 키가 존재하지 않는 데이터를 입력하면 오류가 발생한다.
insert into emp(empno, ename, deptmo)
values(6789, '홍길동', 70);
select * from emp;

-- dept 테이블의 부서번호가 50인 부서명을 기획실로 변경한다.
update dept
set dname = '기획실'
where deptno = 50;
select * from dept;

-- dept 테이블의 사원번호가 50인 컬럼값을 삭제한다.
delete from dept
where deptno = 50;
select * from dept;

delete from emp
where ename = '홍길동';
select * from emp;

-- 외래키가 존재하는 부모 테이블을 삭제하면 오류가 발생한다.
delete from dept
where deptno = 30;
select * from dept;
rollback;
select * from dept;

-- 입력 작업처리를 완료한다.
insert into dept(deptno, dname, loc)
values(50, '인사과', '부산');
commit;
select * from dept;

-- 삭제 작업처리를 취소한다.
delete from emp;
select * from emp;
rollback;
select * from emp;

-- 저장 지점만 작업처리를 취소한다.
insert into dept(deptno, dname, loc) values(60, '총무과', '광주');
savepoint a;
insert into dept(deptno, dname, loc) values(70, '개발과', '대구');
savepoint b;
select * from dept;
delete from dept where deptno = 60 or deptno = 70;
select * from dept;
rollback to savepoint a;
select * from dept;

-- test 계정을 만들어서 test 해볼것!!!
-- 최고관리자 SYS계정으로 접속하여 test 계정의 비밀번호를 변경한다.
alter user test identified by 1234;

-- 최고관리자 SYS계정으로 접속하여 test 계정을 삭제한다.
drop user test cascade;

-- 최고관리자 SYS 계정으로 접속하여 test 계정에 접속 권한을 부여한다.
grant create session to test;

-- 최고관리자 SYS 계정으로 접속하여 test 계정에 테이블 관련 권한을 부여한다.
grant create table to test;

-- 최고관리자 SYS 계정으로 접속하여 test 계정에 시퀀스 권한을 부여한다.
grant create sequence to test;

-- 최고관리자 SYS 계정으로 접속하여 test 계정에 뷰 생성 권한을 부여한다.
grant create view to test;

-- 최고관리자 SYS 계정으로 접속하여 test 계정에 접속과 자원에 관한 롤을 부여한다.
grant connect, resource to test;

-- 최고관리자 SYS 계정으로 접속하여 시퀀스 권한을 삭제한다.
revoke create sequence from test;