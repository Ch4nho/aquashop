package com.shop.aqua.entity;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.shop.aqua.constrant.OrderStatus;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "orders")
@Getter @Setter
public class Order {
	
	@Id
	@GeneratedValue
	@Column(name = "order_id")
	private Long order_id; // 주문 id
	
	
	
	@ManyToOne
	@JoinColumn(name="member_id")
	private Member member_id; //주문 회원 id
	
	private LocalDateTime orderAt; // 주문일
	
	@Enumerated(EnumType.STRING)
	private OrderStatus orderStatus; // 주문상태
	
	@OneToMany(mappedBy = "order")
	private List<OrderProduct> orderProducts = new ArrayList<>();
	
	
	
	  private LocalDateTime createAt; 
	  private LocalDateTime modifiendAt; // 수정시간
	
	
	
	
	
}
