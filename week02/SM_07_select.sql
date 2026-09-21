USE market_db;

-- 1. 데뷔일 기준 정렬
SELECT mem_id, mem_name, debut_date 
FROM member 
ORDER BY debut_date;

SELECT mem_id, mem_name, debut_date 
FROM member 
ORDER BY debut_date ASC; -- ASC(오름차순) 생략 가능

SELECT mem_id, mem_name, debut_date 
FROM member 
ORDER BY debut_date DESC; -- DESC(내림차순)

-- 2. 오류 예시 (WHERE와 ORDER BY 순서 오류)
SELECT mem_id, mem_name, debut_date, height
FROM member
ORDER BY height DESC
WHERE height >= 164;
-- 오류 발생: WHERE가 ORDER BY보다 먼저 와야 함

-- 3. 올바른 조건 및 다중 정렬
SELECT mem_id, mem_name, debut_date, height
FROM member
WHERE height >= 164
ORDER BY height DESC;

SELECT mem_id, mem_name, debut_date, height
FROM member
WHERE height >= 164
ORDER BY height DESC, debut_date ASC; -- height 동률일 때 debut_date로 정렬

-- 4. LIMIT 활용
SELECT * 
FROM member 
LIMIT 3; -- 상위 3건 조회

SELECT mem_name, debut_date
FROM member
ORDER BY debut_date
LIMIT 3; -- 정렬 후 상위 3건

SELECT mem_name, height
FROM member
ORDER BY height DESC
LIMIT 3, 2; -- 3번째부터 2건 조회 (0부터 시작하므로 4, 5번째 행)

-- 5. DISTINCT: 중복 제거
SELECT addr 
FROM member;

SELECT addr 
FROM member 
ORDER BY addr;

SELECT DISTINCT addr 
FROM member;

-- 6. GROUP BY 및 집계 함수
SELECT mem_id, amount 
FROM buy 
ORDER BY mem_id;

SELECT mem_id, SUM(amount) 
FROM buy 
GROUP BY mem_id;

SELECT mem_id "회원 아이디", SUM(amount) "총 구매 개수" 
FROM buy 
GROUP BY mem_id; -- 별칭 추가

SELECT mem_id "회원 아이디", SUM(price * amount) "총 구매 금액" 
FROM buy 
GROUP BY mem_id;

SELECT AVG(amount) "평균 구매 개수" 
FROM buy;

SELECT mem_id, AVG(amount) "평균 구매 개수" 
FROM buy 
GROUP BY mem_id;

-- 7. COUNT 함수
SELECT COUNT(*) 
FROM member;

SELECT COUNT(phone1) "연락처가 있는 회원" 
FROM member;

-- 8. HAVING 절 (집계 조건)
-- 오류 예시 (집계 함수 조건은 WHERE에 사용 불가)
SELECT mem_id "회원 아이디", SUM(price * amount) "총 구매 금액" 
FROM buy 
WHERE SUM(price * amount) > 1000
GROUP BY mem_id;
-- 오류 발생: GROUP BY 집계 조건은 HAVING을 사용해야 함

-- 올바른 HAVING 사용
SELECT mem_id "회원 아이디", SUM(price * amount) "총 구매 금액" 
FROM buy
GROUP BY mem_id
HAVING SUM(price * amount) > 1000;

-- HAVING + 정렬(ORDER BY)
SELECT mem_id "회원 아이디", SUM(price * amount) "총 구매 금액" 
FROM buy
GROUP BY mem_id
HAVING SUM(price * amount) > 1000
ORDER BY SUM(price * amount) DESC;
