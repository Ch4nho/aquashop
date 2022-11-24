package com.shop.aqua.dto;

import com.shop.aqua.entity.Category;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.util.List;
import java.util.stream.Collectors;

@Getter
@AllArgsConstructor
@NoArgsConstructor
public class CategoryDto {

    private Long id;
    private String categoryName;
    
//    private List<CategoryDto> children;
//
//
//    public static CategoryDto of(Category category) {
//        return new CategoryDto(
//                category.getId(),
//                category.getCategoryName(),
//                category.getProducts().stream().map(CategoryDto::of).collect(Collectors.toList())
//        );
//    }
//}






}
