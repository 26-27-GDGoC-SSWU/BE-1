USE market_db;
SELECT * FROM `member`;

SELECT * FROM `member` WHERE mem_name='블랙핑크';
SELECT height 키, debut_date '데뷔 일자', addr 주소 FROM `member`;

SELECT height, mem_name FROM `member` WHERE height>=160 AND height<=170;
SELECT height, mem_name FROM `member` WHERE height BETWEEN 160 AND 170;

SELECT addr, mem_name FROM `member` WHERE addr='서울' OR '경기' OR'경남';
SELECT addr, mem_name FROM `member` WHERE addr IN('서울','경기','경남');

SELECT mem_name FROM `member` WHERE mem_name LIKE '%녀';
SELECT mem_name FROM `member` WHERE mem_name LIKE '우%';
SELECT mem_name FROM `member` WHERE mem_name LIKE '__핑크';
SELECT mem_name FROM `member` WHERE mem_name LIKE '블랙__';