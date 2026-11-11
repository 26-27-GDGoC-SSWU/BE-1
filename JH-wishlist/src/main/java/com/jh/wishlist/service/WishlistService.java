package com.jh.wishlist.service;

import com.jh.wishlist.entity.Wishlist;
import com.jh.wishlist.repository.WishlistRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WishlistService {

    private final WishlistRepository repository;

    public WishlistService(WishlistRepository repository) {
        this.repository = repository;
    }

    public List<Wishlist> findAll() {
        return repository.findAll();
    }

    public Wishlist findById(Long id) {
        return repository.findById(id)
                .orElseThrow(() ->
                        new IllegalArgumentException("상품 없음"));
    }

    public Wishlist save(Wishlist wishlist) {
        return repository.save(wishlist);
    }

    public Wishlist update(Long id, Wishlist input) {
        Wishlist wishlist = findById(id);

        wishlist.setName(input.getName());
        wishlist.setCategory(input.getCategory());
        wishlist.setPrice(input.getPrice());
        wishlist.setPriority(input.getPriority());
        wishlist.setPurchased(input.isPurchased());

        return repository.save(wishlist);
    }

    public void delete(Long id) {
        repository.delete(findById(id));
    }
}