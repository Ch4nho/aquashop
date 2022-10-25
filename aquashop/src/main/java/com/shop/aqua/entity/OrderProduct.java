package com.shop.aqua.entity;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class OrderProduct {
	
	@Id
	@GeneratedValue
	@Column(name = "order_product_id")
	private Long product_id;
	
	@ManyToOne
	@JoinColumn(name = "product_id")
	private Product product;
	
	@ManyToOne
	@JoinColumn(name="order_id")
	private Order order;
	
	private int orderPrice; // 주문가격
	
	private int count; // 수량
	
	private LocalDateTime regTime; 

	private LocalDateTime updateTime;
	
	
	
	
	
	

}
