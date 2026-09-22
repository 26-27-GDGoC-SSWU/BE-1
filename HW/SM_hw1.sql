-- 1. 테이블 명: mega_coffee_menu
-- 2. 테이블 설명: 메가커피의 주요 5가지 음료 메뉴 정보를 저장하는 테이블
-- 3. 컬럼 설명 
-- menu_id (INT, PK)       : 메뉴 고유 식별 번호 (기본키)
-- menu_name (CHAR(20))    : 음료 메뉴 이름
-- price (INT)             : 판매 가격 (원 단위)
-- calories_kcal (INT)     : 1회 제공량당 열량 (kcal 단위)
-- caffeine_mg (INT)       : 1회 제공량당 카페인 함량 (mg 단위)

-- 1. CREATE TABLE: 테이블 생성 (총 5개 열)
CREATE TABLE mega_coffee_menu (
    menu_id INT PRIMARY KEY,
    menu_name VARCHAR(20) NOT NULL,
    price INT NOT NULL,
    calories_kcal INT NOT NULL,
    caffeine_mg INT NOT NULL
);

-- 2. INSERT: 데이터 5개 삽입 (아메리카노, 할메가커피, 딸기라떼, 큐브라떼, 사과유자차)
INSERT INTO mega_coffee_menu (menu_id, menu_name, price, calories_kcal, caffeine_mg) VALUES
(1, '아메리카노', 2000, 18, 193),
(2, '할메가커피', 1900, 313, 147),
(3, '딸기라떼', 3700, 366, 0),
(4, '큐브라떼', 4200, 304, 313),
(5, '사과유자차', 3500, 229, 0);

-- 3. SELECT: 전체 메뉴를 칼로리가 낮은 순서대로 정렬하여 조회
SELECT 
    menu_name, 
    calories_kcal, 
    price 
FROM mega_coffee_menu 
ORDER BY calories_kcal ASC;

-- 300kcal 미만이면서 카페인이 함유된 음료 목록 조회
SELECT 
    menu_name, 
    calories_kcal, 
    caffeine_mg, 
    price 
FROM mega_coffee_menu 
WHERE calories_kcal < 300 
  AND caffeine_mg > 0;

-- 가격이 3,000원 이상인 메뉴 중 논카페인 음료 조회
SELECT 
    menu_name, 
    price, 
    calories_kcal 
FROM mega_coffee_menu 
WHERE price >= 3000 
  AND caffeine_mg = 0;

-- 4. UPDATE: 딸기라떼의 판매 가격을 3,700원에서 3,900원으로 수정
UPDATE mega_coffee_menu 
SET price = 3900 
WHERE menu_name = '딸기라떼';

-- 5. DELETE: 사과유자차 메뉴 삭제
DELETE FROM mega_coffee_menu 
WHERE menu_name = '사과유자차';
