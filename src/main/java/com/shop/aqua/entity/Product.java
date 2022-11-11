package com.shop.aqua.entity;

import java.time.LocalDateTime;

import javax.persistence.*;

import com.shop.aqua.constrant.ProductSellStatus;
import com.shop.aqua.dto.ProductFormDto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name="product")
@Getter
@Setter
@ToString
public class Product extends BaseEntity{
	
	@Id
	@Column(name="product_id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id; // 상품 코드
	
//	@ManyToOne
//	@JoinColumn(name="category_id", nullable = false)
//	private Category category; 
	
	
	@Column(nullable = false, length = 50)
	private String productName; // 상품명
	
	@Column(name="product_price", nullable = false)
	private int productPrice; // 가격
	
	  @Column(nullable = false)
	  private int productStock; // 재고수량
	  
	  @Lob
	  @Column(nullable = false)
	  private String productInfo; // 상품 설명
	  
	  @Enumerated(EnumType.STRING)
	  private ProductSellStatus productSellStatus; //상품 판매 상태
	  
	  private LocalDateTime createAt; // 등록시간
	  private LocalDateTime modifiendAt; // 수정시간
	
	  
	  public void updateProduct(ProductFormDto productFormDto) {
		  this.productName = productFormDto.getProductName();
		  this.productPrice = productFormDto.getProductPrice();
		  this.productStock = productFormDto.getProductStock();
		  this.productInfo = productFormDto.getProductInfo();
		  this.productSellStatus = productFormDto.getProductSellStatus();
		  
	  }
	  
//	  public void removeStock(int stockNumber) {
//		  int restStock = this.stockNumber - stockNumber;
//		  
//	  }
	  

}
