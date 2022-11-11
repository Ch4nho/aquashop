package com.shop.aqua.repository;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.data.repository.query.Param;

import com.shop.aqua.entity.Product;



public interface ProductRepository extends JpaRepository<Product, Long>,
//QuerydslPredicateExecutor<Product>{

QuerydslPredicateExecutor<Product>, ProductRepositoryCustom{

	// 상품명으로 데이터 조회
	List<Product> findByProductName(String productName);

	// 상품명 또는 상품 상세 설명으로 데이터 조회
	List<Product> findByProductNameOrProductInfo(String productName, String productInfo);
	
	// 상품 가격이 주어진 가격보다 작은 상품 데이터 조회
	List<Product> findByProductPriceLessThan(Integer productPrice);
	
	// 상품 가격 기준 내림차순 조건 추가
	List<Product> findByProductPriceLessThanOrderByProductPriceDesc(Integer productPrice);


	@Query(value="select p from Product p where p.productInfo like"+
	"%:productInfo% order by p.productPrice desc",nativeQuery = true)
	List<Product> findByProductInfo(@Param("productInfo") String productInfo);

	
	@Query(value="select * from Product p where p.product_info like"+
	"%:productInfo% order by p.product_price desc",nativeQuery = true)
	List<Product> findByProductInfoByNative(@Param("productInfo") String productInfo);
	
	
}




