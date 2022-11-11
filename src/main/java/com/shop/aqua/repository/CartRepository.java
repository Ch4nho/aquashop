package com.shop.aqua.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.shop.aqua.entity.Cart;

public interface CartRepository extends JpaRepository<Cart, Long>{
	
//	Cart findByMemberId(Long member_Id);

}
