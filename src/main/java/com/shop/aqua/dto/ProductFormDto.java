package com.shop.aqua.dto;

import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.modelmapper.ModelMapper;

import com.shop.aqua.constrant.ProductSellStatus;
//import com.shop.aqua.entity.Category;
import com.shop.aqua.entity.Product;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProductFormDto {
	
	private Long id;
	
//	@NotBlank(message = "카테고리를 선택해주세요")
//	private String CategoryName;
	
	@NotBlank(message ="상품명은 필수값입니다.")
	private String productName;

	@NotNull(message ="가격은 필수 입력 값입니다.")
	private Integer productPrice;
	
	@NotBlank(message = "상품 상세는 필수 입력값입니다.")
	private String productInfo;
	
	@NotNull(message ="재고는 필수 입력 값입니다..")
	private Integer productStock;
	
	private ProductSellStatus productSellStatus;
	
	private List<ProductImgDto> producImgDtoList = new ArrayList(); //상품 저장 후 수정할 때 상품 이미지 정보 저장 리스트 
	
	private List<Long> productImgIds = new ArrayList(); // 상품의 이미지, 아이디를 저장하는 리스트
	
    private  static ModelMapper modelMapper = new ModelMapper();
	
    public Product createProduct() {
    	return modelMapper.map(this, Product.class);
    }
    public static ProductFormDto of(Product product) {
    	return modelMapper.map(product, ProductFormDto.class);
    }
    
}
