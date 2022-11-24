package com.shop.aqua.dto;

import com.shop.aqua.constant.OrderStatus;
import com.shop.aqua.entity.Order;
import com.shop.aqua.dto.OrderItemDto;

import lombok.Getter;
import lombok.Setter;

import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
 
@Getter @Setter
public class OrderHistDto {

    public OrderHistDto(Order order){
        this.orderId = order.getId();
        this.orderDate = order.getOrderDate().format(DateTimeFormatter.ofPattern("yyyy-MM-dd-HH:mm"));
        this.orderStatus = order.getOrderStatus();
    }

    private  Long orderId; // 주문 아이디

    private  String orderDate; // 주문날짜

    private OrderStatus orderStatus; // 주문 상태

    private List<OrderItemDto> orderItemDtoList = new ArrayList<>();


    // 주문 상품리스트

    public void addOrderItemDto(OrderItemDto orderItemDto) {
        orderItemDtoList.add(orderItemDto);
    }


}
