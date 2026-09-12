USE market_db;
SELECT mem_id, mem_name, debut_date FROM member ORDER BY debut_date;
SELECT mem_id, mem_name, debut_date FROM member ORDER BY debut_date ASC; -- ASC(오름차순) 생략 가능
SELECT mem_id, mem_name, debut_date FROM member ORDER BY debut_date DESC; -- DESC(내림차순)

SELECT mem_id, mem_name, debut_date, height
	FROM member
    ORDER BY height DESC
    WHERE height >= 164;
    -- 오류 발생. WHERE와 ORDER BY의 순서를 정확하게 해야한다.

SELECT mem_id, mem_name, debut_date, height
	FROM member
    WHERE height >= 164
    ORDER BY height DESC;

SELECT mem_id, mem_name, debut_date, height
	FROM member
    WHERE height >= 164
    ORDER BY height DESC, debut_date ASC; -- height가 동률일때, debut_date로 판단해서 정렬
    
SELECT * FROM member LIMIT 3; -- 3개만 보겠다고 설정

SELECT mem_name, debut_date
	FROM member
    ORDER BY debut_date
    LIMIT 3; -- 차례 잘 지켜서 작성하기 ORDER BY > LIMIT

SELECT mem_name, height
	FROM member
    ORDER BY height DESC
    LIMIT 3, 2; -- 3번째부터 2개를 보여준다.

-- DISTINCT: 중복을 하나만 보여준다.
SELECT addr FROM member;
SELECT addr FROM member ORDER BY addr;
SELECT DISTINCT addr FROM member;

-- GROUP BY:
SELECT mem_id, amount FROM buy ORDER BY mem_id;
SELECT mem_id, SUM(amount) FROM buy GROUP by mem_id;
SELECT mem_id "회원 아이디", SUM(amount) "총 구매 개수" FROM buy GROUP by mem_id; -- 별칭 추가

SELECT mem_id "회원 아이디", SUM(price*amount) "총 구매 금액" FROM buy GROUP by mem_id;
SELECT AVG(amount) "평균 구매 개수" FROM buy;
SELECT mem_id, AVG(amount) "평균 구매 개수" FROM buy GROUP BY mem_id;

SELECT COUNT(*) FROM member;
SELECT COUNT(phone1) "연락처가 있는 회원" FROM member;

SELECT mem_id "회원 아이디", SUM(price*amount) "총 구매 금액" 
	FROM buy 
    WHERE SUM(price*amount) > 1000
    GROUP BY mem_id;
    -- 오류 발생. GROUP BY를 사용할땐 HAVING을 사용해야한다.

SELECT mem_id "회원 아이디", SUM(price*amount) "총 구매 금액" 
	FROM buy
    GROUP BY mem_id
	HAVING SUM(price*amount) > 1000 ;

SELECT mem_id "회원 아이디", SUM(price*amount) "총 구매 금액" 
	FROM buy
    GROUP BY mem_id
	HAVING SUM(price*amount) > 1000
    ORDER BY SUM(price*amount) DESC;

    