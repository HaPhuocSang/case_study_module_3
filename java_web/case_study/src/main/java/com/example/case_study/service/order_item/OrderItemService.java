package com.example.case_study.service.order_item;

import com.example.case_study.dto.OrderItemDto;
import com.example.case_study.enity.OrderItem;
import com.example.case_study.repository.order_item.IOrderItemRepository;
import com.example.case_study.repository.order_item.OrderItemRepository;

import java.util.List;

public class OrderItemService implements IOrderItemService{
    private IOrderItemRepository orderItemRepository = new OrderItemRepository();

    @Override
    public List<OrderItemDto> findOrderItemByOrderId(int orderId) {
        return orderItemRepository.findOrderItemByOrderId(orderId);
    }

    @Override
    public boolean deleteOrderItem(int orderItemId) {
        return orderItemRepository.deleteOrderItem(orderItemId);
    }
}
