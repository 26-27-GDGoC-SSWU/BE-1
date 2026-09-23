-- 클러스터형 인덱스 실습
USE market_db;
CREATE TABLE table1  (
    col1  INT  PRIMARY KEY,
    col2  INT,
    col3  INT
);
SHOW INDEX FROM table1;

CREATE TABLE table2  (
    col1  INT  PRIMARY KEY,
    col2  INT  UNIQUE,
    col3  INT  UNIQUE
);
SHOW INDEX FROM table2;

USE market_db;
DROP TABLE IF EXISTS buy, member;
CREATE TABLE member 
( mem_id      CHAR(8) , 
  mem_name    VARCHAR(10),
  mem_number  INT ,  
  addr        CHAR(2)  
 );
 
INSERT INTO member VALUES('TWC', '트와이스', 9, '서울');
INSERT INTO member VALUES('BLK', '블랙핑크', 4, '경남');
INSERT INTO member VALUES('WMN', '여자친구', 6, '경기');
INSERT INTO member VALUES('OMY', '오마이걸', 7, '서울');
SELECT * FROM member; -- 인덱스 없이 내용 삽입

ALTER TABLE member
     ADD CONSTRAINT 
     PRIMARY KEY (mem_id);
SELECT * FROM member; -- mem_id를 PRIMARY KEY로 지정해서 알파벳 순으로 정렬됨

ALTER TABLE member DROP PRIMARY KEY ; -- 기본 키 제거

ALTER TABLE member 
    ADD CONSTRAINT 
    PRIMARY KEY(mem_name);
SELECT * FROM member; -- 멤버 이름으로 가나다 순으로 정렬됨

INSERT INTO member VALUES('GRL', '소녀시대', 8, '서울');
SELECT * FROM member; -- 자동으로 순서 찾아서 입력됨

-- 보조 인덱스 실습
USE market_db;
DROP TABLE IF EXISTS member;
CREATE TABLE member 
( mem_id      CHAR(8) , 
  mem_name    VARCHAR(10),
  mem_number  INT ,  
  addr        CHAR(2)  
 );

INSERT INTO member VALUES('TWC', '트와이스', 9, '서울');
INSERT INTO member VALUES('BLK', '블랙핑크', 4, '경남');
INSERT INTO member VALUES('WMN', '여자친구', 6, '경기');
INSERT INTO member VALUES('OMY', '오마이걸', 7, '서울');
SELECT * FROM member;

ALTER TABLE member
     ADD CONSTRAINT 
     UNIQUE (mem_id); -- 보조 인덱스 지정 1
SELECT * FROM member;

ALTER TABLE member
     ADD CONSTRAINT 
     UNIQUE (mem_id); -- 보조 인덱스 지정 2
SELECT * FROM member;

INSERT INTO member VALUES('GRL', '소녀시대', 8, '서울');
SELECT * FROM member; -- 맨 뒤에 추가됨 (내용 변화는 없음)