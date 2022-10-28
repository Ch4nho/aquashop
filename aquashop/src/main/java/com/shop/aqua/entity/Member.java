package com.shop.aqua.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.shop.aqua.constrant.Role;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name="member")
@Getter
@Setter
@ToString
public class Member {
	
	
	
	@Id
	@Column(name="member_id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private String member_id; 
	
	@Column(unique = true)
	private Long member_no;
	private String member_email;
	private String member_name;
	private String member_address;
	
	private String member_pw;
	
	@Enumerated(EnumType.STRING)
	private Role role;
	
	

}
