package com.geckolog.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import java.time.LocalDate;

@Entity
@Table(name = "gecko_log")
@Getter @Setter
@NoArgsConstructor
public class GeckoLog {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String geckoName;     // 도마뱀 이름

    @Column(nullable = false)
    private LocalDate date;       // 기록 날짜

    private Double weight;        // 체중 (g)

    private String foodType;      // 먹이 종류

    private String foodAmount;    // 먹은 양

    @Column(length = 500)
    private String memo;          // 특이사항

    public GeckoLog(String geckoName, LocalDate date, Double weight, String foodType, String foodAmount, String memo) {
        this.geckoName = geckoName;
        this.date = date;
        this.weight = weight;
        this.foodType = foodType;
        this.foodAmount = foodAmount;
        this.memo = memo;
    }

    public void updateLog(String geckoName, LocalDate date, Double weight, String foodType, String foodAmount, String memo) {
        this.geckoName = geckoName;
        this.date = date;
        this.weight = weight;
        this.foodType = foodType;
        this.foodAmount = foodAmount;
        this.memo = memo;
    }
}