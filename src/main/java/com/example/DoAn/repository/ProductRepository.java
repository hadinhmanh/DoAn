package com.example.DoAn.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.DoAn.domain.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {

    Page<Product> findAll(Pageable page);

    Product save(Product product);

    Product findByName(String name);
}
