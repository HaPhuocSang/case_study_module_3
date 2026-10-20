package com.example.case_study.repository.order;

import com.example.case_study.dto.OrderDto;
import com.example.case_study.repository.IRepository;

import java.util.List;

public interface IOrderRepository extends IRepository<OrderDto> {
    boolean updateOrder(int orderId, int orderStatusId);
    OrderDto getOrderByOrderId(int orderId);
    List<OrderDto> searchOrderByUserName(String userName);
}
