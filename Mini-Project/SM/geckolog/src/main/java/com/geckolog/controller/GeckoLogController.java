package com.geckolog.controller;

import com.geckolog.dto.GeckoLogDto;
import com.geckolog.entity.GeckoLog;
import com.geckolog.service.GeckoLogService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/logs")
@RequiredArgsConstructor
public class GeckoLogController {

    private final GeckoLogService geckoLogService;

    @PostMapping
    public ResponseEntity<Long> createLog(@RequestBody GeckoLogDto dto) {
        Long savedId = geckoLogService.createLog(dto);
        return ResponseEntity.ok(savedId);
    }

    // /api/logs 또는 /api/logs?geckoName=곤 형태의 요청 처리
    @GetMapping
    public ResponseEntity<List<GeckoLog>> getLogs(@RequestParam(required = false) String geckoName) {
        List<GeckoLog> logs = geckoLogService.getLogs(geckoName);
        return ResponseEntity.ok(logs);
    }

    @PutMapping("/{id}")
    public ResponseEntity<String> updateLog(@PathVariable Long id, @RequestBody GeckoLogDto dto) {
        geckoLogService.updateLog(id, dto);
        return ResponseEntity.ok("수정되었습니다.");
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<String> deleteLog(@PathVariable Long id) {
        geckoLogService.deleteLog(id);
        return ResponseEntity.ok("삭제되었습니다.");
    }
}