package com.shop.aqua.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;



import com.shop.aqua.constant.ItemSellStatus;
import com.shop.aqua.dto.ItemFormDto;
import com.shop.aqua.exception.OutOfStockException;

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
	private Long id;			 		//상품 코드
	
	@ManyToOne
	@JoinColumn(name = "category_id")
	private Category category;
	
	
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
	
	public void updateItem(ItemFormDto itemFormDto) {
		this.itemNm = itemFormDto.getItemNm();
		this.price = itemFormDto.getPrice();
		this.stockNumber = itemFormDto.getStockNumber();
		this.itemDetail = itemFormDto.getItemDetail();
		this.itemSellStatus = itemFormDto.getItemSellStatus();
	}

	public static void insertAndFind(EntityManager em) {
		Category category = new Category();
		category.setCategoryName("열대어생물");
		em.persist(category);

		Item item = new Item();
		item.setItemNm("goldfish");
		item.setCategory(category);
		item.getCategory().getItems().add(item);
		em.persist(item);

		List<Item> itemList = category.getItems();
		for (Item items : itemList) {
			System.out.println(item.getItemNm());
		}
		
	}
    public void removeStock(int stockNumber){
        int restStock = this.stockNumber - stockNumber;
        if(restStock<0){
            throw new OutOfStockException("상품의 재고가 부족 합니다.(현재 재고 수량: "+ this.stockNumber+")");
        }
        this.stockNumber = restStock;
    }
    public void  addStock(int stockNumber) {
        this.stockNumber += stockNumber;
    }

		public static void update(EntityManager em){
			Category newCategory = new Category();
			newCategory.setCategoryName("어항");
			em.persist(newCategory);

			Item item = em.find(Item.class, 1);
			item.setCategory(newCategory);
			item.getCategory().getItems().add(item);



	}
		public void setCategory(Category category){
			// 이미 카테고리가 있을 경우 관계를 제거한다.
			if(this.category != null){
				this.category.getItems().remove(this);
			}

			this.category = category;

			if(category != null){
				category.getItems().add(this);
			}
		}
	
	
	
	

}
