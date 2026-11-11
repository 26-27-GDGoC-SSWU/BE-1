package com.jh.wishlist.controller;

import com.jh.wishlist.entity.Wishlist;
import com.jh.wishlist.service.WishlistService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/wishlist")
public class WishlistController {

    private final WishlistService service;

    public WishlistController(WishlistService service) {
        this.service = service;
    }

    @GetMapping
    public List<Wishlist> getAll() {
        return service.findAll();
    }

    @GetMapping("/{id}")
    public Wishlist getOne(@PathVariable Long id) {
        return service.findById(id);
    }

    @PostMapping
    public Wishlist create(@RequestBody Wishlist wishlist) {
        return service.save(wishlist);
    }

    @PutMapping("/{id}")
    public Wishlist update(
            @PathVariable Long id,
            @RequestBody Wishlist wishlist) {
        return service.update(id, wishlist);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        service.delete(id);
        return ResponseEntity.noContent().build();
    }
}