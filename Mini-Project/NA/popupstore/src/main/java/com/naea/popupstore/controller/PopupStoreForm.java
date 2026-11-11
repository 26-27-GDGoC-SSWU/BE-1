package com.naea.popupstore.controller;

import com.naea.popupstore.domain.Category;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;

//등록/수정 폼에서 넘어오는 값 담는 상자 (강의 MemberForm이랑 같은 역할)
//html input의 name이랑 필드 이름이 매칭이 되서 들어옴
public class PopupStoreForm {

    private String name;
    private String brand;
    private Category category; // "패션" 글자로 들어오면 알아서 enum으로 바꿔줌
    private String region;

    //<input type="date">는 2026-11-11 형식으로 넘어옴
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private LocalDate startDate;
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private LocalDate endDate;

    private String description;
    private String officialUrl;

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
