package com.shop.aqua.dto;

import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProductDto {
	
	private Long id;
	
	private String productName; 
	
	private Integer productPrice;
	
	private String productInfo;
	
	private String sellStatCd;
	
	private LocalDateTime createAt; // 등록시간
	private LocalDateTime modifiendAt; // 수정시간
}
