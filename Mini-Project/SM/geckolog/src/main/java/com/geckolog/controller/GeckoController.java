package com.geckolog.controller;

import com.geckolog.dto.GeckoDto;
import com.geckolog.entity.Gecko;
import com.geckolog.service.GeckoService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/geckos")
@RequiredArgsConstructor
public class GeckoController {

    private final GeckoService geckoService;

    @PostMapping
    public ResponseEntity<Long> registerGecko(@RequestBody GeckoDto dto) {
        Long id = geckoService.registerGecko(dto);
        return ResponseEntity.ok(id);
    }

    @GetMapping
    public ResponseEntity<List<Gecko>> getAllGeckos() {
        return ResponseEntity.ok(geckoService.getAllGeckos());
    }
}