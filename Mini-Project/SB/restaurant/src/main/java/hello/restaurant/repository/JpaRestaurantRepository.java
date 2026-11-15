
package hello.restaurant.repository;

import hello.restaurant.domain.Restaurant;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public class JpaRestaurantRepository implements RestaurantRepository {

    private final SpringDataJpaRestaurantRepository jpaRepository;

    public JpaRestaurantRepository(
            SpringDataJpaRestaurantRepository jpaRepository) {
        this.jpaRepository = jpaRepository;
    }

    @Override
    public Restaurant save(Restaurant restaurant) {
        return jpaRepository.save(restaurant);
    }

    @Override
    public Optional<Restaurant> findById(Long id) {
        return jpaRepository.findById(id);
    }

    @Override
    public List<Restaurant> findAll() {
        return jpaRepository.findByDeletedFalse();
    }

    @Override
    public List<Restaurant> findDeletedAll() {
        return jpaRepository.findByDeletedTrue();
    }

    @Override
    public void hardDeleteById(Long id) {
        jpaRepository.deleteById(id);
    }

    @Override
    public void clearTrash() {
        List<Restaurant> trash = jpaRepository.findByDeletedTrue();
        jpaRepository.deleteAll(trash);
    }
}
