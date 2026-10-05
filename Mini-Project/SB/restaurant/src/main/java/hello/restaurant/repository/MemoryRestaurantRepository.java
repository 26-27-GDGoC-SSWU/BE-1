package hello.restaurant.repository;

import hello.restaurant.domain.Restaurant;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Repository;

import java.util.*;
import java.util.stream.Collectors;

@Repository
public class MemoryRestaurantRepository implements RestaurantRepository{

    private static Map<Long, Restaurant> store = new HashMap<>();
    private static long sequence = 0L;

    @Override
    public Restaurant save(Restaurant restaurant) {
        if (restaurant.getId() == null) {
            restaurant.setId(++sequence);
        }
        store.put(restaurant.getId(), restaurant);
        return restaurant;
    }

    @Override
    public Optional<Restaurant> findById(Long id) {
        return Optional.ofNullable(store.get(id));
    }

    @Override
    public List<Restaurant> findAll() {
        return store.values().stream()
                .filter(r -> !Boolean.TRUE.equals(r.getDeleted()))
                .collect(Collectors.toList());
    }

    @Override
    public List<Restaurant> findDeletedAll() {
        return store.values().stream()
                .filter(r -> Boolean.TRUE.equals(r.getDeleted()))
                .collect(Collectors.toList());
    }

    @Override
    public void hardDeleteById(Long id) {
        store.remove(id);
    }

    public void clearTrash() {
        List<Long> trashIds = store.values().stream()
                .filter(r -> Boolean.TRUE.equals(r.getDeleted()))
                .map(Restaurant::getId)
                .collect(Collectors.toList());
        trashIds.forEach(store::remove);
    }

    public void clearStore() {
        store.clear();
    }
}
