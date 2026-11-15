package com.geckolog.service;

import com.geckolog.dto.GeckoLogDto;
import com.geckolog.entity.GeckoLog;
import com.geckolog.repository.GeckoLogRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class GeckoLogService {

    private final GeckoLogRepository geckoLogRepository;

    @Transactional
    public Long createLog(GeckoLogDto dto) {
        // [수정 포인트] 해칭일(birthDate)을 제외하고 6개 값만 전달합니다.
        GeckoLog log = new GeckoLog(
                dto.getGeckoName(),
                dto.getDate(),
                dto.getWeight(),
                dto.getFoodType(),
                dto.getFoodAmount(),
                dto.getMemo()
        );
        return geckoLogRepository.save(log).getId();
    }

    public List<GeckoLog> getLogs(String geckoName) {
        if (geckoName == null || geckoName.isBlank() || geckoName.equals("ALL")) {
            return geckoLogRepository.findAllByOrderByDateDesc();
        }
        return geckoLogRepository.findByGeckoNameOrderByDateDesc(geckoName);
    }

    @Transactional
    public void updateLog(Long id, GeckoLogDto dto) {
        GeckoLog log = geckoLogRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("해당 기록이 없습니다. id=" + id));

        // [수정 포인트] 수정 시에도 6개 값만 전달합니다.
        log.updateLog(
                dto.getGeckoName(),
                dto.getDate(),
                dto.getWeight(),
                dto.getFoodType(),
                dto.getFoodAmount(),
                dto.getMemo()
        );
    }

    @Transactional
    public void deleteLog(Long id) {
        GeckoLog log = geckoLogRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("해당 기록이 없습니다. id=" + id));
        geckoLogRepository.delete(log);
    }
}