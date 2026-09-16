USE market_db;
USE netflix_db;

INSERT INTO hongong4 VALUES(127, 32767, 2147483647, 9000000000000000000);

SET @myVar1 = 5;
SET @myVar2 = 4.25;

SELECT @myVar1;
SELECT @myVar1 + @myVar2;

SET @txt = '가수 이름==> ';
SET @height = 166;

SELECT @txt, mem_name 
FROM member 
WHERE height > @height;

SELECT '가수 이름==> ', mem_name 
FROM member 
WHERE height > 166;

SELECT mem_name, height 
FROM member 
ORDER BY height 
LIMIT 3;

SET @count = 3;
PREPARE mySQL FROM 'SELECT mem_name, height FROM member ORDER BY height LIMIT ?';
EXECUTE mySQL USING @count;

SELECT AVG(price) '평균 가격' 
FROM buy;

SELECT CAST(AVG(price) AS SIGNED) '평균 가격' 
FROM buy;

SELECT CONVERT(AVG(price), SIGNED) '평균 가격' 
FROM buy;

SELECT CAST('2022$12$12' AS DATE);
SELECT CAST('2022/12/12' AS DATE);
SELECT CAST('2022@12@12' AS DATE);

SELECT num, 
       CONCAT(CAST(price AS CHAR), 'X', CAST(amount AS CHAR), '=') '가격X수량', 
       price * amount '구매액' 
FROM buy;

SELECT '100' + '200';
SELECT CONCAT('100', '200');
SELECT CONCAT(100, '200');
