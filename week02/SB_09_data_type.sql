USE market_db;
CREATE TABLE hongong4(
	tinyint_col TINYINT,
    smallint_col SMALLINT,
    int_col INT,
    bigint_col BIGINT);
    
INSERT INTO hongong4 VALUES(127, 32767, 2147483647, 9000000000000000000);
INSERT INTO hongong4 VALUES(127, 32767, 2147483647, 90000000000000000000);

DROP TABLE big_table;
CREATE TABLE big_table(
	data1 CHAR(255),
    data2 VARCHAR(16383) );
    
CREATE DATABASE netflix_db;
USE netflix_db;
CREATE TABLE movie(
	movie_id INT,
    movie_title VARCHAR(30),
    movie_director VARCHAR(20),
    movie_star VARCHAR(20),
    movie_script LONGTEXT,
    movie_film LONGBLOB);
    
USE market_db;
SET @myVar1 = 5;
SET @myVar2 = 4.25;

SELECT @myVar1;
SELECT @myVar1 + @myVar2;

SET @txt = '가수 이름==> ';
SET @height = 166;
SELECT @txt, mem_name FROM member WHERE height > @height;
SELECT '가수 이름==> ', mem_name FROM member WHERE height > 166;

SELECT mem_name, height FROM member ORDER BY height LIMIT 3;

-- SET @count = 3;
-- SELECT mem_name, height FROM member ORDER BY height LIMIT @count;
-- 오류 발생 

SET @count = 3;
PREPARE mySQL FROM 'SELECT mem_name, height FROM member ORDER BY height LIMIT ?';
EXECUTE mySQL USING @count;

SELECT AVG(price) '평균 가격' FROM buy;
SELECT CAST(AVG(price) AS SIGNED) '평균 가격' FROM buy;
SELECT CONVERT(AVG(price), SIGNED) '평균 가격' FROM buy;

SELECT CAST('2022$12$12' AS DATE);
SELECT CAST('2022/12/12' AS DATE);
SELECT CAST('2022$12$12' AS DATE);
SELECT CAST('2022@12@12' AS DATE);

SELECT num, CONCAT(CAST(price AS CHAR), 'X', CAST(amount AS CHAR), '=') '가격X수량', price*amount '구매액' FROM buy;

-- 암시적인 형변환
SELECT '100'+'200'; -- 문자와 문자를 더하는 경우
SELECT CONCAT('100','200'); -- 문자와 문자를 연결하는 경우
SELECT CONCAT(100,'200'); -- 숫자를 암시적으로 글자로 바꿈
