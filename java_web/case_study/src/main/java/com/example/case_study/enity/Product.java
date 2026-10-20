package com.example.case_study.enity;

import java.util.Date;

public class Product {
    private int id;
    private int categoryId;
    private int statusId;
    private String name;
    private double price;
    private double discountPrice;
    private int quantity;
    private String description;
    private String imageUrl;
    private Date createTime;
    private Date updateTime;

    public Product() {
    }

    public Product(int categoryId, int statusId, String name, double price, double discountPrice, int quantity, String description, String imageUrl) {
        this.categoryId = categoryId;
        this.statusId = statusId;
        this.name = name;
        this.price = price;
        this.discountPrice = discountPrice;
        this.quantity = quantity;
        this.description = description;
        this.imageUrl = imageUrl;
    }

    public Product(int id, int categoryId, int statusId, String name, double price, double discountPrice, int quantity, String description, String imageUrl, Date createTime, Date updateTime) {
        this.id = id;
        this.categoryId = categoryId;
        this.statusId = statusId;
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

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
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
