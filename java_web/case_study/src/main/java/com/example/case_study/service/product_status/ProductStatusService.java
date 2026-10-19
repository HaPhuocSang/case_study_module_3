package com.example.case_study.service.product_status;

import com.example.case_study.enity.ProductStatus;
import com.example.case_study.repository.product_status.IProductStatusRepository;
import com.example.case_study.repository.product_status.ProductStatusRepository;

import java.util.List;

public class ProductStatusService implements IProductStatusService {
    private final IProductStatusRepository productStatusRepository = new ProductStatusRepository();
    @Override
    public List<ProductStatus> findAll() {
        return productStatusRepository.findAll();
    }
}
