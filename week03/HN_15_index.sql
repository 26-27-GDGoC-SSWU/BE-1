USE market_db;
CREATE TABLE table1 (
	col1	INT PRIMARY KEY, -- PRIMARY KEY로 둔 칼럼의 데이터들로 클러스터형 인덱스가 생성됨.
    col2	INT,
    col3	INT
    );
    
SHOW INDEX FROM table1;

CREATE TABLE table2(
	col1	INT PRIMARY KEY, 
    col2	INT UNIQUE, -- 보조인덱스
    col3	INT UNIQUE -- 보조인덱스
    );
SHOW INDEX FROM table2;

DROP TABLE IF EXISTS market_db.member, buy;
CREATE TABLE market_db.member
( mem_id		CHAR(8),
  mem_name		VARCHAR(10),
  mem_number	INT,
  addr			CHAR(2)
  );
INSERT INTO market_db.member VALUES('TWC','트와이스',9,'서울');
INSERT INTO market_db.member VALUES('BLK','블랙핑크',4,'경남');
INSERT INTO market_db.member VALUES('GLF','여자친구',5,'경기');
INSERT INTO market_db.member VALUES('OMG','오마이걸',6,'서울');
SELECT * FROM market_db.member; -- 입력한 순서대로 정렬됨

-- mem_id 를 primary key로 지정
ALTER TABLE market_db.member
	ADD CONSTRAINT
    PRIMARY KEY(mem_id);
SELECT * FROM market_db.member; -- PRIMARY KEY인 mem_id가 사전처럼 정렬됨

-- primary key를 mem_id에서 mem_name으로 변경하면 mem_name 가나다 순으로 정렬됨
ALTER TABLE market_db.member DROP PRIMARY KEY;
ALTER TABLE market_Db.member 
	ADD CONSTRAINT
    PRIMARY KEY(mem_name);
    
-- 보조 인덱스 만들기위해 고유키 지정하기
DROP TABLE IF EXISTS market_db.member;
CREATE TABLE market_db.member
( mem_id		CHAR(8),
  mem_name		VARCHAR(10),
  mem_number	INT,
  addr			CHAR(2)
  );
INSERT INTO market_db.member VALUES('TWC','트와이스',9,'서울');
INSERT INTO market_db.member VALUES('BLK','블랙핑크',4,'경남');
INSERT INTO market_db.member VALUES('GLF','여자친구',5,'경기');
INSERT INTO market_db.member VALUES('OMG','오마이걸',6,'서울');

ALTER TABLE market_db.member 
	ADD CONSTRAINT
    UNIQUE(mem_id);
SELECT * FROM market_db.member; -- 고유키를 지정해도 SELECT 결과 순서는 입력한 순 그대로(보조인덱스 만들어짐)

ALTER TABLE market_db.member 
	ADD CONSTRAINT
    UNIQUE(mem_name);
SELECT * FROM market_db.member; 

INSERT INTO market_db.member VALUES('BTS','방탄소년단',6,'서울'); -- 데이터 추가해도 테이블 맨 뒤에 추가됨




