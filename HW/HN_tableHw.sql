-- 테이블명 : dessert39
-- 테이블 설명 : 카페 dessert39에 있는 메뉴들을 저장하는 테이블
--
-- 칼럼 설명
-- drinks_id : 음료의 고유 번호
-- categroy : 음료의 카테고리
-- drinks_name : 음료명
-- price : 음료의 가격
-- calories : 음료의 칼로리

CREATE DATABASE practice_db;

USE practice_db;

-- dessert39 테이블 생성 
CREATE TABLE practice_db.dessert39 -- USE practice_db하더라도 테이블 CREATE 할때 어디 데이터베이스에 만들지 앞에 적어야함
( drinks_id 	INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  category 		varchar(10),
  drinks_name 	varchar(10) NOT NULL,
  price 		INT NOT NULL,
  calories  	INT
  );
  
  
  -- 행 데이터 추가하기 
  INSERT INTO dessert39 VALUES(NULL, '커피', '아메리카노', 2000, 10);
  INSERT INTO dessert39 VALUES(NULL, '논커피', '딸기라떼', 4800, 200);
  INSERT INTO dessert39 VALUES(NULL, '티', '히비스커스티', 3900, 15);
  INSERT INTO dessert39 VALUES(NULL, '커피', '바닐라 라떼', 4800, 250);
  INSERT INTO dessert39 VALUES(NULL, '티', '콜드브루', 1900, 10);
  INSERT INTO dessert39 VALUES(NULL, '논커피', '말차 라떼', 4400, 300);
  INSERT INTO dessert39 VALUES(NULL, '티', '복숭아 아이스티', 2800, 210);
  INSERT INTO dessert39 VALUES(NULL, '커피', '카페라떼', 4500, 190);
  INSERT INTO dessert39 VALUES(NULL,'논커피','밀크티', 4500, 210);
  
  -- 행 데이터 수정하기 
UPDATE dessert39
	SET category='커피'
    WHERE drinks_name='콜드브루';
    
DELETE FROM dessert39
	WHERE drinks_name='밀크티';
    
SELECT * FROM dessert39;

SELECT drinks_name, price FROM dessert39
	WHERE price<3000;
    
SELECT category, drinks_name FROM dessert39
	WHERE category='커피';
    
SELECT category, COUNT(category)
	FROM dessert39
    GROUP BY category; -- category별로 묶어서 몇개의 음료가 있는지 세기 
    
SELECT category, COUNT(category)
	FROM dessert39
    GROUP BY category
    HAVING category='티'; -- category 그룹 만들고 '티'종류의 음료가 몇개인지 세기
    
SELECT COUNT(*)
	FROM dessert39
    WHERE calories>200; -- calories 가 200이 넘는 행을 세기





  

