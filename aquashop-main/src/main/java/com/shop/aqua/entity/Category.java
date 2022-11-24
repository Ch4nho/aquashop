package com.shop.aqua.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Data
@Table(name="category")
public class Category {

    @Id
    @Column(name = "category_id")
    @GeneratedValue(strategy =GenerationType.IDENTITY)
    private Long id;


    private String categoryName;

    @OneToMany(mappedBy = "category")
    private List<Item> items = new ArrayList<Item>();


//public static void insertAndFind(EntityManager em){
//    Category category = new Category();
//    category.setCategoryName("물고기");
//    em.persist(category);
//
//    Product product = new Product();
//    product.setProductName("goldfish");
//    product.setCategory(category);
//    product.getCategory().getProducts().add(product);
//    em.persist(product);
//
//    List<Product> productList = category.getProducts();
//    for(Product item:productList){
//        System.out.println(item.getProductName());
//    }
//
//}
//
//    public static void update(EntityManager em){
//    Category newCategory = new Category();
//    newCategory.setCategoryName("etc");
//    em.persist(newCategory);
//
//    Product product = em.find(Product.class, 1);
//    product.setCategory(newCategory);
//    product.getCategory().getProducts().add(product);
//    }
//
//
//
//    public void setCategory(Category category){
//    // 이미 카테고리가 있을 경우 관계를 제거한다.
//        if(this.category != null){
//            this.category.getProducts().remove(this);
//        }
//
//        this.category = category;
//
//        if(category != null){
//            category.getProducts().add(this);
//        }
//    }

}
