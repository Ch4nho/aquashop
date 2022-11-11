package com.shop.aqua.repository;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.EntityManager;

import org.apache.commons.lang3.StringUtils;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;

import com.querydsl.core.QueryResults;
import com.querydsl.core.types.dsl.BooleanExpression;
import com.querydsl.jpa.impl.JPAQueryFactory;
import com.shop.aqua.constrant.ProductSellStatus;
import com.shop.aqua.dto.MainProductDto;
import com.shop.aqua.dto.ProductSearchDto;
import com.shop.aqua.dto.QMainProductDto;
import com.shop.aqua.entity.Product;
import com.shop.aqua.entity.QProduct;
import com.shop.aqua.entity.QProductImg;


 
public class ProductRepositoryCustomImpl implements ProductRepositoryCustom{

	
	private JPAQueryFactory queryFactory;
	
	public ProductRepositoryCustomImpl(EntityManager em) {
		this.queryFactory = new JPAQueryFactory(em);
	
	}
	private BooleanExpression searchSellStatusEq(ProductSellStatus searchSellStatus) {
		return searchSellStatus == null ? null : QProduct.product.productSellStatus.eq(searchSellStatus);
	}
	
	private BooleanExpression regDtsAfter(String searchDateType) {
		LocalDateTime dateTime = LocalDateTime.now();
		
		if(StringUtils.equals("all", searchDateType) || searchDateType == null) {
			return null;
		}else if (StringUtils.equals("1d", searchDateType)) {
			dateTime = dateTime.minusDays(1);
		}else if (StringUtils.equals("1w", searchDateType)) {
			dateTime = dateTime.minusWeeks(1);
		}else if (StringUtils.equals("1m", searchDateType)) {
			dateTime = dateTime.minusMonths(1);
		}else if (StringUtils.equals("6m", searchDateType)) {
			dateTime = dateTime.minusMonths(6);
		}
		return QProduct.product.createAt.after(dateTime);
	}
	
	
//	private BooleanExpression createDtsAfter(String searchDateType) {
//	LocalDateTime dateTime = LocalDateTime.now();
//	
//	if(StringUtils.equals("all", searchDateType) || searchDateType == null) {
//		return null;
//	}else if (StringUtils.equals("1d", searchDateType)) {
//        dateTime = dateTime.minusDays(1);
//    } else if (StringUtils.equals("1w", searchDateType)) {
//        dateTime = dateTime.minusWeeks(1);
//    } else if (StringUtils.equals("1m", searchDateType)) {
//        dateTime = dateTime.minusMonths(1);
//    } else if (StringUtils.equals("6m", searchDateType)) {
//        dateTime = dateTime.minusMinutes(6);
//    }
//	return QProduct.product.createAt.after(dateTime);
//	
//}
	
	private BooleanExpression searchByLike(String searchBy, String searchQuery) {
		
		if(StringUtils.equals("productName", searchBy)) {
			return QProduct.product.productName.like("%" + searchQuery+ "%");
		}else if(StringUtils.equals("createdBy", searchBy)) {
			return QProduct.product.createdBy.like("%" +searchQuery + "%");
		}
	return null;
	}
	


	@Override
	public Page<Product> getAdminProductPage(ProductSearchDto productSearchDto, Pageable pageable){
		
		QueryResults<Product> results = queryFactory
				.selectFrom(QProduct.product)
				.where(regDtsAfter(productSearchDto.getSearchDateType()),
						searchSellStatusEq(productSearchDto.getSeaProductSellStatus()),
						searchByLike(productSearchDto.getSearchBy(), 
								productSearchDto.getSearchQuery()))
				.orderBy(QProduct.product.id.desc())
				.offset(pageable.getOffset())
				.limit(pageable.getPageSize())
				.fetchResults();
						
		
		List<Product> content = results.getResults();
	    long total = results.getTotal();
		
		return new PageImpl<>(content, pageable, total);
	}
	
	private BooleanExpression productNameLike(String searchQuery) {
		return StringUtils.isEmpty(searchQuery) ? null : QProduct.product.productName.like("%" + searchQuery + "%");
	}
	
	
	

 

	
	 @Override
	 public Page<MainProductDto> getMainProductPage(ProductSearchDto productSearchDto, Pageable pageable){
		 QProduct product = QProduct.product;
		 QProductImg productImg = QProductImg.productImg;
		 
		 QueryResults<MainProductDto> results = queryFactory
				 .select(
						 new QMainProductDto(
								 product.id,
								 product.productName,
								 product.productInfo,
								 productImg.imgUrl,
								 product.productPrice)
				 )
				 .from(productImg)
				 .join(productImg.product, product)
				 .where(productImg.repimgYn.eq("Y"))
				 .where(productNameLike(productSearchDto.getSearchQuery()))
				 .orderBy(product.id.desc())
				 .offset(pageable.getOffset())// 페이지 번호
				 .limit(pageable.getPageSize())	// 페이지 사이즈
				 .fetchResults();
		 

		 List<MainProductDto> content = results.getResults();
		 long total = results.getTotal();
	
		 return new PageImpl<>(content,pageable,total);
	 }
	 
	
}




