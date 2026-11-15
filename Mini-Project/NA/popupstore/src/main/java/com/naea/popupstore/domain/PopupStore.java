package com.naea.popupstore.domain;

import jakarta.persistence.*;

import java.time.LocalDate;

//팝업스토어 테이블이 될 엔터티
//@Entity 붙이면 jpa가 popup_store 테이블을 만들어줌
@Entity
public class PopupStore {

    @Id //기본키(pk)
    @GeneratedValue(strategy = GenerationType.IDENTITY) //번호는 db가 1,2,3 자동으로 매김
    private Long id;

    private String name;        // 팝업 이름
    private String brand;       // 브랜드

    @Enumerated(EnumType.STRING) //db에 0,1 숫자 말고 "패션" 글자 그대로 저장
    private Category category;  // 카테고리

    private String region;      // 지역
    private LocalDate startDate; // 시작일
    private LocalDate endDate;   // 종료일
    private String description; // 한줄 소개
    private String officialUrl; // 공식 링크

    //진행 상태 -> db에 저장 안하고 날짜 보고 그때그때 계산
    //getter라서 json 응답에는 "status"로 같이 나감
    public String getStatus() {
        if (startDate == null || endDate == null) {
            return null;
        }
        LocalDate today = LocalDate.now();
        if (today.isBefore(startDate)) {
            return "오픈예정";
        }
        if (today.isAfter(endDate)) {
            return "종료";
        }
        return "진행중";
    }

    //getter, setter -> 값 꺼내고 넣는
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getBrand() { return brand; }
    public void setBrand(String brand) { this.brand = brand; }

    public Category getCategory() { return category; }
    public void setCategory(Category category) { this.category = category; }

    public String getRegion() { return region; }
    public void setRegion(String region) { this.region = region; }

    public LocalDate getStartDate() { return startDate; }
    public void setStartDate(LocalDate startDate) { this.startDate = startDate; }

    public LocalDate getEndDate() { return endDate; }
    public void setEndDate(LocalDate endDate) { this.endDate = endDate; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getOfficialUrl() { return officialUrl; }
    public void setOfficialUrl(String officialUrl) { this.officialUrl = officialUrl; }
}
