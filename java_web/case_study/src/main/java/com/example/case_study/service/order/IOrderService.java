package com.example.case_study.service.order;

import com.example.case_study.dto.OrderDto;
import com.example.case_study.service.IService;

import java.util.List;

public interface IOrderService extends IService<OrderDto> {
    boolean updateOrder(int orderId, int orderStatusId);
    List<OrderDto> searchOrderByUserName(String userName);
    OrderDto getOrderByOrderId(int orderId);
}
