#1. 나만의 테이블 만들기
-- 테이블 명: burgers
-- 테이블 설명: 버거킹 메뉴의 정보를 저장하는 테이블
--
-- 컬럼 설명
-- id : 버거의 고유 번호
-- burger_name : 버거 이름
-- cost : 버거 가격
-- gram : 버거 중량(g/ml)
-- kcal : 버거 열량(kcal)
-- rating : 버거 평점(0~5점)

CREATE DATABASE hw; -- 데이터베이스 hw 생성
USE hw;


#2. 테이블 생성
CREATE TABLE burgers (
	id INT PRIMARY KEY,	-- 버거 번호
	burger_name VARCHAR(50), -- 버거 이름
	cost SMALLINT(50),	-- 가격
	gram SMALLINT(50),	-- 중량(g/ml)
	kcal SMALLINT(50),	-- 열량
    rating DECIMAL(2,1)	-- 평점 0~5점
);


#3. 데이터 추가
INSERT INTO burgers VALUES (1, '통새우와퍼', 9200, 309, 714, 4.5);
INSERT INTO burgers VALUES (2, '몬스터와퍼', 10600, 403, 1094, 3.0);
INSERT INTO burgers VALUES (3, '콰트로치즈와퍼', 9200, 331, 887, 4.0);
INSERT INTO burgers VALUES (4, '불고기와퍼', 8100, 293, 738, 2.5);
INSERT INTO burgers VALUES (5, '보일링씨푸드버거 버터갈릭', 10200, 233, 641, 2.5);
SELECT * FROM burgers;


#4. 데이터 조회
-- 버거 평균 중량
SELECT AVG(gram) AS avg_gram
FROM burgers;

-- 열량 높은 순서대로 조회
SELECT *
FROM burgers
ORDER BY kcal DESC;

-- 가격이 9000원 이상인 버거만 출력
SELECT *
FROM burgers
WHERE cost >= 9000;

-- 버거 이름에 '와퍼'가 포함된 메뉴 조회
SELECT *
FROM burgers
WHERE burger_name LIKE '%와퍼%';


#5. 데이터 수정/삭제
UPDATE burgers
SET rating = 4.0
WHERE id = 4;
SELECT * FROM burgers;

DELETE FROM burgers
WHERE id = 5;
SELECT * FROM burgers;