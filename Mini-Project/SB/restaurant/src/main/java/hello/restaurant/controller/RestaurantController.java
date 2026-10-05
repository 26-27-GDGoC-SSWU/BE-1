package hello.restaurant.controller;

import hello.restaurant.domain.Restaurant;
import hello.restaurant.service.RestaurantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
public class RestaurantController {

    private final RestaurantService restaurantService;

    @Autowired
    public RestaurantController(RestaurantService restaurantService) {
        this.restaurantService = restaurantService;
    }

    // 홈 화면: 전체 목록 보기 + 등록 버튼
    @GetMapping("/")
    public String list(Model model) {
        List<Restaurant> restaurants = restaurantService.findRestaurants();
        model.addAttribute("restaurants", restaurants);
        return "restaurants/restaurantList";
    }

    // 등록 화면 띄우기
    @GetMapping("/restaurants/new")
    public String createForm() {
        return "restaurants/createRestaurantForm";
    }

    // 등록 처리
    @PostMapping("/restaurants/new")
    public String create(RestaurantForm form) {
        Restaurant restaurant = new Restaurant();
        restaurant.setName(form.getName());
        restaurant.setAddress(form.getAddress());
        restaurant.setCategory(form.getCategory());
        restaurant.setFoodName(form.getFoodName());
        restaurant.setFoodPrice(form.getFoodPrice());
        restaurant.setRating(form.getRating());
        restaurant.setMemo(form.getMemo());

        restaurantService.register(restaurant);

        return "redirect:/";
    }

    @PostMapping("/restaurants/{id}/delete")
    public String delete(@PathVariable("id") Long id) {
        restaurantService.delete(id);
        return "redirect:/";
    }

    // 세부정보 보기 화면
    @GetMapping("/restaurants/{id}")
    public String detail(@PathVariable("id") Long id, Model model) {
        Restaurant restaurant = restaurantService.findOne(id).orElse(null);
        model.addAttribute("restaurant", restaurant);
        return "restaurants/restaurantDetail";
    }

    // 휴지통 화면 보기
    @GetMapping("/restaurants/trash")
    public String trashList(Model model) {
        List<Restaurant> trashList = restaurantService.findTrashRestaurants();
        model.addAttribute("trashList", trashList);
        return "restaurants/restaurantTrash";
    }

    // 맛집 복구 처리
    @PostMapping("/restaurants/{id}/restore")
    public String restore(@PathVariable("id") Long id) {
        restaurantService.restore(id);
        return "redirect:/restaurants/trash";
    }

    // 휴지통 완전 비우기 처리
    @PostMapping("/restaurants/trash/clear")
    public String clearTrash() {
        restaurantService.emptyTrash();
        return "redirect:/restaurants/trash";
    }

    // 수정 화면 띄우기
    @GetMapping("/restaurants/{id}/edit")
    public String editForm(@PathVariable("id") Long id, Model model) {
        Restaurant restaurant = restaurantService.findOne(id).orElse(null);
        model.addAttribute("restaurant", restaurant);
        return "restaurants/editRestaurantForm";
    }

    // 수정 처리
    @PostMapping("/restaurants/{id}/edit")
    public String edit(@PathVariable("id") Long id, RestaurantForm form) {
        Restaurant updateParam = new Restaurant();
        updateParam.setName(form.getName());
        updateParam.setAddress(form.getAddress());
        updateParam.setCategory(form.getCategory());
        updateParam.setFoodName(form.getFoodName());
        updateParam.setFoodPrice(form.getFoodPrice());
        updateParam.setRating(form.getRating());
        updateParam.setMemo(form.getMemo());

        restaurantService.update(id, updateParam);

        return "redirect:/restaurants/" + id;
    }
}