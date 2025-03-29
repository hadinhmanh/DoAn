package com.example.DoAn.service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

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

    public List<Categories> getAll() {
        return this.categoriesRepository.findAll();
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

    // Hàm lấy danh sách danh mục theo ID
    public List<Categories> getCategoriesByIds(List<Long> categoryIds) {
        return this.categoriesRepository.findAllById(categoryIds);
    }

}
