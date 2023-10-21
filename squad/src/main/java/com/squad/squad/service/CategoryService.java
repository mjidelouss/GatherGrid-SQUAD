package com.squad.squad.service;

import com.squad.squad.domain.Category;
import com.squad.squad.repository.CategoryRepository;
import com.squad.squad.repository.EventRepository;

import java.util.List;

public class CategoryService {
    private final CategoryRepository categoryRepository;

    public CategoryService(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    public List<Category> getAllCategories() {
        return categoryRepository.getAllCategories();
    }

    public Category getCategoryById(Long id) {
        return categoryRepository.getCategoryById(id);
    }
}
