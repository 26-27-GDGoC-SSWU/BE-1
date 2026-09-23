create database naver_db;
use naver_db;

DROP database if exists naver_db;
create database naver_db;

CREATE TABLE member ( 
	mem_id        CHAR(8), -- 회원 id
    mem_name      VARCHAR(10), -- 이름
    mem_number    TINYINT,  -- 인원수
    addr          CHAR(2), -- 주소(2글자만)
    phone1        CHAR(3), -- 연락처의 국번
    phone2        CHAR(8), -- 연락처의 나머지 전화번호(하이픈제외)
    height        TINYINT UNSIGNED,  -- 평균 키
    debut_date    DATE  -- 데뷔일자
);

DROP TABLE IF EXISTS member;  -- 기존테이블 삭제
CREATE TABLE member ( -- null 조건 추가
  mem_id        CHAR(8) NOT NULL,
  mem_name      VARCHAR(10) NOT NULL, 
  mem_number    TINYINT NOT NULL, 
  addr          CHAR(2) NOT NULL,
  phone1        CHAR(3) NULL,
  phone2        CHAR(8) NULL,
  height        TINYINT UNSIGNED NULL, 
  debut_date    DATE NULL);
  
-- 삭제후 기본키 지정
CREATE TABLE member ( 
  membermem_id        CHAR(8) NOT NULL PRIMARY KEY,
  mem_name      VARCHAR(10) NOT NULL, 
  mem_number    TINYINT NOT NULL, 
  addr          CHAR(2) NOT NULL,
  phone1        CHAR(3) NULL,
  phone2        CHAR(8) NULL,
  height        TINYINT UNSIGNED NULL, 
  debut_date    DATE NULL
);

-- 구매테이블 
DROP TABLE IF EXISTS buy;  -- 기존 테이블 삭제
CREATE TABLE buy ( 
   num         INT AUTO_INCREMENT NOT NULL PRIMARY KEY, -- auto_increment:자동 증가
   mem_id      CHAR(8) NOT NULL, -- id(FK)
   prod_name     CHAR(6) NOT NULL, --  제품이름
   group_name     CHAR(4) NULL , -- 분류
   price         INT UNSIGNED NOT NULL, -- 가격
   amount        SMALLINT UNSIGNED  NOT NULL -- 수량
);

-- 삭제후 외래키 지정 
CREATE TABLE buy ( 
   num         INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
   mem_id      CHAR(8) NOT NULL, 
   prod_name     CHAR(6) NOT NULL, 
   group_name     CHAR(4) NULL ,
   price         INT UNSIGNED NOT NULL,
   amount        SMALLINT UNSIGNED  NOT NULL ,
   FOREIGN KEY(mem_id) REFERENCES member(mem_id)
   -- 외래키지정할 id / 참조할 테이블(컬럼)
);

INSERT INTO member VALUES('TWC', '트와이스', 9, '서울', '02', '11111111', 167, '2015-10-19');
INSERT INTO member VALUES('BLK', '블랙핑크', 4, '경남', '055', '22222222', 163, '2016-8-8');
INSERT INTO member VALUES('WMN', '여자친구', 6, '경기', '031', '33333333', 166, '2015-1-15');

INSERT INTO buy VALUES( NULL, 'BLK', '지갑', NULL, 30, 2);
INSERT INTO buy VALUES( NULL, 'BLK', '맥북프로', '디지털', 1000, 1);
INSERT INTO buy VALUES( NULL, 'APN', '아이폰', '디지털', 200, 1);

