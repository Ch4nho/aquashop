package com.shop.aqua.repository;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityNotFoundException;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.test.context.TestPropertySource;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.security.test.context.support.WithMockUser;

import com.shop.aqua.constrant.ProductSellStatus;
import com.shop.aqua.dto.ProductFormDto;
import com.shop.aqua.entity.Product;
import com.shop.aqua.entity.ProductImg;
import com.shop.aqua.repository.ProductImgRepository;
import com.shop.aqua.repository.ProductRepository;
import com.shop.aqua.service.ProductService;

@SpringBootTest
@Transactional
@TestPropertySource(locations="classpath:application-test.properties")
class ProductServiceTest {
	
	@Autowired
	ProductService productService;
	
	
	@Autowired
	ProductRepository productRepository;
	
	@Autowired
	ProductImgRepository productImgRepository;
	
	
	List<MultipartFile> createMultipartFiles() throws Exception{
	
		List<MultipartFile> multipartFilesList = new ArrayList<>();
		
		for(int i=0; i<5; i++) {
			String path ="C:/aquashop/product/";
			String imageName = "image" +i +".jpg";
			MockMultipartFile multipartFile =
					new MockMultipartFile(path, imageName, "image/jpg", new byte[]{1,2,3,4});
			multipartFilesList.add(multipartFile);
						
		}
		return multipartFilesList;
		
		
		
	}
	
	@Test
    @DisplayName("상품 등록 테스트")
    @WithMockUser(username = "admin", roles = "ADMIN")
	void saveProduct() throws Exception{
		ProductFormDto productFormDto = new ProductFormDto();
		productFormDto.setProductName("테스트 상품");
		productFormDto.setProductSellStatus(ProductSellStatus.SELL);
		productFormDto.setProductInfo("테스트 상품 설명");
		productFormDto.setProductPrice(100);
		productFormDto.setProductStock(100);
		
		List<MultipartFile> multipartFilesList = createMultipartFiles();
		Long productId = productService.saveProduct(productFormDto, multipartFilesList);
		List<ProductImg> productImgList = productImgRepository.findByProductIdOrderByIdAsc(productId);
		
		Product product = productRepository.findById(productId)
		.orElseThrow(EntityNotFoundException::new);
		
		assertEquals(productFormDto.getProductName(), product.getProductName());
		assertEquals(productFormDto.getProductSellStatus(), product.getProductSellStatus());
		assertEquals(productFormDto.getProductInfo(), product.getProductInfo());
		assertEquals(productFormDto.getProductPrice(), product.getProductPrice());
		assertEquals(productFormDto.getProductStock(), product.getProductStock());
		assertEquals(multipartFilesList.get(0).getOriginalFilename(), productImgList.get(0).getOriImgName());
	}
	
	

}
