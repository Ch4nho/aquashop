package com.shop.aqua.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.shop.aqua.entity.ItemImg;

public interface ItemImgRepository extends JpaRepository<ItemImg, Long> {
	List<ItemImg> findByItemIdOrderByIdAsc(Long itemId);

	  ItemImg findByItemIdAndRepimgYn(Long itemId, String repimgYn);
}
