#날짜 : 2024/07/04
#이름 : 박준영
#내용 : MySQL 기초

#실습 2-1. 테이블 생성, 제거

CREATE TABLE `User1` (
	`uid` 	VARCHAR(10),
    `name` 	VARCHAR(10),
    `hp`	CHAR(13),
	`age`	INT
    );
    
    
#실습 2-2. 데이터 입력
INSERT INTO `User1`VALUES ('A101', '김유신', '010-1234-1111', 25);
INSERT INTO `User1`VALUES ('A102', '김춘추', '010-1234-2222', 23);
INSERT INTO `User1`VALUES ('A103', '장보고', '010-1234-3333', 32);
INSERT INTO `User1` (`uid`, `name`, `age`) VALUES ('A104', '강감찬', 45);		#없는 데이터가 있을 시 칼럼명과 데이터 명을 순서에 맞춰 적어 추가
INSERT INTO `User1`SET `uid`='A105', `name`='이순신', `hp`='010-1234-5555'; 



#실습 2-3.  데이터 조회
SELECT * FROM `User1`;                  			#모든 데이터 조회
SELECT * FROM `User1` WHERE `uid`='A101'; 			#지정한 데이터 조회
SELECT * FROM `User1` WHERE `name`='김춘추';
SELECT * FROM `User1` WHERE `age` <=30;
SELECT * FROM `User1` WHERE `age` >=30;
SELECT `uid`, `name`, `age` FROM `User1`;			#지정한 칼럼들만 조회



#실습 2-4. 데이터 수정
# 수정 / 삭제 할 때 You are using safe update mode~ 뜨면서 수정 안될때 아래 쿼리 실행
set sql_safe_updates=0;
UPDATE `User1` SET `hp`='010-1234-4444'WHERE `uid`='A104';
UPDATE `User1` SET `age`=51 WHERE `uid`='A105';
UPDATE `User1` SET `hp`='010-1234-1001', `age`=27 WHERE `uid`='A101';



#2-5 데이터 삭제
DELETE FROM `User1`WHERE`uid`='A101';
DELETE FROM `User1`WHERE`uid`='A102' AND `age`=23; # 조건이 하나라도 맞지 않으면 삭제되지 않음
DELETE FROM `User1`WHERE`age`>=30;



#2-6 테이블 수정
#속성(열) 추가
ALTER TABLE`User1`ADD`gender`TINYINT; 					#ALTER TABLE 테이블 명 ADD 속성명 자료형;
ALTER TABLE`User1`ADD`birth`CHAR(10) AFTER`name`;		#ALTER TABLE 테이블 명 ADD 속성명 자료형 위치;
#속성(열) 자료형 변경
ALTER TABLE`User1`MODIFY`gender`CHAR(1);
ALTER TABLE`User1`MODIFY`age`TINYINT;
#속성(열) 삭제
ALTER TABLE`User1`DROP `gender`;						#ALTER TABLE 테이블 명 DROP 속성명;


#2-7. 테이블 복사
CREATE TABLE `User1Copy`LIKE`User1`;					#테이블 복사
INSERT INTO `User1Copy`SELECT*FROM `User1`;				#테이블 데이터 복사



#2-8 연습 문제
CREATE TABLE `TblUser`(
	`user_id`		VARCHAR(10),
    `user_name`		VARCHAR(10),
    `user_hp`		CHAR(13),
    `user_age` 		TINYINT,
    `user_addr`		VARCHAR(100)
    );
    
    INSERT INTO `TblUser` VALUES('p101', '김유신', '010-1234-1001', 25, '경남 김해시');
    INSERT INTO `TblUser` VALUES('p102', '김춘추', '010-1234-1002', 23, '경남 경주시');
    INSERT INTO `TblUser` VALUES('p103', '장보고', NULL, 23, '경남 경주시');
    INSERT INTO `TblUser`(`user_id`, `user_name`, `user_addr`)VALUES('p104', '강감찬', '서울시 중구');
    INSERT INTO `TblUser` SET `user_id`='p105', `user_name`='이순신', `user_hp`='010-1234-1005',
    `user_age`=25;
    
    CREATE TABLE `TblProduct`(
		`prod_no`		INT,
        `prod_name`		VARCHAR(10),
        `prod_price`	INT,
		`prod_stock` 	int,
        `prod_company` 	varchar(10),
        `prod_date`		DATE
        );
        
INSERT INTO `TblProduct` VALUES (1001, '냉장고',  800000,  25, 'LG전자', '2022-01-06');
INSERT INTO `TblProduct` VALUES (1002, '노트북', 1200000, 120, '삼성전자', '2022-01-07');
INSERT INTO `TblProduct` VALUES (1003, '모니터',  350000,  35, 'LG전자', '2023-01-13');
INSERT INTO `TblProduct` VALUES (1004, '세탁기', 1000000,  80, '삼성전자', '2021-01-01');
INSERT INTO `TblProduct` VALUES (1005, '컴퓨터', 1500000,  20, '삼성전자', '2023-10-01');
INSERT INTO `TblProduct` VALUES (1006, '휴대폰',  950000, 102, NULL, NULL);





#2-9 연습 문제
SELECT * FROM `TblUser`;
SELECT `user_name` FROM `TblUser`;
SELECT `user_name`, `user_hp` FROM `TblUser`;
SELECT * FROM `TblUser`WHERE `user_id`='p102';
SELECT * FROM `TblUser` WHERE `user_id`='p104' OR `user_id`='p105';
SELECT * FROM `TblUser` WHERE `user_addr`='부산시 금정구';
SELECT * FROM `TblUser` WHERE `user_age` > 30;
select*from `TblUser`where`user_hp` is null;
UPDATE `TblUser` SET `user_age`=42 WHERE `user_id`='p104';
UPDATE `TblUser` SET `user_addr`='부산시 진구' WHERE `user_id`='p105';
delete from`tbluser` where `user_id` = 'p103';
select*from`tblproduct`;
select`prod_name` from`tblproduct`;
select`prod_name`, `prod_company`, `prod_price` from`TblProduct`;
SELECT * FROM `TblProduct` WHERE `prod_company`='LG전자';
SELECT * FROM `TblProduct` WHERE `prod_company`='삼성전자';
UPDATE `TblProduct` SET 
 `prod_company`='삼성전자', 
 `prod_date`='2024-01-01' 
 WHERE 
 `prod_no`=1006;