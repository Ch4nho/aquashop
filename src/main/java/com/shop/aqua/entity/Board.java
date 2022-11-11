package com.shop.aqua.entity;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name="board")
@Getter
@Setter
@ToString
public class Board {
	
	 @Id
	 @Column(name="member_id")
	 @GeneratedValue(strategy = GenerationType.AUTO)
	 private String memberId; //작성자 아이디
	 
	 @Column(nullable = false, length = 50)
	 private String title; // 게시글 제목
	 
	 @Lob
	 @Column(nullable = false)
	 private String content; // 본문
	 
	 
	 
	 private int count; // 조회수
	 
	 private LocalDateTime createAt; // 등록일
	 
	 private LocalDateTime modifiendAt; // 수정일
	 
	 
	 
	 

}
