package hello.restaurant.repository;

import hello.restaurant.domain.Restaurant;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SpringDataJpaRestaurantRepository extends JpaRepository<Restaurant, Long>, RestaurantRepository {
}