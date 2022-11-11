package com.shop.aqua.dto;

import com.querydsl.core.annotations.QueryProjection;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MainProductDto {
	
	private Long id;
	
	private String productName; 
	
	private String productInfo;
	
	private String imgUrl;
	
	private Integer productPrice;
	
	@QueryProjection // QueryDsl로 결과 조회시 MainItemDto 객체로 바로 받도록 하기 위함
	public MainProductDto(Long id, String productName, String productInfo, String imgUrl, Integer productPrice ) {
	this.id = id;
	this.productName = productName;
	this.productInfo = productInfo;
	this.imgUrl = imgUrl;
	this.productPrice = productPrice;
}

}
