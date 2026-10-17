package com.example.case_study.repository.order_item;

import com.example.case_study.enity.OrderItem;

import java.util.List;

public interface IOrderItemRepository {
    List<OrderItem> findOrderItemByOrderId(int orderId);
    boolean deleteOrderItem(int orderItemId);
}
