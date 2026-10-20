package com.example.case_study.service.order_status;

import com.example.case_study.enity.OrderStatus;
import com.example.case_study.repository.order_status.IOrderIStatusRepository;
import com.example.case_study.repository.order_status.OrderIStatusRepository;

import java.util.List;

public class OrderStatusService implements IOrderStatusService {
    private final IOrderIStatusRepository  orderIStatusRepository =  new OrderIStatusRepository();
    @Override
    public List<OrderStatus> findAll() {
        return orderIStatusRepository.findAll();
    }
}
