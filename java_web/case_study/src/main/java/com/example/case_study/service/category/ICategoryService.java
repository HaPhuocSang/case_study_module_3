package com.example.case_study.service.category;

import com.example.case_study.enity.Category;
import com.example.case_study.service.IService;

public interface ICategoryService extends IService<Category> {
    boolean addCategory(Category category);

    boolean deleteCategory(int id);
}
