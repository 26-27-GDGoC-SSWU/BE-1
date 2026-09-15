--  삭제하고 진행하는 
DROP DATABASE IF EXISTS market_db; --  만약 market_db가 존재하면 우선 삭제한다.
CREATE DATABASE market_db; --  새로운 DB 생성 

USE market_db; --  앞으로 사용 db 설정
CREATE TABLE member --  회원 테이블
( mem_id  		CHAR(8) NOT NULL PRIMARY KEY, --  사용자 아이디(PK)
  mem_name    	VARCHAR(10) NOT NULL, --  이름
  mem_number    INT NOT NULL,  --  인원수
  addr	  		CHAR(2) NOT NULL, --  지역(경기,서울,경남 식으로 2글자만입력)
  phone1		CHAR(3), --  연락처의 국번(02, 031, 055 등) -- 앞에 0이 들어가서 char로 설정 
  phone2		CHAR(8), --  연락처의 나머지 전화번호(하이픈제외)
  height    	SMALLINT,  --  평균 키
  debut_date	DATE  --  데뷔 일자
);
CREATE TABLE buy --  구매 테이블
(  num 		INT AUTO_INCREMENT NOT NULL PRIMARY KEY, --  순번(PK)
   mem_id  	CHAR(8) NOT NULL, --  아이디(FK)
   prod_name 	CHAR(6) NOT NULL, --   제품이름
   group_name 	CHAR(4)  , --  분류
   price     	INT  NOT NULL, --  가격
   amount    	SMALLINT  NOT NULL, --  수량
   FOREIGN KEY (mem_id) REFERENCES member(mem_id)
);

INSERT INTO member VALUES('TWC', '트와이스', 9, '서울', '02', '11111111', 167, '2015.10.19');
INSERT INTO member VALUES('BLK', '블랙핑크', 4, '경남', '055', '22222222', 163, '2016.08.08');
INSERT INTO member VALUES('WMN', '여자친구', 6, '경기', '031', '33333333', 166, '2015.01.15');
INSERT INTO member VALUES('OMY', '오마이걸', 7, '서울', NULL, NULL, 160, '2015.04.21');
INSERT INTO member VALUES('GRL', '소녀시대', 8, '서울', '02', '44444444', 168, '2007.08.02');
INSERT INTO member VALUES('ITZ', '잇지', 5, '경남', NULL, NULL, 167, '2019.02.12');
INSERT INTO member VALUES('RED', '레드벨벳', 4, '경북', '054', '55555555', 161, '2014.08.01');
INSERT INTO member VALUES('APN', '에이핑크', 6, '경기', '031', '77777777', 164, '2011.02.10');
INSERT INTO member VALUES('SPC', '우주소녀', 13, '서울', '02', '88888888', 162, '2016.02.25');
INSERT INTO member VALUES('MMU', '마마무', 4, '전남', '061', '99999999', 165, '2014.06.19');

INSERT INTO buy VALUES(NULL, 'BLK', '지갑', NULL, 30, 2);
INSERT INTO buy VALUES(NULL, 'BLK', '맥북프로', '디지털', 1000, 1);
INSERT INTO buy VALUES(NULL, 'APN', '아이폰', '디지털', 200, 1);
INSERT INTO buy VALUES(NULL, 'MMU', '아이폰', '디지털', 200, 5);
INSERT INTO buy VALUES(NULL, 'BLK', '청바지', '패션', 50, 3);
INSERT INTO buy VALUES(NULL, 'MMU', '에어팟', '디지털', 80, 10);
INSERT INTO buy VALUES(NULL, 'GRL', '혼공SQL', '서적', 15, 5);
INSERT INTO buy VALUES(NULL, 'APN', '혼공SQL', '서적', 15, 2);
INSERT INTO buy VALUES(NULL, 'APN', '청바지', '패션', 50, 1);
INSERT INTO buy VALUES(NULL, 'MMU', '지갑', NULL, 30, 1);
INSERT INTO buy VALUES(NULL, 'APN', '혼공SQL', '서적', 15, 1);
INSERT INTO buy VALUES(NULL, 'MMU', '지갑', NULL, 30, 4);

--  select문으로 조회
SELECT * FROM member;
SELECT * FROM buy;

--  내가 사용할 db 설정
USE market_db;

--  SELECT 열이름  FROM 테이블 WHERE 조건 
SELECT * FROM market_db.member WHERE mem_name = '블랙핑크';
--  member 라는 테이블을 조회 / * : 모든 열을 다 조회 
--  ; 기준으로 한 문장으로 판정 

--   market_db.member : db를 지정하고 테이블 조회


SELECT addr,height,debut_date FROM market_db.member WHERE mem_name = '블랙핑크';
--  SELECT 다음에 지정한대로 내가 출력을 볼수있음
--  순서에 따라 출력 가능 

SELECT height 키,debut_date "데뷔 일자" FROM market_db.member WHERE mem_name = '블랙핑크';
--  열에 별을 지정가능 (참조임 -> 진짜로 바뀌는게 아닌)
--  이름 지정시 공백이 있을경우 ""로 묶음

SELECT mem_id, mem_name -- 보고싶은 열
	FROM member -- 테이블
	WHERE height <= 162; -- 평균 키가 162가 이하인 
	WHERE height >= 165 AND mem_number > 6; --  AND:두 조건이 모두 만족하는
	WHERE height >= 165 OR mem_number > 6; --  OR:둘 중 하나만 만족하는 
  
SELECT mem_name, height 
   FROM member 
   WHERE height >= 163 AND height <= 165; --  키가 163~165인 회원들
   WHERE height BETWEEN 163 AND 165; -- BETWEEN AND : ~ 사이의 _상단과 동일한 출력 
   
SELECT mem_name, addr 
   FROM member 
   WHERE addr = '경기' OR addr = '전남' OR addr = '경남';
   WHERE addr IN('경기', '전남', '경남');
   -- 둘이 결과가 동일 
   
   
SELECT * 
   FROM member 
   WHERE mem_name LIKE '우%'; --  % : 여러 문자열 
   WHERE mem_name LIKE '__핑크';-- _ 당 하나의 글자 
   
SELECT height FROM member WHERE mem_name = '에이핑크';

SELECT mem_name, height FROM member WHERE height > 164;

SELECT mem_name, height FROM member
	WHERE height > (SELECT height FROM member WHERE mem_name = '에이핑크');
