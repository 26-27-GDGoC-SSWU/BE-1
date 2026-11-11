# 서울 팝업스토어 모음

서울에서 열리는 팝업스토어를 한 곳에 모아보고 직접 등록할 수 있는 웹 사이트

## 1. 프로젝트 소개

팝업스토어 정보가 여기저기 흩어져 있어서 한 곳에 모아 보려고 만든 프로젝트

팝업 이름, 브랜드, 카테고리, 지역, 기간, 한줄 소개, 공식 링크를 등록하고 조회, 수정, 삭제 가능
진행 상태(진행중 / 오픈예정 / 종료)는 시작일, 종료일과 오늘 날짜를 비교해서 자동으로 표시

## 2. 주요 기능

- **팝업 목록** : 등록된 팝업 전체를 표로 조회 (상태, 이름, 브랜드, 카테고리, 지역, 기간)
- **팝업 등록** : 새 팝업 정보 입력 후 저장
- **팝업 상세** : 팝업 정보 전체 확인
- **팝업 수정** : 기존 정보 수정
- **팝업 삭제** : 팝업 삭제
- **진행 상태 자동 표시** : DB에 저장하지 않고 날짜로 계산

## 3. 기술 스택

- Language : Java 17
- Framework : Spring Boot 4.1.2
- ORM : Spring Data JPA
- Database : MySQL 8.0
- Build Tool : Gradle
- Frontend : HTML, Thymeleaf

## 4. 프로젝트 구조

```text
com.naea.popupstore
 ├── controller
 │    ├── PopupStoreController.java
 │    └── PopupStoreForm.java
 ├── service
 │    └── PopupStoreService.java
 ├── repository
 │    └── PopupStoreRepository.java
 └── domain
      ├── PopupStore.java
      └── Category.java

resources
 ├── application.properties
 └── templates/popups
      ├── popupList.html
      ├── popupDetail.html
      ├── createPopupForm.html
      └── editPopupForm.html
```

## 5. API 명세

| 기능 | Method | URL | 화면 / 결과 |
|---|---|---|---|
| 팝업 목록 | GET | `/` | popupList.html |
| 등록 화면 | GET | `/popups/new` | createPopupForm.html |
| 팝업 등록 | POST | `/popups/new` | 저장 후 목록으로 이동 |
| 팝업 상세 | GET | `/popups/{id}` | popupDetail.html |
| 수정 화면 | GET | `/popups/{id}/edit` | editPopupForm.html |
| 팝업 수정 | POST | `/popups/{id}/edit` | 수정 후 상세로 이동 |
| 팝업 삭제 | POST | `/popups/{id}/delete` | 삭제 후 목록으로 이동 |

## 6. 데이터 구조

**PopupStore (popup_store 테이블)**

| 컬럼 | 타입 | 설명 | 예시 |
|---|---|---|---|
| id | Long | 팝업 고유 번호 (PK) | 1 |
| name | String | 팝업 이름 | 산리오 팝업 |
| brand | String | 브랜드 | 산리오 |
| category | Category (enum) | 카테고리 | 캐릭터 |
| region | String | 지역 | 성수 |
| start_date | LocalDate | 시작일 | 2026-11-01 |
| end_date | LocalDate | 종료일 | 2026-11-30 |
| description | String | 한줄 소개 | 산리오 캐릭터 굿즈 팝업 |
| official_url | String | 공식 링크 | https://... |

- 카테고리 : 캐릭터, 패션, 뷰티, 식음료, 키즈_반려동물
- 진행 상태는 컬럼으로 저장하지 않고 `getStatus()`에서 계산



