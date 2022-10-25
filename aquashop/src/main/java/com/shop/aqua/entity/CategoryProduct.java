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
@Table(name="category_product")
public class CategoryProduct {
	
	@Id
	@GeneratedValue
	@Column(name="cartegory_product_id")
	private long id;
	
	@ManyToOne
	@JoinColumn(name="category_id")
	private Category category;
	
	
	@ManyToOne
	@JoinColumn(name = "product_id")
	private Product product;
	
	private int count;

}
