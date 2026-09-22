CREATE DATABASE naver_db;
USE naver_db;

CREATE TABLE naver_db.member
(mem_id			CHAR(8) NOT NULL PRIMARY KEY,
 mem_name		VARCHAR(10) NOT NULL,
 mem_number		TINYINT NOT NULL,
 addr			CHAR(2) NOT NULL,
 phone1			CHAR(3) NULL,
 phon2			CHAR(8) NULL,
 height			TINYINT UNSIGNED NULL,
 debut_date		DATE NULL
 );
 
 CREATE TABLE naver_db.buy
 (num			INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  mem_id		CHAR(8) NOT NULL,
  prod_name		CHAR(6) NOT NULL,
  group_name	CHAR(4),
  price			INT UNSIGNED NOT NULL,
  amount		SMALLINT UNSIGNED NOT NULL,
  FOREIGN KEY(mem_id) REFERENCES naver_db.member(mem_id)
  );
 
 
INSERT INTO naver_db.member VALUES ('TWC','트와이스',9,'서울','02','11111111',167,'2015.10.19');
INSERT INTO naver_db.member VALUES ('BLK','블랙핑크',4,'경남','055','22222222',163,'2016.08.08');
INSERT INTO naver_db.member VALUES ('WMN','여자친구',6,'경기','031','33333333',166,'2015.01.15');
INSERT INTO naver_db.member VALUES ('OMY','오마이걸',7,'서울',NULL,NULL,160,'2015.04.21');
INSERT INTO naver_db.member VALUES ('GRL','소녀시대',8,'서울','02','44444444',168,'2007.08.02');
INSERT INTO naver_db.member VALUES ('ITZ','잇지',5,'경남',NULL,NULL,167,'2019.02.12');

INSERT INTO naver_db.buy VALUES (NULL,'BLK','지갑',NULL,30,2);
INSERT INTO naver_db.buy VALUES (NULL,'BLK','맥북프로','디지털',1000,1);
INSERT INTO naver_db.buy VALUES (NULL,'APN','아이폰','디지털',200,1); -- APN 이 member테이블에 적혀있지 않아 buy테이블에도 추가될 수 없음(member 테이블에 APN을 먼저 등록해야함)








SELECT * FROM naver_db.member;