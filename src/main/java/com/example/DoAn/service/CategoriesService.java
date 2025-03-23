package com.example.DoAn.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.example.DoAn.domain.Categories;
import com.example.DoAn.repository.CategoriesRepository;

@Service
public class CategoriesService {
    private final CategoriesRepository categoriesRepository;

    public CategoriesService(CategoriesRepository categoriesRepository) {
        this.categoriesRepository = categoriesRepository;
    }

    public Page<Categories> getAllCate(Pageable page) {
        return this.categoriesRepository.findAll(page);
    }

    public Categories handleSaveCategories(Categories categories) {
        Categories categories2 = this.categoriesRepository.save(categories);
        return categories2;
    }

    public Categories getCategoriesByName(String name) {
        return this.categoriesRepository.findByName(name);
    }

    public Categories getCategoriesById(long id) {
        return this.categoriesRepository.findById(id);
    }

    public void deleteCategories(long id) {
        this.categoriesRepository.deleteById(id);
    }
}
