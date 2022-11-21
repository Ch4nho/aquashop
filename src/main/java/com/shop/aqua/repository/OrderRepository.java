package com.shop.aqua.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.shop.aqua.entity.Order;

public interface OrderRepository extends JpaRepository<Order, Long> {

}
