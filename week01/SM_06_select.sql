USE market_db;
SELECT * 
FROM member;

SELECT * 
FROM member WHERE mem_name = '소녀시대';
SELECT mem_name 그룹명, debut_date '활동 시작일', mem_number '멤버 수' FROM member;

SELECT mem_name, height
FROM member WHERE height >= 165 AND height <= 167;
SELECT mem_name, height
FROM member WHERE height BETWEEN 165 AND 167;

SELECT mem_name, addr
FROM member WHERE addr = '서울' OR addr = '경북';
SELECT mem_name, addr
FROM member WHERE addr IN('서울', '경북');

SELECT mem_name
FROM member WHERE mem_name LIKE '마%';
SELECT mem_name
FROM member WHERE mem_name LIKE '%걸';
SELECT mem_name 
FROM member WHERE mem_name LIKE '__시대';
SELECT mem_name
FROM member WHERE mem_name LIKE '에이__';
