package hello.restaurant.controller;

public class RestaurantForm {
    private String name;
    private String address;
    private String category;
    private String foodName;
    private Integer foodPrice;
    private Double rating;
    private String memo;

    // Getter & Setter
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }

    public String getFoodName() { return foodName; }
    public void setFoodName(String foodName) { this.foodName = foodName; }

    public Integer getFoodPrice() { return foodPrice; }
    public void setFoodPrice(Integer foodPrice) { this.foodPrice = foodPrice; }

    public Double getRating() { return rating; }
    public void setRating(Double rating) { this.rating = rating; }

    public String getMemo() { return memo; }
    public void setMemo(String memo) { this.memo = memo; }
}