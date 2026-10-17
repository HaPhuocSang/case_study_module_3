package com.example.case_study.enity;

public class Payment {
    private int id;
    private int orderId;
    private int paymentMethodId;
    private int paymentStatusId;
    private String transactionCode;
    private String paidAt;

    public Payment() {
    }

    public Payment(int orderId, int paymentMethodId, int paymentStatusId, String transactionCode, String paidAt) {
        this.orderId = orderId;
        this.paymentMethodId = paymentMethodId;
        this.paymentStatusId = paymentStatusId;
        this.transactionCode = transactionCode;
        this.paidAt = paidAt;
    }

    public Payment(int id, int orderId, int paymentMethodId, int paymentStatusId, String transactionCode, String paidAt) {
        this.id = id;
        this.orderId = orderId;
        this.paymentMethodId = paymentMethodId;
        this.paymentStatusId = paymentStatusId;
        this.transactionCode = transactionCode;
        this.paidAt = paidAt;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getPaymentMethodId() {
        return paymentMethodId;
    }

    public void setPaymentMethodId(int paymentMethodId) {
        this.paymentMethodId = paymentMethodId;
    }

    public int getPaymentStatusId() {
        return paymentStatusId;
    }

    public void setPaymentStatusId(int paymentStatusId) {
        this.paymentStatusId = paymentStatusId;
    }

    public String getTransactionCode() {
        return transactionCode;
    }

    public void setTransactionCode(String transactionCode) {
        this.transactionCode = transactionCode;
    }

    public String getPaidAt() {
        return paidAt;
    }

    public void setPaidAt(String paidAt) {
        this.paidAt = paidAt;
    }
}
