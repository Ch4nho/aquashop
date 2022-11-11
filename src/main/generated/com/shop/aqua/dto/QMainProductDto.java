package com.shop.aqua.dto;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.ConstructorExpression;
import javax.annotation.processing.Generated;

/**
 * com.shop.aqua.dto.QMainProductDto is a Querydsl Projection type for MainProductDto
 */
@Generated("com.querydsl.codegen.DefaultProjectionSerializer")
public class QMainProductDto extends ConstructorExpression<MainProductDto> {

    private static final long serialVersionUID = 1711790047L;

    public QMainProductDto(com.querydsl.core.types.Expression<Long> id, com.querydsl.core.types.Expression<String> productName, com.querydsl.core.types.Expression<String> productInfo, com.querydsl.core.types.Expression<String> imgUrl, com.querydsl.core.types.Expression<Integer> productPrice) {
        super(MainProductDto.class, new Class<?>[]{long.class, String.class, String.class, String.class, int.class}, id, productName, productInfo, imgUrl, productPrice);
    }

}

