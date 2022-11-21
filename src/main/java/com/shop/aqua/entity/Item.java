package com.shop.aqua.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

import com.shop.aqua.constant.ItemSellStatus;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name="item")
@Getter @Setter
@ToString
public class Item extends BaseEntity {
	
	@Id
	@Column(name="item_id")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;					//상품 코드
	
	@Column(nullable=false, length=50)  
	private String itemNm;				//상품명
	
	@Column(nullable=false)
	private int price;					//가격
	
	@Column(nullable=false)
	private int stockNumber;			//재고수량
	
	@Lob
	@Column(nullable=false)
	private String itemDetail;			//상품 상세 설명
	
	@Enumerated(EnumType.STRING)
	private ItemSellStatus itemSellStatus; //상품 판매 상태

}
