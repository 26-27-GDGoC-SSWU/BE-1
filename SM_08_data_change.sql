USE market_db;

CREATE TABLE pokedex1 (
    toy_id INT, 
    toy_name CHAR(4), 
    age INT
);

INSERT INTO pokedex1 VALUES (1, '피카츄', 25);
INSERT INTO pokedex1(toy_id, toy_name) VALUES (2, '파이리');
INSERT INTO pokedex1(toy_name, age, toy_id) VALUES ('꼬부기', 20, 3);

SELECT * 
FROM pokedex1;

CREATE TABLE pokedex2 (
    toy_id INT AUTO_INCREMENT PRIMARY KEY,
    toy_name CHAR(4), 
    age INT
);

INSERT INTO pokedex2 VALUES (NULL, '라이츄', 25);
INSERT INTO pokedex2 VALUES (NULL, '야도란', 22);
INSERT INTO pokedex2 VALUES (NULL, '잠만보', 21);

SELECT * 
FROM pokedex2;

SELECT LAST_INSERT_ID();

ALTER TABLE pokedex2 AUTO_INCREMENT = 50;
INSERT INTO pokedex2 VALUES (NULL, '뮤츠', 35);

SELECT * 
FROM pokedex2;

CREATE TABLE pokedex3 (
    toy_id INT AUTO_INCREMENT PRIMARY KEY,
    toy_name CHAR(4), 
    age INT
);

ALTER TABLE pokedex3 AUTO_INCREMENT = 200;
SET @@auto_increment_increment = 5;

INSERT INTO pokedex3 VALUES (NULL, '이상해', 20);
INSERT INTO pokedex3 VALUES (NULL, '버터플', 23);
INSERT INTO pokedex3 VALUES (NULL, '리자몽', 25);

SELECT * 
FROM pokedex3;

SELECT COUNT(*) 
FROM world.city;
