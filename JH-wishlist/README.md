# Wishlist CRUD API

Spring Boot, Spring Data JPA, MySQL을 활용한 개인 위시리스트 관리 프로젝트입니다.

## 1. 프로젝트 소개

사고 싶은 상품을 등록하고, 가격·카테고리·구매 우선순위 및 구매 여부를 관리하는 서비스입니다.

## 2. 기술 스택

- Java 21
- Spring Boot
- Spring Data JPA
- MySQL
- Gradle

## 3. API 명세

| Method | Endpoint | 기능 |
|---|---|---|
| GET | `/api/wishlist` | 전체 상품 조회 |
| GET | `/api/wishlist/{id}` | 개별 상품 조회 |
| POST | `/api/wishlist` | 상품 등록 |
| PUT | `/api/wishlist/{id}` | 상품 정보 수정 |
| DELETE | `/api/wishlist/{id}` | 상품 삭제 |

## 4. 데이터 구조

| 필드 | 타입 | 설명 |
|---|---|---|
| id | Long | 상품 고유 ID |
| name | String | 상품명 |
| category | String | 카테고리 |
| price | Integer | 상품 가격 |
| priority | String | 구매 우선순위 |
| purchased | boolean | 구매 여부 |

## 5. API 요청 예시

**POST `/api/wishlist`**

```json
{
  "name": "MacBook",
  "category": "전자기기",
  "price": 2000000,
  "priority": "높음",
  "purchased": false
}
```

## 6. 구현 현황

- [x] Spring Boot 프로젝트 생성
- [x] MySQL 및 JPA 연동
- [x] Entity, Repository, Service, Controller 구성
- [x] 상품 등록 API 테스트
- [x] 전체 CRUD API 테스트
- [x] 카테고리별 조회 및 정렬 기능
- [x] 웹 화면 구현
