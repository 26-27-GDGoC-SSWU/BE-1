package com.geckolog.service;

import com.geckolog.dto.GeckoDto;
import com.geckolog.entity.Gecko;
import com.geckolog.repository.GeckoRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class GeckoService {

    private final GeckoRepository geckoRepository;

    @Transactional
    public Long registerGecko(GeckoDto dto) {
        if (geckoRepository.findByName(dto.getName()).isPresent()) {
            throw new IllegalArgumentException("이미 등록된 도마뱀 이름입니다.");
        }
        Gecko gecko = new Gecko(dto.getName(), dto.getGender(), dto.getMorph(), dto.getBirthDate());
        return geckoRepository.save(gecko).getId();
    }

    public List<Gecko> getAllGeckos() {
        return geckoRepository.findAll();
    }
}