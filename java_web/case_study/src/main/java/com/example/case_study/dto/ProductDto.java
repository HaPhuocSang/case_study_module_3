package com.example.case_study.dto;

import java.util.Date;

public class ProductDto {
    private int id;
    private String category;
    private String status;
    private String name;
    private double price;
    private double discountPrice;
    private int quantity;
    private String description;
    private String imageUrl;
    private Date createTime;
    private Date updateTime;

    public ProductDto() {
    }

    public ProductDto(int id, String category, String status, String name, double price, double discountPrice, int quantity, String description, String imageUrl, Date createTime, Date updateTime) {
        this.id = id;
        this.category = category;
        this.status = status;
        this.name = name;
        this.price = price;
        this.discountPrice = discountPrice;
        this.quantity = quantity;
        this.description = description;
        this.imageUrl = imageUrl;
        this.createTime = createTime;
        this.updateTime = updateTime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getDiscountPrice() {
        return discountPrice;
    }

    public void setDiscountPrice(double discountPrice) {
        this.discountPrice = discountPrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}
