#날짜 : 2024/07/04
#이름 : 박준영
#내용 : 4장 SQL고급

#실습 4-1
CREATE TABLE `Member` (
	`uid`	VARCHAR(10) PRIMARY KEY,
	`name`	VARCHAR(10) NOT NULL,
	`hp`	CHAR(13) UNIQUE NOT NULL,
	`pos`	VARCHAR(10) default '사원',
	`dep`	TINYINT,
	`rdate`	DATETIME  NOT NULL
);

CREATE TABLE `Department` (
	`depNo`	TINYINT PRIMARY KEY,
	`name`	VARCHAR(10) NOT NULL,
	`tel`	CHAR(12) NOT NULL
);

CREATE TABLE `Sales` (
	`no`	INT AUTO_INCREMENT PRIMARY KEY,
	`uid`	VARCHAR(10) NOT NULL,
	`year`	YEAR NOT NULL,
	`month`	TINYINT NOT NULL,
	`sale`	INT
);


#실습 4-2
INSERT INTO `Member` VALUES ('a101', '박혁거세', '010-1234-1001', '부장', 101, '2024-07-03 14:33:21');
INSERT INTO `Member` VALUES ('a102', '김유신',   '010-1234-1002', '차장', 101, NOW());
INSERT INTO `Member` VALUES ('a103', '김춘추',   '010-1234-1003', '사원', 101, NOW());
INSERT INTO `Member` VALUES ('a104', '장보고',   '010-1234-1004', '대리', 102, NOW());
INSERT INTO `Member` VALUES ('a105', '강감찬',   '010-1234-1005', '과장', 102, NOW());
INSERT INTO `Member` VALUES ('a106', '이성계',   '010-1234-1006', '차장', 103, NOW());
INSERT INTO `Member` VALUES ('a107', '정철',     '010-1234-1007', '차장', 103, NOW());
INSERT INTO `Member` VALUES ('a108', '이순신',   '010-1234-1008', '부장', 104, NOW());
INSERT INTO `Member` VALUES ('a109', '허균',     '010-1234-1009', '부장', 104, NOW());
INSERT INTO `Member` VALUES ('a110', '정약용',   '010-1234-1010', '사원', 105, NOW());
INSERT INTO `Member` VALUES ('a111', '박지원',   '010-1234-1011', '사원', 105, NOW());

INSERT INTO `Department` VALUES (101, '영업1부', '051-512-1001');
INSERT INTO `Department` VALUES (102, '영업2부', '051-512-1002');
INSERT INTO `Department` VALUES (103, '영업3부', '051-512-1003');
INSERT INTO `Department` VALUES (104, '영업4부', '051-512-1004');
INSERT INTO `Department` VALUES (105, '영업5부', '051-512-1005');
INSERT INTO `Department` VALUES (106, '영업지원부', '051-512-1006');
INSERT INTO `Department` VALUES (107, '인사부', '051-512-1007');

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a101', 2018, 1,  98100);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2018, 1, 136000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2018, 1,  80100);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2018, 1,  78000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2018, 1,  93000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a101', 2018, 2,  23500);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2018, 2, 126000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2018, 2,  18500);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2018, 2,  19000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a106', 2018, 2,  53000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a101', 2019, 1,  24000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2019, 1, 109000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2019, 1, 101000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2019, 1,  53500);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a107', 2019, 1,  24000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2019, 2, 160000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2019, 2, 101000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2019, 2,  43000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2019, 2,  24000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a106', 2019, 2, 109000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2020, 1, 201000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2020, 1,  63000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2020, 1,  74000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a106', 2020, 1, 122000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a107', 2020, 1, 111000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2020, 2, 120000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2020, 2,  93000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2020, 2,  84000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2020, 2, 180000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a108', 2020, 2,  76000);

#실습 4-3
select * from `member` where `name`='김유신';
select * from `member` where `pos`='차장' and `dep`=101;
select * from `member` where `pos`='차장' or `dep`=101;
select * from `member` where `name` != '김춘추';
select * from `member` where `name` <> '김춘추';
select * from `member` where `pos` = '사원' or `pos` = '대리';
select * from `member` where `pos` in('사원', '대리');
select * from `member` where `dep` in(101, 102, 103);
select * from `member` where `name` like '%신';
select * from `member` where `name` like '김%';
select * from `member` where `name` like '김__';
select * from `member` where `name` like '%성_';
select * from `member` where `name` like '정_';
select * from `sales` where `sale` > 50000;
select * from `sales` where `sale` >= 50000 and `sale` < 100000 and  'month'=1;
select * from `sales` where `sale` between 50000 and 100000;
select * from `sales` where `sale` not between 50000 and 100000;
select * from `sales` where `year` in(2020);
select * from `sales` where `month` in(1,2);



#실습 4-4  오름/내림 차순으로 정렬
select * from `sales` order by `sale`; # 가격 오름차순 
select * from `sales` order by `sale` asc;
select * from `sales` order by `sale` desc; # 가격 내림차순 
select * from `member` order by `name`;
select * from `member` order by `name` asc;
select * from `member` order by `name` desc;
select * from `sales` where `sale` > 50000 order by `year`, `month`, `sale` desc;



#실습 4-5 투플 개수를 제한 ( 투플 = 행 )
select * from `sales` limit 3;  # 투플( 행 ) 을 3개로 제한
select * from `sales` limit 0, 3; 
select * from `sales` limit 1, 2; # 1번째 행까지 제외하고 2개의 행을 반환
select * from `sales` limit 5, 3; # 5번째 행까지 제외하고 3개의 행을 반환
select * from `sales` order by `sale` desc limit 3, 5; # 테이블의 모든 열을 내림차순으로 정렬 후 3번쩨 행까지 제외 후 반환
select * from `sales` where `sale` < 50000 order by `sale` desc limit 3;
select * from `sales` where `sale` > 50000 order by `year` desc, `month`, `sale` desc limit 5;




#실습 4-6 칼럼을 별치으로 사용하기 (select 칼럼명 as 별칭 from 테이블명;)
select sum(sale) as '합계' from `sales`; 	# sum(칼럼) = 칼럼 총 합계
select avg(sale) as '평균' from `sales`; 	# avg(칼럼) = 칼럼 평균
select max(sale) as '최대값' from `sales`;  	# max(칼럼) = 칼럼의 최대값
select min(sale) as '최소값' from `sales`; 	# min(칼럼) = 칼럼의 최소값 
select ceiling(1.2); 						#ceiling(숫자) = 올림값 
select ceiling(1.8);
select floor(1.2);							#floor(숫자) = 내림값
select floor(1.8);
select round (1.2);							#round(숫자) = 반올림
select round (1.8);
select rand ();								#rand() = 0 ~ 1 사이 임의의 실수
select ceiling(rand() * 10);
select count(sale) as '갯수' from `sales`;	#count (칼럼) = 해당 칼럼 열 값이 null이 아닌 값들의 개수를 세어 반환
select count(*) as '갯수' from `sales`;		#count (*) =
select left ('hello world', 5);				#lefr(문자열, size) = 문자열에서 왼쪽 size 만큼 조회
select right('hello world', 7);				#right(문자열, size) = 문자열에서 오른쪽 size 만큼 조회 ( 띄어쓰기 포함 )
select substring('helloWorld',6, 5);		#substring(문자열, start, size) = 문자열에서 start 부터 size 만큼 조회
select concat('hello', 'world');			#concat(문자열1, 문자열2) = 문자열1과 문자열2 연결 
select concat(`uid`, `name`, `hp`) from `member` where `uid` = 'a108';
select curdate();							#현재 날짜 조회
select curtime();							#현재 시간 조회 
select now();								#현재 날짜와 시간(초단위) 조회
insert into `member` values ('a112', '유관순', '010-1234-1012', '대리', 107, now());



#실습 4-7 2018년 1월 매출의 총 합 
select sum(sale) as '2018년 1월 매출의 총합' from `sales`where `year` = 2018 and `month` = 1;

#실습 4-8 2019년 2월에 5만원 이상 매출에 대한 총합과 평균 

select 
	SUM(`sale`) as `총합`,
    AVG(`sale`) as `평균`
from `Sales` 
where 
	`year`= 2019 and 
    `month`=2 and
    `sale` >= 50000;



#실습 4-9

select 
	min(sale) as '최저값',
	max(sale) as '최대값'
from `sales`
where `year` = 2020;



#실습 4-10 그룹별 조회

SET SESSION sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

select * from `sales` group by `uid`;
select * from `sales` group by `year`;
select * from `sales` group by `uid`, `year`;
select `uid`, count(*) as `건수` from `sales` group by `uid`; 		#uid 열을 기준으로 그룹화
select `uid`, SUM(`sale`) as `합계` from `sales` group by `uid`;
select `uid` , avg(`sale`) as `평균` from `sales` group by `uid`;

select `uid`, `year`, sum(sale) as '합계' 
from `sales`
group by `uid`, `year`;


#실습 4-11






 
#실습 4-12
create table `sales2` like `sales`; # 테이블 복사
insert into `sales2` select * from `sales`; # 데이터 복사

set sql_safe_updates=0;
update `sales2` set `year` = `year` + 3; 

select * from `sales` where `sale` >= 100000
union
select * from `sales2` where `sale` >= 100000;

#실습 4-13
select * from `sales` inner join `member` on `sales` .`uid` = `member`.`uid`; # inner 생략 가능
select * from `sales` as a join `member` as b on a.uid = b.uid;
select * from `sales` as a join `member` using(`uid`);
select *from `member` as a join `department` as b on a.dep = b.depNo;
select 
	a.`no`
    a.`uid`
	a.`sale`
    b.`name`
    b.`pos`
    from `sales` as a join `member` using(`uid`);

#실습 4-14

#실습 4-15
#실습 4-16
#실습 4-17
