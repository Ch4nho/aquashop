package com.shop.aqua.dto;


import org.modelmapper.ModelMapper;

import com.shop.aqua.entity.ProductImg;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class ProductImgDto {
	
	
	private Long id;
	
	private String imgName;
	
	private String oriImgName;
	
	private String imgUrl;
	
	private String createAt;
	
	   private  static ModelMapper modelMapper = new ModelMapper();	

	   public static ProductImgDto of(ProductImg productImg) {
		   return modelMapper.map(productImg, ProductImgDto.class);
	        // ItemImg 엔티티 객체를 파라미터로 받아서 Productimg 객체의 자료형과 메버변수의 이름이 같을때 ItemImgDto로 값을 복사해서
	        // 반환한다. static 메소드로 선언해서 ProductImgDto 객체를 생성하지 않아도 호출이 가능하다.
	   
	   }
	   
	   
}
