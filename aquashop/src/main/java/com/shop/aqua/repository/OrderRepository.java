package com.shop.aqua.repository;

import java.awt.print.Pageable;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.shop.aqua.entity.Order;

public interface OrderRepository extends JpaRepository<Order, Long>{

	
	
	@Query("select o from Order o where o.member.email = :email order by o.orderAt desc")
	List<Order> finOrders(@Param("email") String email, Pageable pageable);
	
	
	@Query("select count(o) from Order o where o.member.email = :email")
	
	Long countOrder(@Param("email") String email);
	
}
