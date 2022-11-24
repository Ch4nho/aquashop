package com.shop.aqua.repository;

import com.shop.aqua.dto.CartDetailDto;
import com.shop.aqua.entity.CartItem;
import com.shop.aqua.entity.Item;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface CartItemRepository extends JpaRepository<CartItem, Long> {
    CartItem findByCartIdAndItemId(Long cartId, Long itemId);

    @Query(value="select new com.shop.aquadto.CartDetailDto(ci.id, i.itemNm, i.price, ci.count, im.imgUrl) " +
            "from CartItem ci, ItemImg im " +
            "join ci.item i " +
            "where ci.cart.id = :cartId and im.item.id = ci.item.id and im.repimgYn = 'Y' " +
            "order by ci.regTime desc",nativeQuery = true)
    List<CartDetailDto> findCartDetailDtoList(Long cartId);



}
 