package com.example.DoAn.service;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.example.DoAn.domain.Product;
import com.example.DoAn.repository.ProductRepository;

@Service
public class ProductService {
    private final ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public Page<Product> getAllProducts(Pageable page) {
        return this.productRepository.findAll(page);
    }

    public Product handleSaveProduct(Product product) {
        Product manh = this.productRepository.save(product);
        return manh;
    }

    public Product getProductByName(String name) {
        return this.productRepository.findByName(name);
    }

    public Optional<Product> fetchProductById(long id) {
        return this.productRepository.findById(id);
    }

    public void deleteProduct(long id) {
        this.productRepository.deleteById(id);
    }
}
