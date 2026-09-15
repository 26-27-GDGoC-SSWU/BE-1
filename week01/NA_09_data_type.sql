USE market_db;
CREATE TABLE hongong4 (
    tinyint_col  TINYINT,
    smallint_col SMALLINT,
    int_col    INT,
    bigint_col BIGINT );
    
    
 
INSERT INTO hongong4 VALUES(127, 32767, 2147483647, 9000000000000000000); 
-- 정상범위

INSERT INTO hongong4 VALUES(128, 32768, 2147483648, 90000000000000000000);
-- 범위 초과 -> 오류 발생 

CREATE TABLE member -- 회원 테이블
( mem_id      CHAR(8) NOT NULL PRIMARY KEY, -- 회원 아이디(PK)
  mem_name        VARCHAR(10) NOT NULL, -- 이름
  mem_number    INT NOT NULL,  -- 인원수 -- 4bit여서 너무 광범위함 ->TINYINT가 적절함
  addr          CHAR(2) NOT NULL, -- 주소(경기,서울,경남 식으로 2글자만입력)
  phone1        CHAR(3), -- 연락처의 국번(02, 031, 055 등)
  phone2        CHAR(8), -- 연락처의 나머지 전화번호(하이픈제외)
  height        SMALLINT,  -- 평균 키 --  키는 음수가 존재하지 X
  debut_date    DATE  -- 데뷔 일자
);

DROP TABLE IF EXISTS member;
CREATE TABLE member -- 회원 테이블
( mem_id      CHAR(8) NOT NULL PRIMARY KEY, -- 회원 아이디(PK)
  mem_name        VARCHAR(10) NOT NULL, -- 이름
  mem_number    TINYINT  NOT NULL,  -- 인원수
  addr          CHAR(2) NOT NULL, -- 주소(경기,서울,경남 식으로 2글자만입력)
  phone1        CHAR(3), -- 연락처의 국번(02, 031, 055 등)
  phone2        CHAR(8), -- 연락처의 나머지 전화번호(하이픈제외)
  height        TINYINT UNSIGNED,  -- 평균 키
  debut_date    DATE  -- 데뷔 일자
);


CREATE TABLE member -- 회원 테이블
( mem_id      CHAR(8) NOT NULL PRIMARY KEY, -- 회원 아이디(PK)
  mem_name        VARCHAR(10) NOT NULL, -- 이름
  mem_number    TINYINT  NOT NULL,  -- 인원수
  addr          CHAR(2) NOT NULL, -- 주소(경기,서울,경남 식으로 2글자만입력)
  phone1        CHAR(3), -- 연락처의 국번(02, 031, 055 등) -- 앞에 0이 오니까 INT형x
  phone2        CHAR(8), -- 연락처의 나머지 전화번호(하이픈제외) 
  height        TINYINT UNSIGNED,  -- 평균 키
  debut_date    DATE  -- 데뷔 일자
);

CREATE DATABASE netflix_db;
USE netflix_db;
CREATE TABLE movie 
  (movie_id        INT,
   movie_title     VARCHAR(30),
   movie_director  VARCHAR(20),
   movie_star      VARCHAR(20),
   movie_script    LONGTEXT, -- 매우 긴 글자
   movie_film      LONGBLOB -- 매우 큰 파일
); 

USE market_db;
-- 임시저장 -> 변수는 현재 상황에서 사용하는 임시저장하는 
SET @myVar1 = 5 ;
SET @myVar2 = 4.25 ;

SELECT @myVar1 ;
SELECT @myVar1 + @myVar2 ;

SET @txt = '가수 이름==> ' ;
SET @height = 166;
SELECT @txt , mem_name FROM member WHERE height > @height ;-- 166이 넘는 회원을 조회 
SELECT '가수 이름==> ', mem_name FROM member WHERE height > 166 ; -- 상단이랑 동일한 내용

SET @count = 3;
SELECT mem_name, height FROM member ORDER BY height LIMIT @count; 
--  오류발생함 -> 문법상 변수가 처리가 안됨 
-- 그래서 하단처럼 진행 

SET @count = 3;
PREPARE mySQL FROM 'SELECT mem_name, height FROM member ORDER BY height LIMIT ?';
-- SELECT문을 준비만 해놓는 / LIMIT값은 모른다 
EXECUTE mySQL USING @count;
-- ?안에 변수의 값이 들어감 
--  => 문법적으로 지원이 안될때 ?로 준비를 해놓고, USING 다음에 변수 실행하면 됨 


SELECT AVG(price) '평균 가격' FROM buy;

-- 부호가 있는 정수형으로 변경
SELECT CAST(AVG(price) AS SIGNED)  '평균 가격'  FROM buy ;
-- 또는
SELECT CONVERT(AVG(price) , SIGNED)  '평균 가격'  FROM buy ;

-- SIGNED : 부호가 있는 정수형

SELECT CAST('2022$12$12' AS DATE);
SELECT CAST('2022/12/12' AS DATE);
SELECT CAST('2022%12%12' AS DATE);
SELECT CAST('2022@12@12' AS DATE);


SELECT num, CONCAT(CAST(price AS CHAR), 'X', CAST(amount AS CHAR) ,'=' ) '가격X수량',
    price*amount '구매액' 
  FROM buy ;
  
 --  CONCAT : 이어준다
 --  CAST(price AS CHAR) : 숫자(price)를 문자로 바꿈
 --  출력 : 30X2= _30,2는 모두 문자로 바뀐거, 
 
 
 SELECT '100' + '200' ; -- 문자와 문자를 더함 (정수로 변환되서 연산됨)
-- 알아서 숫자로 변환이 되어서 서로 합쳐짐 
-- 출력 : 300

SELECT CONCAT('100', '200'); -- 문자와 문자를 연결 (문자로 처리)
-- 출력 : 100200
-- CONCAT으로 문자를 이어줌

SELECT CONCAT(100, '200'); -- 정수와 문자를 연결 (정수가 문자로 변환되서 처리)
-- 숫자 100과 문자 200을 CONCAT으로 연결
-- 암시적으로 숫자 100을 문자열로 바꿈
-- 출력: 100200


