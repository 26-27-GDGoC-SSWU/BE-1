USE market_db; 

SELECT mem_id, mem_name, debut_date, height
	FROM member
    -- ORDER BY debut_date; -- 데뷔일자 기준으로 정렬(디폴트는 오름차순)
    -- ORDER BY debut_date DESC; -- DESC는 내림차순 / ASC는 오름차순(생략 가능)
    
    -- ORDER BY height DESC -- 키를 기준으로 내림차순 정렬 
    -- WHERE height >=164; -- 오류발생 : 쿼리 순서 틀림 (SELECT -> FROM -> WHERE -> ORDER BY) 
    -- 이떄 WHERE절은 생략 가능. but, 사용할 경우에는 쿼리 순서 반드시 지킬 것 
    
    WHERE height >=164 -- 164이상 
    -- ORDER BY height DESC; -- 키를 기준으로 내림차순 정렬 => 이때 동률일때는 랜덤으로 추출?
    
    ORDER BY height DESC, debut_date ASC; -- 키는 내림차순, 데뷔일자는 오름차순으로 지정 (height을 먼저 하고 동률이 나올경우에만 뒤에 진행)
    
SELECT * FROM member LIMIT 3 ; -- 3개만 보여줌 
    
-- 데뷔일자가 빠른 회원 3팀을 조회 쿼리
SELECT mem_name, debut_date
	FROM member
    ORDER by debut_date -- 데뷔일자가 빠른(오름차순)
	-- LIMIT 3; -- 3개만
	LIMIT 3,2; -- 3번째 부터 2개 행 (키가 3등부터 2팀)


SELECT addr FROM member;

-- DISTINCT
-- 중복된거는 하나만 보여주는 구문 = 중복을 제외하고 보여줌 
SELECT DISTINCT addr FROM member;
	
SELECT mem_id, SUM(amount) FROM buy GROUP BY mem_id;

-- 별칠 활용 
-- 총 구매개수를 ID로 그룹화 
SELECT mem_id "회원 아이디" , SUM(amount) "총 구매 개수" FROM buy GROUP BY mem_id;

-- 전체의 평균
SELECT AVG(amount) "평균 구매 개수" FROM buy ;

-- 회원 별로 한번올때 구매해 가는 개수 (평균 구매 개수)
SELECT mem_id, AVG(amount) "평균 구매 개수" 
	FROM buy 
    GROUP BY mem_id; -- 멤버ID로 묶음

-- 이거 너무 지저분하잖아 수치 정규화 하는 방법 ?

-- COUNT : 행의 개수
SELECT COUNT(*) FROM member; -- COUNT(*) : 모든 회원
    
SELECT COUNT(phone1) "연락처가 있는 회원" FROM member; -- COUNT(열 이름) : 열에 값이 있는 애들만 COUNT / NULL은 카운트 x

SELECT mem_id "회원 아이디", SUM(price*amount) "총 구매 금액"
	FROM buy
    -- WHERE SUM(price*amount) > 1000 -- 총 구매금액이 1천만원 이상할때를 원하지만 오류 발생!!
    -- WHERE절에는 그룹함수 X -> hAVING절 사용
    GROUP BY mem_id
    HAVING SUM(price*amount) > 1000 
    ORDER BY SUM(price*amount) DESC; -- 내림차순 정렬
    


