package com.example.case_study.repository.order_item;

import com.example.case_study.dto.OrderItemDto;

import java.util.List;

public interface IOrderItemRepository {
    List<OrderItemDto> findOrderItemByOrderId(int orderId);
    boolean deleteOrderItem(int orderItemId);
}
