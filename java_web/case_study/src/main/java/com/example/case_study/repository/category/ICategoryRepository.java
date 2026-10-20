package com.example.case_study.repository.category;

import com.example.case_study.enity.Category;
import com.example.case_study.repository.IRepository;

public interface ICategoryRepository extends IRepository<Category> {
    boolean addCategory(Category category);

    boolean deleteCategory(int id);
}
