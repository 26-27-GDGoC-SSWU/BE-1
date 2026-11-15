package com.geckolog.repository;

import com.geckolog.entity.Gecko;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;

public interface GeckoRepository extends JpaRepository<Gecko, Long> {
    Optional<Gecko> findByName(String name);
}