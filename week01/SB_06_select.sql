USE market_db;
SELECT * FROM market_db.member WHERE mem_name = '블랙핑크';

SELECT addr, height 키 , debut_date "데뷔 일자" FROM member;

SELECT * FROM member WHERE mem_name = '블랙핑크';
SELECT * FROM member WHERE mem_number = 4;
SELECT mem_id, mem_name FROM member WHERE height <= 162;
SELECT mem_name, height, mem_number FROM member WHERE height >= 165 AND mem_number > 6;
SELECT mem_name, height, mem_number FROM member WHERE height >= 165 OR mem_number > 6;
SELECT mem_name, height FROM member WHERE height >= 163 AND height <= 165;
SELECT mem_name, height FROM member WHERE height BETWEEN 163 AND 165;
SELECT mem_name, addr FROM member WHERE addr = '경기' OR addr = '전남' OR addr = '경남';
SELECT mem_name, addr FROM member WHERE addr IN('경기', '전남', '경남');
SELECT * FROM member WHERE mem_name LIKE '우%';
SELECT * FROM member WHERE mem_name LIKE '__핑크';