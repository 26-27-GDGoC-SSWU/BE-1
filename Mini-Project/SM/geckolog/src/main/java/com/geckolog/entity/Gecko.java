package com.geckolog.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import java.time.LocalDate;

@Entity
@Table(name = "gecko")
@Getter @Setter
@NoArgsConstructor
public class Gecko {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(unique = true, nullable = false)
    private String name;        // 도마뱀 이름 (예: 릴리)

    private String gender;      // 성별 (수컷, 암컷, 미구분)

    private String morph;       // 모프 (릴리화이트, 아잔틱 등)

    private LocalDate birthDate; // 해칭일 (생년월일)

    public Gecko(String name, String gender, String morph, LocalDate birthDate) {
        this.name = name;
        this.gender = gender;
        this.morph = morph;
        this.birthDate = birthDate;
    }
}