package com.jh.wishlist.repository;

import com.jh.wishlist.entity.Wishlist;
import org.springframework.data.jpa.repository.JpaRepository;

public interface WishlistRepository
        extends JpaRepository<Wishlist, Long> {
}