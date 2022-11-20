package com.shop.aqua.entity;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.shop.aqua.constant.OrderStatus;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name="orders")
@Getter @Setter
@ToString
public class Order extends BaseEntity {
	
	@Id
	@Column(name="order_id")
	@GeneratedValue
	private Long id;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="member_id")
	private Member member;
	
	private LocalDateTime orderDate;  //주문일
	
	@Enumerated(EnumType.STRING)
	private OrderStatus orderStatus;  //주문상태
	
	@OneToMany(mappedBy="order", cascade=CascadeType.ALL , 
			orphanRemoval=true, fetch = FetchType.LAZY)
	private List<OrderItem> orderItems = new ArrayList<>();
}
