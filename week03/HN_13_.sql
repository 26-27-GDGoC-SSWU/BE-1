DROP TABLE IF EXISTS naver_db.buy, naver_db.member;

-- 테이블 만들때 기본키 설정하는 방법
CREATE TABLE naver_db.member
(mem_id			CHAR(8) NOT NULL PRIMARY KEY,
 mem_name		VARCHAR(10) NOT NULL,
 height			TINYINT UNSIGNED NULL
 );

CREATE TABLE naver_db.member
(mem_id			CHAR(8) NOT NULL,
 mem_name		VARCHAR(10) NOT NULL,
 height			TINYINT UNSIGNED NULL,
 PRIMARY KEY(mem_id)
 );
 
  CREATE TABLE naver_db.buy
 (num			INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  mem_id		CHAR(8) NOT NULL,
  prod_name		CHAR(6) NOT NULL,
  FOREIGN KEY(mem_id) REFERENCES naver_db.member(mem_id) -- mem_id를 외래키로 설정
  );
  
  CREATE TABLE naver_db.buy
 (num			INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  mem_id		CHAR(8) NOT NULL,
  prod_name		CHAR(6) NOT NULL,
  FOREIGN KEY(mem_id) REFERENCES naver_db.member(mem_id) -- mem_id를 외래키로 설정
  );
 
 DROP TABLE IF EXISTS buy;
 
 -- 기준테이블의 열이 변경될 경우 
 CREATE TABLE naver_db.buy
 (num			INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  mem_id		CHAR(8) NOT NULL,
  prod_name		CHAR(6) NOT NULL
  );
  ALTER TABLE buy
	ADD CONSTRAINT
    FOREIGN KEY(mem_id) REFERENCES naver_db.member(mem_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE;

INSERT INTO naver_db.member VALUES('BLK','블랙핑크',162);
INSERT INTO buy VALUES(NULL,'BLK','지갑');
INSERT INTO buy VALUES(NULL,'BLK','맥북');
UPDATE naver_db.member SET mem_id='PINK' WHERE mem_id='BLK'; -- 기준테이블의 열을 변경하면, 참조테이블의 데이터도 변경됨

  
  FOREIGN KEY(user_id) REFERENCES member(mem_id) -- member테이블의 mem_id와 buy테이블의 user_id를 연결
  
-- buy테이블과 member테이블을 JOIN
SELECT M.mem_id, M.mem_name, B.prod_name
	FROM buy B
		INNER JOIN naver_db.member M
        ON B.mem_id=M.mem_id;
        
UPDATE naver_db.member SET mem_id='PINK' WHERE mem_id='BLK'; -- 에러) PK와 FK의 관계를 가지므로 수정불가.

DELETE FROM naver_db.member WHERE mem_id='BLK'; -- 에러) 삭제 불가

-- 고유키 제약조건
DROP TABLE IF EXISTS naver_db.member, buy;
CREATE TABLE naver_db.member
(mem_id			CHAR(8) NOT NULL PRIMARY KEY,
 mem_name		VARCHAR(10) NOT NULL,
 height			TINYINT UNSIGNED NULL,
 email			CHAR NULL UNIQUE -- email을 고유키로 설정
 );
 
 -- 체크 제약조건 : 입력되는 데이터를 제약한다. 
 CREATE TABLE naver_db.member
(mem_id			CHAR(8) NOT NULL PRIMARY KEY,
 mem_name		VARCHAR(10) NOT NULL,
 height			TINYINT UNSIGNED NULL CHECK(height>=100), -- height칼럼에는 100이상인 값만 입력가능
 phone1			CHAR(3) NULL
 );

ALTER TABLE naver_db.member
	ADD CONSTRAINT
    CHECK (phone1 IN ('031' ,'02', '032', '054', '055', '061'));
INSERT INTO naver_db.member VALUES('TWC','트와이스',163,'02');
INSERT INTO naver_db.member VALUES('RDV','레드벨벳',162,'010'); -- '010'이 CHECK제약조건에 걸리므로 에러

-- 기본값 정의 : 값을 입력하지 않았을때 자동으로 입력될 값을 지정해두기
DROP TABLE IF EXISTS naver_db.member;
 CREATE TABLE naver_db.member
(mem_id			CHAR(8) NOT NULL PRIMARY KEY,
 mem_name		VARCHAR(10) NOT NULL,
 height			TINYINT UNSIGNED NULL DEFAULT 160, -- 기본값 정의
 phone1			CHAR(3) NULL
 );

-- phone칼럼에 값을 입력하지 않았을 때 '02' 자동 입력
 ALTER TABLE naver_db.member
	ALTER COLUMN phone1 SET DEFAULT '02'; 










 

 
 
