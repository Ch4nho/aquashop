package com.shop.aqua.repository;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.TestPropertySource;

import com.shop.aqua.constrant.ProductSellStatus;
import com.shop.aqua.entity.Product;
import com.shop.aqua.repository.ProductRepository;

@SpringBootTest
@TestPropertySource(locations="classpath:application-test.properties")
public class ProductRepositoryTest {
	
	@PersistenceContext
	EntityManager em;
	
	@Autowired
	ProductRepository productRepository;
	
	
	@Test
	@DisplayName("상품 저장 테스트")
	public void createProductTest() {
		Product product = new Product();

		product.setProductName("테스트 상품");
		product.setProductPrice(1000);
		product.setProductInfo("테스트 상품 상세 설명");
		product.setProductSellStatus(ProductSellStatus.SELL);
		product.setProductStock(100);
		product.setCreateAt(LocalDateTime.now());
		product.setModifiendAt(LocalDateTime.now());
		Product savedProduct = productRepository.save(product);
		System.out.println(savedProduct.toString());
	}
	
//	@Test
//	@DisplayName("상품 생성 테스트")
//	public void createProductList() {
//		for(int i=1; i<=10; i++) {
//			Product product = new Product();
//			product.setProductName("테스트 상품"+i);
//			product.setProductPrice(1000+i);
//			product.setProductInfo("테스트 상품 상세 설명" +i);
//			product.setProductSellStatus(ProductSellStatus.SELL);
//			product.setProductStock(100); 
//			product.setCreateAt(LocalDateTime.now());
//			product.setModifiendAt(LocalDateTime.now());
//			Product savedProduct1 = productRepository.save(product);
//		}
//	}
	
	
//	
//	@Test
//	@DisplayName("상품명 조회 테스트")
//	public void findByProductNameTest() {
//		this.createProductList();
//		List<Product> productList = productRepository.findByProductName("테스트 상품1");
//		for(Product product : productList) {
//			System.out.println(product.toString());
//		}
//		
//	}
//	
//	
	

}
