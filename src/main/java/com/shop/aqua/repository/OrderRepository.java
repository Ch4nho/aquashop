package com.shop.aqua.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.shop.aqua.entity.Order;


public interface OrderRepository extends JpaRepository<Order, Long>{
	
//	@Modifying
//	@Query("select count(o) from Order o where o.member.email = :email", )
//	Long countOrder(@Param("email") String email);

}
