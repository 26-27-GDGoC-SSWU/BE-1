USE market_db;

CREATE TABLE hongong1 (
    toy_id INT, 
    toy_name CHAR(4), 
    age INT
);

INSERT INTO hongong1 VALUES (1, '피카츄', 25);
INSERT INTO hongong1(toy_id, toy_name) VALUES (2, '파이리');
INSERT INTO hongong1(toy_name, age, toy_id) VALUES ('꼬부기', 20, 3);

SELECT * 
FROM hongong1;

CREATE TABLE hongong2 (
    toy_id INT AUTO_INCREMENT PRIMARY KEY,
    toy_name CHAR(4), 
    age INT
);

INSERT INTO hongong2 VALUES (NULL, '라이츄', 25);
INSERT INTO hongong2 VALUES (NULL, '야도란', 22);
INSERT INTO hongong2 VALUES (NULL, '잠만보', 21);

SELECT * 
FROM hongong2;

SELECT LAST_INSERT_ID();

ALTER TABLE hongong2 AUTO_INCREMENT = 50;
INSERT INTO hongong2 VALUES (NULL, '뮤츠', 35);

SELECT * 
FROM hongong2;

CREATE TABLE hongong3 (
    toy_id INT AUTO_INCREMENT PRIMARY KEY,
    toy_name CHAR(4), 
    age INT
);

ALTER TABLE hongong3 AUTO_INCREMENT = 200;
SET @@auto_increment_increment = 5;

INSERT INTO hongong3 VALUES (NULL, '이상해씨', 20);
INSERT INTO hongong3 VALUES (NULL, '버터플', 23);
INSERT INTO hongong3 VALUES (NULL, '리자몽', 25);

SELECT * 
FROM hongong3;
