USE market_db;
SELECT mem_id, mem_name, debut_date
	FROM `member`
    ORDER BY debut_date; -- 오름차순으로 정렬 (ASC 생략가능)
    
SELECT mem_id, mem_name, debut_date
	FROM `member`
    ORDER BY mem_name DESC; -- 내림차순으로 정렬 

SELECT mem_id, mem_name, debut_date, height
	FROM `member`
    ORDER BY height
    WHERE height>=160; -- ORDER BY가 WHERE 보다 먼저와서 오류발생 
    
SELECT mem_id, mem_name, debut_date, height
	FROM `member`
    WHERE height>=160
    ORDER BY height; 
    
SELECT mem_id, mem_name, debut_date, height
	FROM `member`
    WHERE height>=160
    ORDER BY height DESC, mem_id ; -- height 기준정렬했을때 같은 값이 존재하는 경우, mem_id 기준으로 순서 정함 

SELECT mem_id, mem_name, debut_date, height
	FROM `member`
    ORDER BY height
    LIMIT 3; -- 키가 제일 작은 3명의 데이터 조회 
    
    SELECT mem_id, mem_name, debut_date, height
	FROM `member`
    ORDER BY height
    LIMIT 3,2; -- 키가 3번째로 작은 사람을 포함해 2명의 데이터 조회 (3등, 4등)
    
    SELECT DISTINCT addr FROM `member` -- 중복된 addr의 값을 1개씩만 띄우기 member
    
    
    SELECT mem_id, SUM(amount) FROM buy GROUP BY mem_id; -- mem_id가 같은 행끼리 amount값 SUM 하기
	SELECT mem_id "회원아이디", SUM(amount) "총 구매 수량" FROM buy GROUP BY mem_id; 
    
    SELECT mem_id "회원아이디", SUM(amount*price) "총 구매 가격" FROM buy GROUP BY mem_id; -- 회원별 총 구매 가격 
    SELECT mem_id "회원아이디", AVG(amount) "평균 구매 수량" FROM buy GROUP BY mem_id; -- 회원별 평균 구매 수량
    
    SELECT COUNT(phone1) "연락처가 있는 회원" FROM `member`; 
    
    SELECT mem_id "회원 아이디", SUM(amount*price) "총 구매 가격" 
		FROM buy 
		WHERE SUM(amount*price) >=1000 -- 그룹화되기 전의 개별 행의 조건을 검사함
        GROUP BY mem_id; 
        
	 SELECT mem_id "회원 아이디", SUM(amount*price) "총 구매 가격" 
		FROM buy 
        GROUP BY mem_id 
        HAVING SUM(amount*price) >=1000; -- GROUP BY에서 조건을 줄 때는 HAVING 사용하기
    
    
		
