package com.shop.aqua.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import org.springframework.data.repository.query.Param;

import com.shop.aqua.entity.Item;


public interface ItemRepository extends JpaRepository<Item, Long> 
	, QuerydslPredicateExecutor<Item>, ItemRepositoryCustom{

	// 상품명으로 데이터 조회
		List<Item> findByItemNm(String itemNm);

		// 상품명 또는 상품 상세 설명으로 데이터 조회	
	    List<Item> findByItemNmOrItemDetail(String itemNm, String itemDetail);

	    // 상품 가격이 주어진 가격보다 작은 상품 데이터 조회
	    List<Item> findByPriceLessThan(Integer price);

	 // 상품 가격 기준 내림차순 조건 추가
	    List<Item> findByPriceLessThanOrderByPriceDesc(Integer price);
	    @Query("select i from Item i where i.itemDetail like " +
	            "%:itemDetail% order by i.price desc")
	    List<Item> findByItemDetail(@Param("itemDetail") String itemDetail);

	    @Query(value="select * from item i where i.item_detail like " +
	            "%:itemDetail% order by i.price desc", nativeQuery = true)
	    List<Item> findByItemDetailByNative(@Param("itemDetail") String itemDetail);




}
