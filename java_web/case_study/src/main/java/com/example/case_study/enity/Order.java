package com.example.case_study.enity;

import java.util.Date;

public class Order {
    private int id;
    private int userId;
    private int statusId;
    private String receiverName;
    private String receiverPhone;
    private String receiverEmail;
    private String receiverAddress;
    private Double totalAmount;
    private String description;
    private Date createTime;
    private Date updateTime;

    public Order() {
    }

    public Order(int userId, int statusId, String receiverName, String receiverPhone, String receiverEmail, String receiverAddress, Double totalAmount, String description, Date createTime, Date updateTime) {
        this.userId = userId;
        this.statusId = statusId;
        this.receiverName = receiverName;
        this.receiverPhone = receiverPhone;
        this.receiverEmail = receiverEmail;
        this.receiverAddress = receiverAddress;
        this.totalAmount = totalAmount;
        this.description = description;
        this.createTime = createTime;
        this.updateTime = updateTime;
    }

    public Order(int id, int userId, int statusId, String receiverName, String receiverPhone, String receiverEmail, String receiverAddress, Double totalAmount, String description, Date createTime, Date updateTime) {
        this.id = id;
        this.userId = userId;
        this.statusId = statusId;
        this.receiverName = receiverName;
        this.receiverPhone = receiverPhone;
        this.receiverEmail = receiverEmail;
        this.receiverAddress = receiverAddress;
        this.totalAmount = totalAmount;
        this.description = description;
        this.createTime = createTime;
        this.updateTime = updateTime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    public String getReceiverName() {
        return receiverName;
    }

    public void setReceiverName(String receiverName) {
        this.receiverName = receiverName;
    }

    public String getReceiverPhone() {
        return receiverPhone;
    }

    public void setReceiverPhone(String receiverPhone) {
        this.receiverPhone = receiverPhone;
    }

    public String getReceiverEmail() {
        return receiverEmail;
    }

    public void setReceiverEmail(String receiverEmail) {
        this.receiverEmail = receiverEmail;
    }

    public String getReceiverAddress() {
        return receiverAddress;
    }

    public void setReceiverAddress(String receiverAddress) {
        this.receiverAddress = receiverAddress;
    }

    public Double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(Double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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
