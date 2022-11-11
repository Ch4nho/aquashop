//package com.shop.aqua.entity;
//
//import javax.persistence.Column;
//import javax.persistence.Entity;
//import javax.persistence.FetchType;
//import javax.persistence.GeneratedValue;
//import javax.persistence.Id;
//import javax.persistence.JoinColumn;
//import javax.persistence.ManyToOne;
//
//import lombok.Data;
//
//@Entity
//@Data
//public class categoryProduct extends BaseEntity {
//	
//	
//	@Id 
//	@GeneratedValue
//	@Column(name="category_product_id")
//	private Long id;
//	
//	@ManyToOne(fetch = FetchType.LAZY)
//    @JoinColumn(name = "product_id")
//	private Product product;
//	
//	
//	@ManyToOne(fetch = FetchType.LAZY)
//    @JoinColumn(name = "category_id")
//	private Category category;
//	
//	
//	private int count; // 상품 수
//	
//	public static CategoryProduct createCategoryProduct(Product product, int count) {
//		categoryProduct categoryProduct = new categoryProduct();
//		categoryProduct.setProduct(product);
//		categoryProduct.setCount(count);
//		product.
//	}
//	
//}
