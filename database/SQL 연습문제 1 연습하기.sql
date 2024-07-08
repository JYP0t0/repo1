#날짜 : 2024/07/08
#이름 : 박준영
#내용 : SQL 연습문제1 실습하기

#실습1-1
create database `shop`;
create user `shop`@`%` identified by '1234';
grant all privileges on `shop`.*to 'shop'@'%';
flush privileges;

#실습1-2
create table `customer` (
	`custid`	varchar(10)	primary key,
    `name` 		varchar(10) not null,
    `hp`		varchar(13) default null,  
    `addr`		varchar(100)default null,
    `rdate`		date 		not null
    );
    
create table `product` (
	`prodNo`	int 			primary key, 
    `prodName`	varchar(10) 	not null,
    `stock`		int 			default 0, #(고치기 전)not null
    `price`		int				default null, #(고치기 전) x
    `company`	varchar(20) 	not null
    );
    
create table `order` (
	`orderNo`		int 		auto_increment primary key,
    `orderId`		varchar(10) not null,
    `orderProduct`	int 		not null,
    `orderCount`	int 		default 1, #(고치기 전) x
    `orderDate`		datetime 	not null
    );
    
    
#실습1-3
insert into `customer` values ('c101', '김유신', '010-1234-1001', '김해시 봉황동', '2022-01-01');
insert into `customer` values ('c102', '김춘추', '010-1234-1002', '경주시 보문동', '2022-01-02');
insert into `customer` values ('c103', '장보고', '010-1234-1003', '완도구 청산면', '2022-01-03');
insert into `customer` values ('c104', '강감찬', '010-1234-1004', '서울시 마포구', '2022-01-04');
insert into `customer` values ('c105', '이성계', null, null,  '2022-01-05');
insert into `customer` values ('c106', '정철', '010-1234-1006', '경기도 용안시', '2022-01-06');
insert into `customer` values ('c107', '허준', null, null, '2022-01-07');
insert into `customer` values ('c108', '이순신', '010-1234-1008', '서울시 영등포구', '2022-01-08');
insert into `customer` values ('c109', '송상현', '010-1234-1009', '부산시 동래구', '2022-01-09');
insert into `customer` values ('c110', '정약용', '010-1234-1010', '경기도 광주시', '2022-01-10');

insert into `product` values (1, '새우깡', 5000, 1500, '농심');
insert into `product` values (2, '초코파이', 2500, 2500, '오리온');
insert into `product` values (3, '포카칩', 3600, 1700, '오리온');
insert into `product` values (4, '양파링', 1250, 1800, '농심');
insert into `product` values (5, '죠리퐁', 2200, null, '크라운');
insert into `product` values (6, '마가렛트', 3500, 3500, '롯데');
insert into `product` values (7, '뿌셔뿌셔', 1650, 1200, '오뚜기'); 

insert into `order` values (1, 'c102', 3, 2, '2024-07-01 13:15:10'); 
insert into `order` values (2, 'c101', 4, 1, '2024-07-01 14:16:11'); 
insert into `order` values (3, 'c108', 1, 1, '2024-07-01 17:23:18'); 
insert into `order` values (4, 'c109', 6, 5, '2024-07-02 10:46:36'); 
insert into `order` values (5, 'c102', 2, 1, '2024-07-03 09:15:37'); 
insert into `order` values (6, 'c101', 7, 3, '2024-07-03 12:35:12'); 
insert into `order` values (7, 'c110', 1, 2, '2024-07-03 16:55:36'); 
insert into `order` values (8, 'c104', 2, 4, '2024-07-04 14:23:23'); 
insert into `order` values (9, 'c102', 1, 3, '2024-07-04 21:54:34'); 
insert into `order` values (10, 'c107', 6, 1, '2024-07-05 14:21:03'); 


#실습1-4 고객 테이블에 존재하는 모든 속성 조회
select*from `customer`;


#실습1-5 고객 테이블에서 고객 아이디, 이름, 휴대폰 번호 조회 
select `custid`, `name`, `hp` from `customer`;


#실습1-6 제품 테이블에 존재하는 모든 속성 조회
select*from `product`;


#실습1-7 제품 테이블에서 제조업체 조회
select `company` from `product`;


#실습1-8 제품 테이블에서 제조업체를 중복 없이 조회 
select distinct `company` from `product`;
#(중복 없이 조회 컬럼 앞에 distinct 사용)

#실습1-9 제품 테이블에서 제품 명과 단가 조회
select `prodName`, `price` from `product`;


#실습1-10 제품 테이블에서 제품명과 단가를 조회하되, 단가에 500원을 더해 '조정단가'로 출력
select `prodName`, `price`+ 500 from `product`;


#실습1-11 제품 테이블에서 오리온이 제조한 제품의 제품명, 재고량, 단가를 조회 
select `prodName`, `stock`, `price` from `product` where `company` = '오리온';


#실습1-12 주문 테이블에서 'c102' 고객이 주문한 주문제품, 수량, 주문일자를 조회
select `orderProduct`, `orderCount`, `orderDate` from `order` where `orderId` = 'c102';


#실습1-13 주문 테이블에서 'c102' 고객이 2개이상 주문한 주문제품, 수량, 주문일자를 조회 
select `orderProduct`, `orderCount`, `orderDate` from `order` where `orderId` = 'c102'and `orderCount` > 1 ;


#실습1-14 제품 테이블에서 단가가 1000원 이상 2000원 이하인 제품을 조회 
select*from `product` where 1000 <= `price` and `price` <= 2000;


#실습1-15 고객 테이블에서 성이 김씨인 고객의 아이디, 이름, 휴대폰, 주소를 조회 
select `custid`, `name`, `hp`, `addr` from `Customer` where `name` like '김__';
#( '김%' = '김__' )

#실습1-16 고객 테이블에서 고객 이름이 2자인 고객의 아이디, 이름, 휴대폰, 주소를 조회
select `custid`, `name`, `hp`, `addr` from `Customer` where char_length(name) = 2;
#(`length() 함수 조회`) 문자열일 경우 `char_length()` 함수 사용 or `name` like '__';

#실습1-17 고객 테이블에서 휴대폰 번호가 입력되지 않은 고객 조회 
select*from `customer` where `hp`is null;
#(null값 조회) 칼럼명 + is null

#실습1-18 고객 테이블에서 주소가 입력된 고객 조회
select*from `customer` where `addr`  is not null;
#(null 값이 아닌 행 조회) is not null 사용


#실습1-19 고객 테이블에서 가입일을 내림차순으로 정렬하여 고객 조회
select*from `customer` order by `rdate` asc ;
#(오름 내림차순 정렬 '실습 4-4' 참고)

#실습1-20 주문 테이블에서 수량이 3개 이상인 주문내용 조회. 단 주문 수량으로 내림차순 정렬하고, 수량이 같으면 제품 번호를 기준으로 오름차순.
select*from `order`where `orderCount` >= 3 
order by `orderCount` desc, `orderProduct` asc;
         
         
         
#실습1-21 제품 테이블에서 모든 제품의 단가 평균 조회 



#실습1-22 '농심'에서 제조한 제품의 재고량 합계 조회 



#실습1-23 고객 테이블에서 고객이 몇 명 등록되어 있는지 조회 



#실습1-24 제품 테이블에서 제조업체의 수를 조회



#실습1-25 주문 테이블에서 주문제품별 수량의 합계 조회 



#실습1-26 제품 테이블에서 제조업체별 제조한 제품의 개수와 제품 중 가장 비싼 단가 조회 



#실습1-27 제품 테이블에서 제품을 2개 이상 제조한 제조업체별로 제품의 개수와 제품 중 가장 비싼 단가 조회



#실습1-28 주문 테이블에서 각 주문고객이 주문한 제품의 총 주문수량을 제품별로 조회 



#실습1-29 'c102' 고객이 주문한 제품의 이름을 조회 



#실습1-30 주문일자가 7월 3일인 고객의 아이디, 이름, 상품명 그리고 주문 날짜 시간 조회
