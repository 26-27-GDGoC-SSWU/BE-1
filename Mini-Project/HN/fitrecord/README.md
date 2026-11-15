# 🏋️ FitRecord

**운동 기록 관리 웹사이트**

## 1. 프로젝트 소개

FitRecord는 사용자가 자신의 운동 기록을 등록하고 관리할 수 있는 웹 애플리케이션.

운동 날짜, 종류, 시간, 메모를 기록하고 기존 기록을 조회, 수정, 삭제 가능.

## 2. 주요 기능

- **운동 기록 등록:** 운동 정보 입력 및 저장
- **운동 기록 조회:** 전체 기록 및 상세 정보 확인
- **운동 기록 수정:** 기존 운동 정보 변경
- **운동 기록 삭제:** 불필요한 기록 삭제

## 3. 기술 스택

- Language: Java
- Framework: Spring Boot
- ORM: Spring Data JPA
- Database: MySQL 8.0
- Build Tool: Gradle
- Frontend: HTML, CSS, Thymeleaf

## 4. 프로젝트 구조

```text
com.fitrecord
 ├── controller
 │    └── WorkoutController.java
 ├── service
 │    └── WorkoutService.java
 ├── repository
 │    └── WorkoutRepository.java
 └── entity
      └── Workout.java
```

## 5. 실행 방법

1. MySQL에서 `fitrecord` 데이터베이스 생성
2. `application.properties`에 DB 연결 정보 설정
3. IntelliJ에서 `FitRecordApplication.java` 실행
4. 브라우저에서 접속

```text
http://localhost:8080
```

## 6. 데이터 처리 구조

사용자 → Controller → Service → Repository → MySQL

Spring MVC와 JPA를 활용하여 운동 기록의 CRUD 기능을 구현.