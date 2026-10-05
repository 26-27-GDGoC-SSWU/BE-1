package hello.restaurant.repository;

import hello.restaurant.domain.Restaurant;

import java.util.List;
import java.util.Optional;

public interface RestaurantRepository {
    Restaurant save(Restaurant restaurant);
    Optional<Restaurant> findById(Long id);
    List<Restaurant> findAll();
    List<Restaurant> findDeletedAll();
    void hardDeleteById(Long id);
    void clearTrash();
}
