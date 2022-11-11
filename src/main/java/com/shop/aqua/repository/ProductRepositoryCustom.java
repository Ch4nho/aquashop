package com.shop.aqua.repository;



import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.shop.aqua.dto.MainProductDto;
import com.shop.aqua.dto.ProductSearchDto;
import com.shop.aqua.entity.Product;

public interface ProductRepositoryCustom {
	
	Page<Product> getAdminProductPage(ProductSearchDto productSearchDto, Pageable pageable);

	Page<MainProductDto> getMainProductPage(ProductSearchDto productSearchDto, Pageable pageable);
	
}
