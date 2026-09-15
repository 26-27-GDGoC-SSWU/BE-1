USE market_db;
SELECT * FROM hongong1;
INSERT INTO hongong1(toy_id, toy_name) VALUES (4,'엘사');
INSERT INTO hongong1 VALUES (5,'안나',NULL);

DROP TABLE IF EXISTS auto;
CREATE TABLE auto(
	toy_id INT AUTO_INCREMENT PRIMARY KEY,
    toy_name CHAR(4),
    age INT);

ALTER TABLE auto AUTO_INCREMENT=100;
SET @@auto_increment_increment=3;
INSERT INTO auto VALUES (NULL, '크롱', 5);
SELECT * FROM `auto`;

DROP TABLE IF EXISTS city_popul;
DESC world.city;

CREATE TABLE city_popul (city_name char(35), population INT);
INSERT INTO city_popul
	SELECT Name, Population FROM world.city WHERE Name='Seoul' LIMIT 5;
    
USE market_db;
UPDATE city_popul
	SET city_name='서울'
	Where city_name='Seoul';
SELECT city_name FROM city_popul WHERE city_name='서울';