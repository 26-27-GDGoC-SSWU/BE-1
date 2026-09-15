USE market_db;
CREATE TABLE hongong1 (toy_id  INT, toy_name CHAR(4), age INT); -- 테이블 생성
INSERT INTO hongong1 VALUES (1, '우디', 25); 
INSERT INTO hongong1(toy_id, toy_name) VALUES (2, '버즈'); -- 열 지정해서 데이터 삽입
INSERT INTO hongong1(toy_name,age, toy_id) VALUES ('제시', 20, 3);

CREATE TABLE hongong2 ( 
   toy_id  INT AUTO_INCREMENT PRIMARY KEY,  -- ID를 자동 생성 
   toy_name CHAR(4), 
   age INT);
   -- AUTO_INCREMENT : 자동 생성 
   -- 조건: PK로 지정해야함 

INSERT INTO hongong2 VALUES (NULL, '보핍', 25);
INSERT INTO hongong2 VALUES (NULL, '슬링키', 22);
INSERT INTO hongong2 VALUES (NULL, '렉스', 21);
-- 위 3개의 데이터는 ID지정이 자동으로 됨 
SELECT * FROM hongong2;

SELECT LAST_INSERT_ID(); -- ID가 어디까지 증가했는지 조회 

ALTER TABLE hongong2 AUTO_INCREMENT=100; -- AUTO값을 100으로 변경 (자동증가 값을 변경 )
INSERT INTO hongong2 VALUES (NULL, '재남', 35);
SELECT * FROM hongong2;

-- 새로운 테이블 생성
CREATE TABLE hongong3 ( 
   toy_id  INT AUTO_INCREMENT PRIMARY KEY, 
   toy_name CHAR(4), 
   age INT);
ALTER TABLE hongong3 AUTO_INCREMENT=1000; -- AUTO값을 1000으로 지정
SET @@auto_increment_increment=3; -- 자동증가 값을 3단위로 지정

INSERT INTO hongong3 VALUES (NULL, '토마스', 20);
INSERT INTO hongong3 VALUES (NULL, '제임스', 23);
INSERT INTO hongong3 VALUES (NULL, '고든', 25);
SELECT * FROM hongong3;


SELECT COUNT(*) FROM world.city; -- DB.테이블이름

DESC world.city; -- 테이블 구조 확인

SELECT * FROM world.city LIMIT 5; -- 5건만 조회 

-- 저 world DB에 테이블의 내용을 가져오고 싶음
-- 우선 새로운 테이블 생성 _market_db에 만듦
CREATE TABLE city_popul ( city_name CHAR(35), population INT);

INSERT INTO city_popul
    SELECT Name, Population FROM world.city;
  -- SELECT 결과가 전부 city_popul 테이블에 INSERT됨 
    
USE market_db;
UPDATE city_popul
    SET city_name = '서울'
    WHERE city_name = 'Seoul';
SELECT  * FROM city_popul WHERE  city_name = '서울';
-- 영문 서울을 한글 서울로 바꿈

UPDATE city_popul
    SET city_name = '뉴욕', population = 0
    WHERE city_name = 'New York';
SELECT  * FROM city_popul WHERE  city_name = '뉴욕';
-- 두개의 값을 변경 
-- 조건을 안주면 모든 시티이름을 뉴욕으로 바꿈!!!!

-- UPDATE city_popul
--    SET city_name = '서울'

UPDATE city_popul
    SET population = population / 10000 ;
    -- 모든 인구단위를 만으로 나눈다 
SELECT * FROM city_popul LIMIT 5;



DELETE FROM city_popul 
    WHERE city_name LIKE 'New%'; -- 도시 이름이 앞에는 New, 뒤에는 상관x

DELETE FROM city_popul 
    WHERE city_name LIKE 'New%'
    LIMIT 5; -- 5건만 지움 


