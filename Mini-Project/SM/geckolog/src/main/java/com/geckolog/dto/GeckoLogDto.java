package com.geckolog.dto;

import lombok.Getter;
import lombok.Setter;
import java.time.LocalDate;

@Getter @Setter
public class GeckoLogDto {
    private String geckoName;
    private LocalDate birthDate;
    private LocalDate date;
    private Double weight;
    private String foodType;
    private String foodAmount;
    private String memo;
}