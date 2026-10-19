package com.example.case_study.service.category;

import com.example.case_study.enity.Category;
import com.example.case_study.repository.category.CategoryRepository;
import com.example.case_study.repository.category.ICategoryRepository;

import java.util.List;

public class CategoryService implements ICategoryService {
    private final ICategoryRepository categoryRepository = new CategoryRepository();


    @Override
    public boolean addCategory(Category category) {
        return categoryRepository.addCategory(category);
    }

    @Override
    public boolean deleteCategory(int id) {
        return categoryRepository.deleteCategory(id);
    }

    @Override
    public List<Category> findAll() {
        return categoryRepository.findAll();
    }
}
