package com.example.case_study.service.product;

import com.example.case_study.dto.ProductDto;
import com.example.case_study.enity.Product;
import com.example.case_study.repository.product.IProductRepository;
import com.example.case_study.repository.product.ProductRepository;

import java.util.List;

public class ProductService implements IProductService {
    private final IProductRepository productRepository =  new ProductRepository();

    @Override
    public List<ProductDto> getProductList() {
        return productRepository.getProductList();
    }

    @Override
    public List<ProductDto> findByCategoryId(int categoryId) {
        return productRepository.findByCategoryId(categoryId);
    }

    @Override
    public List<ProductDto> searchByName(String name) {
        return productRepository.searchByName(name);
    }

    @Override
    public ProductDto findById(int id) {
        return productRepository.findById(id);
    }

    @Override
    public boolean addProduct(Product product) {
        return productRepository.addProduct(product);
    }

    @Override
    public boolean updateProduct(Product product) {
        return productRepository.updateProduct(product);
    }

    @Override
    public boolean updateProductStatus(int productId, int statusId) {
        return productRepository.updateProductStatus(productId, statusId);
    }

    @Override
    public boolean deleteProduct(int id) {
        return productRepository.deleteProduct(id);
    }

    @Override
    public List<ProductDto> findAll() {
        return productRepository.findAll();
    }
}
