USE naver_db;

DROP TABLE IF EXISTS buy, member;

CREATE TABLE member 
( mem_id  CHAR(8) NOT NULL PRIMARY KEY,  -- 기본키 지정
  mem_name    VARCHAR(10) NOT NULL, 
  height      TINYINT UNSIGNED NULL
);

DESCRIBE member; -- key열에 PRI가 기본키로 지정했다는 의미 

DROP TABLE IF EXISTS member;
CREATE TABLE member 
( mem_id  CHAR(8) NOT NULL, 
  mem_name    VARCHAR(10) NOT NULL, 
  height      TINYINT UNSIGNED NULL,
  PRIMARY KEY (mem_id) -- 앞에서 진행한거랑 동일함 (방법만 두개)
);

-- alter table로 수정해서 pk 지정하는 방법
CREATE TABLE member 
( mem_id  CHAR(8) NOT NULL, 
  mem_name    VARCHAR(10) NOT NULL, 
  height      TINYINT UNSIGNED NULL
);

ALTER TABLE member
     ADD CONSTRAINT  -- 제약 조건(CONSTRAINT)을 추가해라 
     PRIMARY KEY (mem_id);


-- 외래키 제약 조건 
DROP TABLE IF EXISTS buy, member;

CREATE TABLE member -- 기준 테이블
( mem_id  CHAR(8) NOT NULL PRIMARY KEY, 
  mem_name    VARCHAR(10) NOT NULL, 
  height      TINYINT UNSIGNED NULL
);

CREATE TABLE buy -- 참조테이블
(  num         INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
   mem_id      CHAR(8) NOT NULL, 
   prod_name     CHAR(6) NOT NULL, 
   FOREIGN KEY(mem_id) REFERENCES member(mem_id) -- 외래키 연결
);
-- 일대다의 관계로 연결함

-- 삭제후 진행 
-- 외래키의 경우 꼭 같은 id 이름일 필요는 없음 but, 같은게 좋긴함 
CREATE TABLE member 
( mem_id  CHAR(8) NOT NULL PRIMARY KEY, 
  mem_name    VARCHAR(10) NOT NULL, 
  height      TINYINT UNSIGNED NULL
);
CREATE TABLE buy 
(  num         INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
   user_id      CHAR(8) NOT NULL, 
   prod_name     CHAR(6) NOT NULL, 
   FOREIGN KEY(user_id) REFERENCES member(mem_id));

-- alter table로 지정하는 방법 
DROP TABLE IF EXISTS buy;
CREATE TABLE buy ( -- 참조테이블
   num         INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
   mem_id      CHAR(8) NOT NULL, 
   prod_name     CHAR(6) NOT NULL);
   
ALTER TABLE buy
    ADD CONSTRAINT -- 제약조건을 더한다 
    FOREIGN KEY(mem_id) REFERENCES member(mem_id); -- 외래키를 지정 

INSERT INTO member VALUES('BLK', '블랙핑크', 163);
INSERT INTO buy VALUES(NULL, 'BLK', '지갑');
INSERT INTO buy VALUES(NULL, 'BLK', '맥북');

-- 두개의 테이블을 join
SELECT M.mem_id, M.mem_name, B.prod_name 
   FROM buy B
      INNER JOIN member M
      ON B.mem_id = M.mem_id;

-- update로 id 바꿔주기
-- 오류발생 -> 참조하고 있기 때문에 변경이 불가능
UPDATE member SET mem_id = 'PINK' WHERE mem_id='BLK';

-- 회원 탈퇴(삭제)
-- 오류 -> 참조하고 있기 때문에 삭제 불가능
DELETE FROM member WHERE  mem_id='BLK';
-- 따라서 pk,fk로 되어있으면 데이터 무결성 조건때문에 수정이나 삭제가 안된다 + 행 자체가 삭제 안됨 
-- 해결 방법은 자동으로 변경되는 기능을 추가해줘야함 

DROP TABLE IF EXISTS buy;
CREATE TABLE buy 
(  num         INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
   mem_id      CHAR(8) NOT NULL, 
   prod_name     CHAR(6) NOT NULL
);


ALTER TABLE buy
    ADD CONSTRAINT 
    FOREIGN KEY(mem_id) REFERENCES member(mem_id) -- 외래키 제약조건 추가 
    ON UPDATE CASCADE -- 수정도 같이하는 기능
    ON DELETE CASCADE ; -- 삭제도 같이하는 기능
    
INSERT INTO buy VALUES(NULL, 'BLK', '지갑');
INSERT INTO buy VALUES(NULL, 'BLK', '맥북');

UPDATE member SET mem_id = 'PINK' WHERE mem_id='BLK';

SELECT M.mem_id, M.mem_name, B.prod_name 
   FROM buy B
      INNER JOIN member M
      ON B.mem_id = M.mem_id;

DELETE FROM member WHERE  mem_id='PINK';

SELECT * FROM buy;
-- 핑크를 삭제하니까 핑크를 참조하고있던 애들도 전부 삭제되어서 buy 테이블은 공란

-- 기타제약조건
-- 고유키
DROP TABLE IF EXISTS buy, member;
CREATE TABLE member 
( mem_id  CHAR(8) NOT NULL PRIMARY KEY, 
  mem_name    VARCHAR(10) NOT NULL, 
  height      TINYINT UNSIGNED NULL,
  email       CHAR(30)  NULL UNIQUE -- 이메일을 고유키로 
);

-- 데이터 추가
INSERT INTO member VALUES('BLK', '블랙핑크', 163, 'pink@gmail.com');
INSERT INTO member VALUES('TWC', '트와이스', 167, NULL); -- 고유키는 null허용
INSERT INTO member VALUES('APN', '에이핑크', 164, 'pink@gmail.com'); -- 고유키는 중복 x -> 오류발생 
SELECT * FROM member;


-- 체크 제약조건
DROP TABLE IF EXISTS member;
CREATE TABLE member 
( mem_id  CHAR(8) NOT NULL PRIMARY KEY, 
  mem_name    VARCHAR(10) NOT NULL, 
  height      TINYINT UNSIGNED NULL CHECK (height >= 100), -- 체크 제약조건 : 100보다 크다는 조건 
  phone1      CHAR(3)  NULL
);

INSERT INTO member VALUES('BLK', '블랙핑크', 163, NULL);
INSERT INTO member VALUES('TWC', '트와이스', 99, NULL); -- 체크 조건에서 100이상이여한다는 조건이 존재하기 떄문
-- 데이터 무결성 가능

ALTER TABLE member
    ADD CONSTRAINT 
    CHECK  (phone1 IN ('02', '031', '032', '054', '055', '061' )) ; -- in 얘네만 되게 하자 

INSERT INTO member VALUES('TWC', '트와이스', 167, '02');
INSERT INTO member VALUES('OMY', '오마이걸', 167, '010'); -- in의 조건에 있는 값이 아니여서 

-- 기본값 정의 
DROP TABLE IF EXISTS member;
CREATE TABLE member 
( mem_id  CHAR(8) NOT NULL PRIMARY KEY, 
  mem_name    VARCHAR(10) NOT NULL, 
  height      TINYINT UNSIGNED NULL DEFAULT 160, -- 기본적으로 160을 넣겠다
  phone1      CHAR(3)  NULL
);

ALTER TABLE member
    ALTER COLUMN phone1 SET DEFAULT '02'; -- 디폴트값 지정

INSERT INTO member VALUES('RED', '레드벨벳', 161, '054');
INSERT INTO member VALUES('SPC', '우주소녀', default, default); -- 160이랑 02로 들어감 (디폴트값)

-- 널 값 허용 