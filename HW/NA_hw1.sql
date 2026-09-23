-- 테이블명: subway_menu
-- 테이블 설명: 서브웨이 샌드위치 메뉴의 가격 및 영양 정보를 저장하는 테이블
--
-- 컬럼 설명
-- id      : 메뉴의 고유 번호
-- name    : 서브웨이 샌드위치 메뉴 이름
-- price   : 가격 (원)
-- kcal    : 열량 (kcal)
-- protein : 단백질 함량 (g)

create database subway_menu; -- db 생성
use subway_menu -- 어떤 db를 사용할것인지

create table subway_menu (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name varchar(50),
    price int,
    kcal INT,
    protein DECIMAL(4,1)
    );
    
-- 데이터 추가 
INSERT INTO subway_menu (name, price, kcal, protein) -- 처음에 어떤 식으로 값을 넣을건지 정하고 
VALUES -- 삽입할 값 작성 
    ('참치', 6200, 316, 26.9),
    ('에그마요', 5900, 416, 16.4),
    ('비엘티', 7100, 300, 15.9),
    ('터키베이컨아보카도',7900,410,19.5),
    ('이탈리안비엘티',7500,388,21.0);

-- 데이터 조회
SELECT * FROM subway_menu; -- 전체 데이터 조회
select * from subway_menu where protein >= 20; -- 단백질 20g 이상인 메뉴만 조회
select name,price,kcal from subway_menu where price <= 6000; --  6천원 이하인 메뉴중 name,price,kcal만 조회 
select * from subway_menu order by kcal ASC; -- 열랑이 낮은 순서대로 조회

-- 데이터 수정 
update subway_menu set price = 7700 where name = '이탈리안비엘티';
update subway_menu set kcal = 310 where id = 3;
SELECT * FROM subway_menu; -- 바뀐 데이터 조회용 

-- 데이터 삭제 
DELETE FROM subway_menu WHERE name = '비엘티'; -- 비엘티 메뉴 단종으로 인한 삭제

-- 데이터 삽입 
insert into subway_menu VALUES (6,'로티세리바비큐치킨', 7500, 327, 24.0);

SELECT * FROM subway_menu; -- 바뀐 데이터 조회용 