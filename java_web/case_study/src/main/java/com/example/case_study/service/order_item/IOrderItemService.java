package com.example.case_study.service.order_item;

import com.example.case_study.dto.OrderItemDto;

import java.util.List;

public interface IOrderItemService {
    List<OrderItemDto> findOrderItemByOrderId(int orderId);
    boolean deleteOrderItem(int orderItemId);
}
