-- 빅데이터 저장 시스템 개발 포트폴리오 답안지 이순규

-- 1번 상품정보 테이블 생성
-- 대문자 소문자 구분없이 조회 가능
create table GoodsInfo (
proCode char(5) primary key,
proName varchar2(30) not null,
price number(8) not null,
maker varchar2(25) not null
);

-- 2번 생성된 테이블에 레코드 추가
-- 가격자리 한글 기입 불가(number설정) 규격에 맞춰 기입
insert into GoodsInfo values (1001, '냉장고', 1800000, 'SM');
insert into GoodsInfo values (1002, '세탁기', 500000, 'LN');
insert into GoodsInfo values (1003, 'HDTV', 250000, 'HP');
insert into GoodsInfo values (1004, '전자레인지', 200000, 'SM');
insert into GoodsInfo values (1005, '오디오', 700000, 'LN');
insert into GoodsInfo values (1006, 'PC', 800000, 'HP');

-- 3번 두줄을 주석문 처리하시오.
/*SQL 포트폴리오
이순규*/

-- 4번 전체 레코드 검색
select * from goodsinfo;

-- 5번 테이블 구조 확인
desc goodsinfo;

-- 6번 테이블에서 상품코드 1002의 proname과 price컬럼값을 연결
select proname, price, concat(proname, price) from goodsinfo
where procode = 1002;

-- 7번 테이블에서 상품코드 1006의 maker컬럼값 문자열에서 HP문자를 HQ로 대체후 조회
select procode, maker, replace(maker, 'HP', 'HQ') from goodsinfo
where procode = 1006;

-- 8번 테이블에서 가격이 60만원 이상인 상품과 가격을 구하시오
select * from goodsinfo where price > 600000;

-- 9번 테이블에서 상품번호 1006 제품명을 노트북으로 변경하고 내용 확인
update goodsinfo set proname = '노트북' where procode = 1006;
select * from goodsinfo where procode = 1006;

-- 10번 테이블에서 상품번호가 1002인 상품의 가격보다 비싼 상품을 조회
select * from goodsinfo where procode = 1002;
select * from goodsinfo where price > 500000
order by procode, proname, price, maker;
