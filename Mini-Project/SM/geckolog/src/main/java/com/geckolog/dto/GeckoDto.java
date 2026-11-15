package com.geckolog.dto;

import lombok.Getter;
import lombok.Setter;
import java.time.LocalDate;

@Getter @Setter
public class GeckoDto {
    private String name;
    private String gender;
    private String morph;
    private LocalDate birthDate;
}