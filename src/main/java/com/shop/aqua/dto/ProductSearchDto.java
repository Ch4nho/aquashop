package com.shop.aqua.dto;

import com.shop.aqua.constrant.ProductSellStatus;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProductSearchDto {

	
	private String searchDateType;
	
	private ProductSellStatus seaProductSellStatus;
	
	private String searchBy;
	
	private String searchQuery="";
}
