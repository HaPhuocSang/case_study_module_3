package com.example.case_study.repository.product;

import com.example.case_study.dto.ProductDto;
import com.example.case_study.enity.Product;
import com.example.case_study.repository.IRepository;

import java.util.List;

public interface IProductRepository extends IRepository<ProductDto> {
    List<ProductDto> getProductList();

    List<ProductDto> findByCategoryId(int categoryId);

    List<ProductDto> searchByName(String name);

    ProductDto findById(int id);

    boolean addProduct(Product product);

    boolean updateProduct(Product product);

    boolean updateProductStatus(int productId, int statusId);

    boolean deleteProduct(int id);
}
