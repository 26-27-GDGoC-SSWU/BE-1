
package hello.restaurant.repository;

import hello.restaurant.domain.Restaurant;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface SpringDataJpaRestaurantRepository
        extends JpaRepository<Restaurant, Long> {

    // 삭제되지 않은 맛집 조회
    List<Restaurant> findByDeletedFalse();

    // 휴지통에 있는 맛집 조회
    List<Restaurant> findByDeletedTrue();
}
