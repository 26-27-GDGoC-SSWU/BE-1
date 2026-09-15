USE market_db;
CREATE TABLE hongong4 (
    tinyint_col  TINYINT,
    smallint_col SMALLINT,
    int_col    INT,
    bigint_col BIGINT );

INSERT INTO hongong4 VALUES(127, 32767, 2147483647, 9000000000000000000);

INSERT INTO hongong4 VALUES(128, 32768, 2147483648, 90000000000000000000);

CREATE TABLE big_table (
  data2  VARCHAR(16383) );
  
CREATE DATABASE netflix_db;
USE netflix_db;
CREATE TABLE movie 
  (movie_id        INT,
   movie_title     VARCHAR(30),
   movie_director  VARCHAR(20),
   movie_star      VARCHAR(20),
   movie_script    LONGTEXT,
   movie_film      LONGBLOB
); 

USE market_db;
SET @myVar1 = 5 ;
SET @myVar2 = 4.25 ;

SELECT @myVar1 ;
SELECT @myVar1 + @myVar2 ;

SET @txt = '가수 이름==> ' ;
SET @height = 166;
SELECT @txt , mem_name FROM member WHERE height > @height ;

SET @count = 3;
PREPARE mySQL FROM 'SELECT mem_name, height FROM member ORDER BY height LIMIT ?';
EXECUTE mySQL USING @count;

SELECT AVG(price) '평균 가격' FROM buy;

SELECT CAST(AVG(price) AS SIGNED)  '평균 가격'  FROM buy ;
