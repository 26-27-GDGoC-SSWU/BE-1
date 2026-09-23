-- 내부 조인 
-- SELECT <열 목록>
-- FROM <첫번째 테이블> 
	-- INNER JOIN <두번째 테이블>
	-- ON <조인될 조건> 
-- [WHERE 검색 조건]

USE market_db

DROP TABLE IF EXISTS market_db.member;

SELECT *
	FROM buy
		INNER JOIN market_db.member
        ON buy.mem_id=market_db.member.mem_id
	WHERE buy.mem_id='GRL';
    
SELECT *
	FROM buy
		INNER JOIN market_db.member
        ON buy.mem_id=market_db.member.mem_id

SELECT mem_id, mem_name, prod_name, addr, CONCAT(phone1, phone2) AS '연락처'
	FROM buy
		INNER JOIN market_db.member
        ON buy.mem_id=market_db.member_id;

SELECT M.mem_id, M.mem_name, B.prod_name, M.addr
	FROM buy B
		LEFT OUTER JOIN buy B
        ON M.mem_id=B.mem_id
	ORDER BY M.mem_id;
    
SELECT M.mem_id, M.mem_name, B.prod_name, M.addr
	FROM buy B
		RIGHT OUTER JOIN member M
        ON M.mem_id=B.mem_id
	ORDER BY M.mem_id;
    
SELECT DISTINCT M_mem_id, B.prod_name, M.mem_name, M.mem_addr
	FROM buy B
		RIGHT OUTER JOIN member M
        ON M.mem_id=B.mem_id
	ORDER BY M.mem_id;
    
SELECT A.emp "직원", B.emp "직속상관", B.phone "직속상관연락처"
	FROM emp_table A
		INNER JOIN emp_table B
			ON A.manager=B.emp
		WHERE A.emp='경리부장';

SELECT * FROM market_db.member;
SELECT * FROM buy;
