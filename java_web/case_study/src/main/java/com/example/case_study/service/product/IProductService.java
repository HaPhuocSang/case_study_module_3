package com.example.case_study.service.product;

import com.example.case_study.dto.ProductDto;
import com.example.case_study.enity.Product;
import com.example.case_study.service.IService;

import java.util.List;

public interface IProductService extends IService<ProductDto> {
    List<ProductDto> getProductList();

    List<ProductDto> findByCategoryId(int categoryId);

    List<ProductDto> searchByName(String name);

    boolean addProduct(Product product);

    boolean updateProduct(Product product);

    boolean updateProductStatus(int productId, int statusId);

    boolean deleteProduct(int id);
}
