package com.shop.aqua.dto;
import lombok.Data;

@Data // getter,setter hashcode, tostring 등 자동 생성된다.
public class ContentDto {
	
	private int id;
	private String writer;
	private String content;

} 
