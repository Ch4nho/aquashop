package com.shop.aqua.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.shop.aqua.entity.OrderItem;

public interface OrderItemRepository extends JpaRepository<OrderItem, Long> {

}
