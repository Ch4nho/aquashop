package com.shop.aqua.repository;



import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.shop.aqua.entity.Item;
import com.shop.aqua.dto.ItemSearchDto;
import com.shop.aqua.dto.MainItemDto;


public interface ItemRepositoryCustom {

    Page<Item> getAdminItemPage(ItemSearchDto itemSearchDto, Pageable pageable);

    Page<MainItemDto> getMainItemPage(ItemSearchDto itemSearchDto, Pageable pageable);
}
