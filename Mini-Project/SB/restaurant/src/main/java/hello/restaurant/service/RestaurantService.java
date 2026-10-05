package hello.restaurant.service;

import hello.restaurant.domain.Restaurant;
import hello.restaurant.repository.RestaurantRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class RestaurantService {
    private final RestaurantRepository restaurantRepository;

    public RestaurantService(RestaurantRepository restaurantRepository) {
        this.restaurantRepository = restaurantRepository;
    }

    // 맛집 등록
    public Long register(Restaurant restaurant) {
        restaurantRepository.save(restaurant);
        return restaurant.getId();
    }

    // 맛집 목록 전체 보기
    public List<Restaurant> findRestaurants() {
        return restaurantRepository.findAll();
    }

    // 맛집 세부정보 보기
    public Optional<Restaurant> findOne(Long restaurantId) {
        return restaurantRepository.findById(restaurantId);
    }

    // 맛집 삭제
    public void delete(Long restaurantId) {
        restaurantRepository.findById(restaurantId).ifPresent(restaurant -> {
            restaurant.setDeleted(true);
        });
    }

    // 휴지통에서 복구하기
    public void restore(Long restaurantId) {
        restaurantRepository.findById(restaurantId).ifPresent(restaurant -> {
            restaurant.setDeleted(false);
        });
    }

    // 휴지통 목록 조회
    public List<Restaurant> findTrashRestaurants() {
        return restaurantRepository.findDeletedAll();
    }

    // 휴지통 완전 비우기
    public void emptyTrash() {
        restaurantRepository.clearTrash();
    }

    // 맛집 정보 수정
    public void update(Long id, Restaurant updateParam) {
        restaurantRepository.findById(id).ifPresent(restaurant -> {
            restaurant.setName(updateParam.getName());
            restaurant.setAddress(updateParam.getAddress());
            restaurant.setCategory(updateParam.getCategory());
            restaurant.setFoodName(updateParam.getFoodName());
            restaurant.setFoodPrice(updateParam.getFoodPrice());
            restaurant.setRating(updateParam.getRating());
            restaurant.setMemo(updateParam.getMemo());
        });
    }
}
