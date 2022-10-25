package com.shop.aqua.entity;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.shop.aqua.constrant.ProductSellStatus;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name="product")
@Getter
@Setter
@ToString
public class Product {
	
	@Id
	@Column(name="product_id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long product_id; // 상품 코드
	
	@ManyToOne
	@JoinColumn(name="category_id")
	private Member category_id; //카테고리 id
	
	
	@Column(nullable = false, length = 50)
	private String product_name; // 상품명
	
	@Column(name="product_price", nullable = false)
	private int product_price; // 가격
	
	  @Column(nullable = false)
	  private int product_stock; // 재고수량
	  
	  @Lob
	  @Column
	  private String product_info; // 상품 설명
	  
	  @Enumerated(EnumType.STRING)
	  private ProductSellStatus product_SellStatus; //상품 판매 상태
	  
	  private LocalDateTime createAt; // 등록시간
	  private LocalDateTime modifiendAt; // 수정시간
	

}
