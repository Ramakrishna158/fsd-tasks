package com.example.validation.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.validation.entity.Product;

public interface ProductRepository extends JpaRepository<Product, Integer> {
}