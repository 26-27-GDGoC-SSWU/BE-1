USE market_db; -- 지금 사용할 테이블 지정

-- 내부 조인 
SELECT * -- 모든 테이블에 대하여 
	FROM buy -- 조인할 테이블 1
		INNER JOIN member -- 조인할 테이블 2 
		ON buy.mem_id = member.mem_id ; -- 조건: 각 테이블의 아이디가 같을 시 
	-- WHERE buy.mem_id = "GRL"; -- 검색 조건 : ID가 GRL인 경우만 조회
    -- WHERE 생략시 전체를 조인함
    
    
SELECT mem_id, mem_name, prod_name, addr, CONCAT(phone1, phone2) AS '연락처' -- 총 5개의 컬럼을 조회
-- CONCAT은 두개의 열을 엮어줌, AS는 별칭 지정
	FROM buy 
		INNER JOIN member
        ON buy.mem_id = member.mem_id; -- id가 맞는 애들 끼리 조인을 하겠다
-- 오류 발생 : mem_id가 두개의 테이블에 모두 존재 -> 어떤걸 출력해야하는지 명시해줘야함 

SELECT buy.mem_id, mem_name, prod_name, addr, CONCAT(phone1, phone2) AS '연락처' 
	FROM buy 
		INNER JOIN member
        ON buy.mem_id = member.mem_id; 
-- buy 테이블의 id를 출력하겠다 

-- 테이블 별명을 지칭해서 조인하는 방법 
SELECT B.mem_id, M.mem_name, B.prod_name, M.addr,
		CONCAT(M.phone1, M.phone2) AS '연락처'
	FROM buy B -- 테이블 별명을 지정
		INNER JOIN member M -- 테이블 별명을 지정
        ON B.mem_id = M,mem_id;
        
-- 외부 조인
SELECT M.mem_id, M.mem_name, B.prod_name, M.addr
   FROM member M
     LEFT OUTER JOIN buy B -- 왼쪽기준 외부조인 : member 테이블은 전부 출력
     ON M.mem_id = B.mem_id
   ORDER BY M.mem_id; -- 정렬 
   
SELECT M.mem_id, M.mem_name, B.prod_name, M.addr
   FROM buy B
     RIGHT OUTER JOIN member M -- 오른쪽 기준 외부조인 : buy 테이블은 전부 출력
     ON M.mem_id = B.mem_id
   ORDER BY M.mem_id;
-- 출력이 동일

SELECT M.mem_id, M.mem_name, B.prod_name, M.addr
   FROM member M
     LEFT OUTER JOIN buy B -- 왼쪽기준 외부조인 : member 테이블은 전부 출력
     ON M.mem_id = B.mem_id
   ORDER BY M.mem_id; -- 정렬 
   
SELECT M.mem_id, M.mem_name, B.prod_name, M.addr
   FROM member M
     RIGHT OUTER JOIN buy B -- 왼쪽기준 외부조인 : member 테이블은 전부 출력
     ON M.mem_id = B.mem_id
   ORDER BY M.mem_id; -- 정렬 
   
-- 상호조인 (조건 X)
SELECT * 
   FROM buy 
     CROSS JOIN member ;
     
SELECT COUNT(*) "데이터 개수"
   FROM sakila.inventory
      CROSS JOIN world.city;

-- 자체조인 
CREATE TABLE emp_table (emp CHAR(4), manager CHAR(4), phone VARCHAR(8));

INSERT INTO emp_table VALUES('대표', NULL, '0000');
INSERT INTO emp_table VALUES('영업이사', '대표', '1111');
INSERT INTO emp_table VALUES('관리이사', '대표', '2222');
INSERT INTO emp_table VALUES('정보이사', '대표', '3333');
INSERT INTO emp_table VALUES('영업과장', '영업이사', '1111-1');
INSERT INTO emp_table VALUES('경리부장', '관리이사', '2222-1');
INSERT INTO emp_table VALUES('인사부장', '관리이사', '2222-2');
INSERT INTO emp_table VALUES('개발팀장', '정보이사', '3333-1');
INSERT INTO emp_table VALUES('개발주임', '정보이사', '3333-1-1');

SELECT A.emp "직원" , B.emp "직속상관", B.phone "직속상관연락처"
   FROM emp_table A -- 별칭 A
      INNER JOIN emp_table B -- 별칭 B
         ON A.manager = B.emp -- A의 직원과 B의 직속 상환을 조인
   WHERE A.emp = '경리부장'; -- 격리부장을 알고싶
        