package com.shop.aqua.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.security.crypto.password.PasswordEncoder;

import com.shop.aqua.constant.Role;
import com.shop.aqua.dto.JoinDto;

import lombok.Data;

@Entity
@Table(name="member")
@Data
public class Member {
	
	@Id
	@Column(name="member_id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;		//회원 번호
	
	@Column(unique = true)
	private String username; //회원 아이디
	
	private String name;	//이름
	
	private String password; //비밀번호
	
	@Column(unique = true)
	private String email;	 //이메일
	
	private String address;	 //주소
	
	private String phone;   //전화번호
	
	@Enumerated(EnumType.STRING)
	private Role role;		//권한
	
	public static Member createMember(JoinDto joinDto, PasswordEncoder passwordEncoder) {
		Member member = new Member();
		member.setUsername(joinDto.getUsername());
		member.setName(joinDto.getName());
		member.setEmail(joinDto.getEmail());
		member.setAddress(joinDto.getAddress());
		String password = passwordEncoder.encode(joinDto.getPassword());
		member.setPassword(password);
		member.setPhone(joinDto.getPhone());
		member.setRole(Role.USER);
		return member;
	}
}
