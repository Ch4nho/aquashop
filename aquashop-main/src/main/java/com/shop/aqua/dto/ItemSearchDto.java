package com.shop.aqua.dto;

import com.shop.aqua.constant.ItemSellStatus;
import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class ItemSearchDto {

    private String searchDateType;

    private ItemSellStatus searchSellStatus;

    private  String searchBy;

    private String searchQuery = "";


    private Long categoryId;

    private String name;



}
