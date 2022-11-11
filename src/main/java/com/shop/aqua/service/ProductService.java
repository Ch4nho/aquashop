package com.shop.aqua.service;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityNotFoundException;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.shop.aqua.dto.MainProductDto;
import com.shop.aqua.dto.ProductFormDto;
import com.shop.aqua.dto.ProductImgDto;
import com.shop.aqua.dto.ProductSearchDto;
import com.shop.aqua.entity.Product;
import com.shop.aqua.entity.ProductImg;
import com.shop.aqua.repository.ProductImgRepository;
import com.shop.aqua.repository.ProductRepository;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class ProductService {
	
	private final ProductRepository productRepository;
	
	private final ProductImgService productImgService;
	
	private final ProductImgRepository productImgRepository;
	
	
	public Long saveProduct(ProductFormDto productFormDto, List<MultipartFile> productImgFileList) throws Exception{
		
		// 상품 등록
		Product product = productFormDto.createProduct();
		productRepository.save(product);
		
		
		// 이미지 등록
		for(int i=0; i<productImgFileList.size(); i++) {
			ProductImg productImg = new ProductImg();
			productImg.setProduct(product);
			
			if(i == 0)
				productImg.setRepimgYn("Y");
			else
				productImg.setRepimgYn("N");
			
			productImgService.saveProductImg(productImg, productImgFileList.get(i));
		}
	
	return product.getId();
	
	}
	
	@Transactional(readOnly = true)
	public ProductFormDto getProductDtl(Long productId) {
		List<ProductImg> productImgList = productImgRepository.findByProductIdOrderByIdAsc(productId);
		List<ProductImgDto> productImgDtoList = new ArrayList<>();
		for(ProductImg productImg : productImgList) {
			ProductImgDto productImgDto = ProductImgDto.of(productImg);
			productImgDtoList.add(productImgDto);
		}
		Product product = productRepository.findById(productId)
				.orElseThrow(EntityNotFoundException::new);
		ProductFormDto productFormDto = ProductFormDto.of(product);
		productFormDto.setProducImgDtoList(productImgDtoList);
		return productFormDto;
		
	}
	
	public Long updateProduct(ProductFormDto productFormDto, List<MultipartFile> productImgFileList) throws Exception{
		// 상품 수정
		Product product = productRepository.findById(productFormDto.getId())
				.orElseThrow(EntityNotFoundException::new);
		product.updateProduct(productFormDto);
		
		List<Long> productImgIds = productFormDto.getProductImgIds();
		
		// 이미지 등록
		for(int i = 0; i<productImgFileList.size(); i++) {
			productImgService.updateProductImg(productImgIds.get(i),
					productImgFileList.get(i));
		}
		
		return product.getId();
	}
	
	@Transactional(readOnly = true)
	public Page<Product> getAdminProductPage(ProductSearchDto productSearchDto, Pageable pageable){
		return productRepository.getAdminProductPage(productSearchDto, pageable);
	}

	@Transactional(readOnly = true)
	public Page<MainProductDto> getMainProductPage(ProductSearchDto productSearchDto, Pageable pageable){
		return productRepository.getMainProductPage(productSearchDto, pageable);
	}
	
}
