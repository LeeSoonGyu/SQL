-- sql 실습 --
-- emp 데이터 불러오기 (scott.sql) 이용 --
INSERT INTO EMP VALUES
(7369,'SMITH','CLERK',7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20);
INSERT INTO EMP VALUES
(7499,'ALLEN','SALESMAN',7698,to_date('20-2-1981','dd-mm-yyyy'),1600,300,30);
INSERT INTO EMP VALUES
(7521,'WARD','SALESMAN',7698,to_date('22-2-1981','dd-mm-yyyy'),1250,500,30);
INSERT INTO EMP VALUES
(7566,'JONES','MANAGER',7839,to_date('2-4-1981','dd-mm-yyyy'),2975,NULL,20);
INSERT INTO EMP VALUES
(7654,'MARTIN','SALESMAN',7698,to_date('28-9-1981','dd-mm-yyyy'),1250,1400,30);
INSERT INTO EMP VALUES
(7698,'BLAKE','MANAGER',7839,to_date('1-5-1981','dd-mm-yyyy'),2850,NULL,30);
INSERT INTO EMP VALUES
(7782,'CLARK','MANAGER',7839,to_date('9-6-1981','dd-mm-yyyy'),2450,NULL,10);
INSERT INTO EMP VALUES
(7788,'SCOTT','ANALYST',7566,to_date('13-JUL-87')-85,3000,NULL,20);
INSERT INTO EMP VALUES
(7839,'KING','PRESIDENT',NULL,to_date('17-11-1981','dd-mm-yyyy'),5000,NULL,10);
INSERT INTO EMP VALUES
(7844,'TURNER','SALESMAN',7698,to_date('8-9-1981','dd-mm-yyyy'),1500,0,30);
INSERT INTO EMP VALUES
(7876,'ADAMS','CLERK',7788,to_date('13-JUL-87')-51,1100,NULL,20);
INSERT INTO EMP VALUES
(7900,'JAMES','CLERK',7698,to_date('3-12-1981','dd-mm-yyyy'),950,NULL,30);
INSERT INTO EMP VALUES
(7902,'FORD','ANALYST',7566,to_date('3-12-1981','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP VALUES
(7934,'MILLER','CLERK',7782,to_date('23-1-1982','dd-mm-yyyy'),1300,NULL,10);
commit

-- emp 테이블에서 desc 명령어로 구조를 확인.;
desc emp;

-- scott 계정으로 접속하여 scott 계정의 소유 테이블을 tab 시스템 테이블로 확인한다.;
select * from tab;

-- 최고 관리자인 sys계정으로 접속하여 오라클의 모든계정을 all_users 시스템 테이블로 확인한다.;
select username from all_users;

/*emp 테이블의 ename컬럼값인 영문자를 소문자로 변환하여 조회한다.*/
select empno, ename, hiredate from emp
where lower(ename) ='ford';

-- emp 테이블의 ename 컬럼값인 영문자를 대문자로 변환하여 조회한다.;
select empno, ename, hiredate from emp
where ename = upper('ford');

/*dept 테이블의 dname 컬럼값인 영문자와 loc 컬럼값인 영문자에서 각 단어의 첫번째 문자를
대문자로 나며지 문자는 소문자로 변환하여 조회한다.*/
select deptno, initcap(dname), initcap(loc) from dept
where deptno = 10;

-- dept 테이블에서 dname 컬럼값과 loc 컬럼값을 연결한다.;
select deptno, dname, concat(deptno, dname) from dept
where deptno = 10;

/*emp 테일블의 ename 컬럼값인 영문자의 1번째 문자에서 시작하여 2번째 문자까지만
조회한다.*/
select substr(ename, 1, 2) from emp;

-- dept 테이블의 dname 컬럼값인 문자의 길이를 구한다.;
select deptno, dname, length(dname) from dept
where deptno = 10;

-- dept 테이블의 dname 컬럼값에서 명명된 문자의 위치를 구한다.;
select deptno, dname, instr(dname, 'G') from dept
where deptno = 10;

-- dept 테이블에서 loc 컬럼에서 특정 문자를 가진 행만 조회한다.;
select deptno, dname, loc from dept
where instr(loc, 'DALLAS') > 0;

-- dept 테이블에서 loc 컬럼에서 특정 문자열을 가진 행을 제외하고 조회한다.;
select deptno, dname, loc from dept
where instr(loc, 'DALLAS') < 1;

-- dept 테이블의 dname 컬럼에 *문자를 지정한 15만큼 왼쪽 자리를 채운다.;
select deptno, dname, lpad(dname, 15, '*') from dept
where deptno = 10;

-- dept 테이블의 dname 컬럼에 *문자를 지정한 15만큼 오른쪽 자리를 채운다.;
select deptno, dname, rpad(dname, 15, '*') from dept
where deptno = 10;

-- dept 테이블의 dname 컬럼값인 문자의 양 끝에 있는 공백 문자를 제거한다.;
select deptno, dname, trim(both '' from dname) from dept
where deptno = 10;

-- dept 테이블의 dname 컬럼값인 문자의 오른쪽에 있는 공백 문자를 지운다.;
select deptno, dname, trim(leading '' from dname) from dept
where deptno = 10;

-- dept 테이블의 dname 컬럼값인 문자열에서 NG 문자를 SO문자로 대체한다.;
select deptno, dname, translate(dname, 'NG', 'SO') from dept
where deptno = 10;

-- dept 테이블의 dname 컬럼값에 공백 문자열을 빈 문자열로 대체한다.;
select deptno, dname, replace(dname, ' ', '') from dept
where deptno = 10;

-- dual 테이블에서 45.926을 소수점 두자리에서 반올림한다.;
select round(45.926, 2) from dual;

-- dual 테이블에서 45.926을 소수점 두자리에서 절삭한다.;
select trunc(45.926, 2) from dual;

-- dual 테이블에서 1600을 300으로 나눈 나머지를 반환한다.;
select mod(1600, 300) from dual;

-- dual 테이블에서 시스템의 현재 날짜를 구한다.;
select sysdate from dual;

-- emp 테이블에서 입사 날짜와 현재 날짜의 근무 개월 수를 조회한다.;
select ename, hiredate, sysdate, months_between(sysdate, hiredate) from emp
where deptno = 10;

-- emp 테이블에서 입사 날짜로부터 5개월이 지난 후의 날짜를 조회한다.;
select ename, hiredate, add_months(hiredate, 5) from emp
where deptno = 10;

-- emp 테이블에서 입사일로부터 돌아오는 금요일을 조회한다.;
select ename, hiredate, next_day(hiredate, '금요일') as 월 from emp
where deptno = 10;

-- emp 테이블에서 해당 날짜에 대한 월의 말일 날짜를 조회한다.;
select ename, hiredate, last_day(hiredate) as 월 from emp
where deptno = 10;

-- emp 테이블에서 입사일과 현재 날짜의 근무 개월 수를 반올림하여 조회한다.;
select ename, hiredate, sysdate, round(months_between(sysdate, hiredate)) 월수 from emp
where deptno = 10;

-- emp 테이블에서 입사일과 현재 날짜의 근무 개월 수를 절삭하여 조회한다.;
select ename, hiredate, sysdate, trunc(months_between(sysdate, hiredate)) 월수 from emp
where deptno = 10;

-- dual 테이블에서 현재 날짜를 년 월 일이라는 한글 형식을 적용하여 포맷 서식으로 조회한다.;
select sysdate, to_char(sysdate, ' YYYY"년"MM"월"DD"일" ') from dual;

-- dual 테이블에서 포맷 서식으로 현재 시각을 조회한다.;
select sysdate, to_char(sysdate, 'hh24:mi:SS') from dual;

-- emp 테이블에서 포맷 서식으로 입사 년도만 출력하여 조회한다.;
select empno, ename, to_char(hiredate, 'yyyy') as 년도 from emp;

-- emp 테이블에서 급여를 6자리로 바꾸고 앞에 $ 숫자 포맷 서식으로 변환하여 조회한다.;
select empno, ename, to_char(sal, '$999,999') as 급여 from emp;

-- dual 테이블에서 문자열을 숫자 포맷 서식으로 변환하여 조회한다.;
select to_number('1234', '9999') from dual;

-- emp 테이블에서 사원 테이블의 커미션을 추가한 연봉을 조회하고 null이면 0으로 조회한다.;
select ename, sal, sal*12, comm, sal*12+nvl(comm, 0) from emp;

-- emp 테이블에서 커미션을 받는 사원 수와 전체 행 갯수를 구한다.;
select count(*), count(comm) from emp;

-- emp 테이블에서 급여의 최대값을 구한다.;
select max(sal) from emp;

-- emp 테이블에서 최근 입사일을 구한다.;
select max(hiredate) from emp;

-- emp 테이블에서 급여의 최소값을 구한다.;
select min(sal) from emp;

-- emp 테이블에서 최초 입사일을 구한다.;
select min(hiredate) from emp;

-- emp 테이블에서 급여의 합을 구한다.;
select sum(sal) from emp;

-- emp 테이블에서 급여의 평균을 구한다.;
select avg(sal) from emp;

-- emp 테이블에서 급여의 분산을 구한다.;
select variance(sal) from emp;

-- emp 테이블에서 급여의 실질적인 분포를 구한다.;
select stddev(sal) from emp;

