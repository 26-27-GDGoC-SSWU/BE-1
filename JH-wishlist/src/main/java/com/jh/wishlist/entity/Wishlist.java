package com.jh.wishlist.entity;

import jakarta.persistence.*;

@Entity
public class Wishlist {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private String category;
    private Integer price;
    private String priority;
    private boolean purchased;

    public Wishlist() {}

    public Long getId() { return id; }
    public String getName() { return name; }
    public String getCategory() { return category; }
    public Integer getPrice() { return price; }
    public String getPriority() { return priority; }
    public boolean isPurchased() { return purchased; }

    public void setName(String name) { this.name = name; }
    public void setCategory(String category) { this.category = category; }
    public void setPrice(Integer price) { this.price = price; }
    public void setPriority(String priority) { this.priority = priority; }
    public void setPurchased(boolean purchased) {
        this.purchased = purchased;
    }
}