package com.shop.aqua.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.shop.aqua.entity.Item;

public interface ItemRepository extends JpaRepository<Item, Long> {

}
