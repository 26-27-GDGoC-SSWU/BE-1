USE market_db;
CREATE TABLE table1  (
    col1  INT  PRIMARY KEY, -- pk는 클러스터형 인덱스
    col2  INT,
    col3  INT
);

SHOW INDEX FROM table1; -- 테이블에 지정된 인덱스를 확인할 수 있음
-- pk는 클러스터형 인덱스


-- 유니크키 두개 
CREATE TABLE table2  (
    col1  INT  PRIMARY KEY,
    col2  INT  UNIQUE,
    col3  INT  UNIQUE
);
SHOW INDEX FROM table2;
-- 유니크키는 보조 인덱스임




-- 정렬되는거 확인해보기 (클러스터형 인덱스)
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
SELECT * FROM member;
-- 내가 입력한거 그대로 출력 

-- pk를 지정해보면 출력이 바뀜(자동 정렬)
ALTER TABLE member
     ADD CONSTRAINT 
     PRIMARY KEY (mem_id);
     
SELECT * FROM member;
-- 알파벳 순으로 정렬이 됨 -> mem_id를 pk로 지정을 했기 떄문에
-- 클러스터형은 1개 -> pk는 하나이니까 

-- 기본키 제거
ALTER TABLE member DROP PRIMARY KEY ; 

-- 멤버 이름에 pk
ALTER TABLE member 
    ADD CONSTRAINT 
    PRIMARY KEY(mem_name);
SELECT * FROM member;
-- 이름열이 정렬이 됨 -> 이름을 pk로 했으니까 ( 국어 사전)

INSERT INTO member VALUES('GRL', '소녀시대', 8, '서울');
SELECT * FROM member;
-- 맨 뒤에 추가되는게 아닌 정렬이 되는 추가 
-- 내용적인 측면에서는 변화 x, 차례만 바뀜 


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

-- 멤버 id에 유니크
ALTER TABLE member
     ADD CONSTRAINT 
     UNIQUE (mem_id);
SELECT * FROM member;
-- 앞의 출력이랑 동일  -> 내용이 바뀌지 않음!! 

-- 멤버 이름도 유니크키로 (총 유니크키 2개)
ALTER TABLE member
     ADD CONSTRAINT 
     UNIQUE (mem_name);
SELECT * FROM member;

INSERT INTO member VALUES('GRL', '소녀시대', 8, '서울');
SELECT * FROM member;
-- 맨뒤에 그냥 추가됨 
-- 내용의 차례는 변함이 없다 