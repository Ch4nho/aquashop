package com.shop.aqua.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;



import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name="cartProduct")
public class CartProduct {
	
	 	@Id
	    @GeneratedValue
	    @Column(name="cartproduct_id")
	    private Long id;

	 	
	 	@ManyToOne
	 	@JoinColumn(name="cart_id")
	 	private Cart cart;
	 	
	 	@ManyToOne
	 	@JoinColumn(name="product_id")
	 	private Product product;
	 	
	 	private int count;
	 	
	 	
	 	
	 	
}
