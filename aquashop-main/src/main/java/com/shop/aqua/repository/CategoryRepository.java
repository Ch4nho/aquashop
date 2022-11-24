package com.shop.aqua.repository;

import com.shop.aqua.entity.Category;


import org.springframework.data.jpa.repository.JpaRepository;



public interface CategoryRepository extends JpaRepository<Category, Long> {
	
	Category findByCategoryName(Long categoryName);

    
    
}
 