package com.squad.squad.repository;

import com.squad.squad.domain.Category;
import jakarta.persistence.EntityManager;

import java.util.List;

public class CategoryRepository {
    private final EntityManager em;
    public CategoryRepository(EntityManager em){
        this.em = em;
    }

    public List<Category> getAllCategories() {
        return em.createQuery("SELECT c FROM Category c", Category.class).getResultList();
    }
}
