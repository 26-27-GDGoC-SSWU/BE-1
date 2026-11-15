package com.geckolog.repository;

import com.geckolog.entity.GeckoLog;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface GeckoLogRepository extends JpaRepository<GeckoLog, Long> {

    // 전체 최신순 조회
    List<GeckoLog> findAllByOrderByDateDesc();

    // 특정 개체 이름별 최신순 조회
    List<GeckoLog> findByGeckoNameOrderByDateDesc(String geckoName);
}