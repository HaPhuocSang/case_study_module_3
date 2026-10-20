package com.example.case_study.service.order;

import com.example.case_study.dto.OrderDto;
import com.example.case_study.repository.order.IOrderRepository;
import com.example.case_study.repository.order.OrderRepository;

import java.util.List;

public class OrderService implements IOrderService {
    private final IOrderRepository orderRepository =  new OrderRepository();

    @Override
    public boolean updateOrder(int orderId, int orderStatusId) {
        return orderRepository.updateOrder(orderId, orderStatusId);
    }

    @Override
    public List<OrderDto> searchOrderByUserName(String userName) {
        return orderRepository.searchOrderByUserName(userName);
    }

    @Override
    public OrderDto getOrderByOrderId(int orderId) {
        return orderRepository.getOrderByOrderId(orderId);
    }

    @Override
    public List<OrderDto> findAll() {
        return orderRepository.findAll();
    }
}
