package com.shop.aqua.service;

import javax.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import org.springframework.web.multipart.MultipartFile;
import org.apache.commons.lang3.StringUtils;
import com.shop.aqua.entity.ProductImg;
import com.shop.aqua.repository.ProductImgRepository;

import lombok.RequiredArgsConstructor;


@Service
@RequiredArgsConstructor
@Transactional
public class ProductImgService {// 상품 이미지 업로드하고 상품 이미지 정보 저장
	
	@Value("${productImgLocation}")
	private String productImgLocation;
	
	private final ProductImgRepository productImgRepository;
	
	private final FileService fileService;
	
	public void saveProductImg(ProductImg productImg, MultipartFile productImgFile) throws Exception{
		String oriImgName = productImgFile.getOriginalFilename();
		String imgName = "";
		String imgUrl = "";
		
		
		// 파일 업로드
		if(!StringUtils.isEmpty(oriImgName)) {
			imgName = fileService.uploadFile(productImgLocation, oriImgName,
					productImgFile.getBytes());
			imgUrl="/images/product/" + imgName;// urlPatterns로 WebMvcConfig클래스에서 */images/**를 설정했다. application.properties에서
		}										// 설정한 uploadPath 프로퍼티 경로인 "C:/aquashop"아래에 product 폴더에 이미지를 저장하므로 상품 이미지ㅣ를
												// 불러오는 경로로 */images/product/*를 붙여준다.
											
	//상품 이미지 정보 저장
		productImg.updateProductImg(oriImgName, imgName, imgUrl);// 입력 받은 상품 이미지 정보를 저장
		productImgRepository.save(productImg);
	
	}

	// 이미지 수정
	public void updateProductImg(Long productImgId, MultipartFile productImgFile) throws Exception{
		if(!productImgFile.isEmpty()) {
			ProductImg savedProductImg = productImgRepository.findById(productImgId)
			.orElseThrow(EntityNotFoundException::new);
		
		// 이미지 수정시 기존 이미지 파일 삭제
		if(!StringUtils.isEmpty(savedProductImg.getImgName())) {
			fileService.deleteFile(productImgLocation + "/"+
		savedProductImg.getImgName());
		}
		
		String oriImgName = productImgFile.getOriginalFilename();
		String imgName = fileService.uploadFile(productImgLocation, oriImgName, productImgFile.getBytes());
		String imgUrl = "/images/product/" + imgName;
		savedProductImg.updateProductImg(oriImgName, imgName, imgUrl);
	 	} 
		
	}

}
