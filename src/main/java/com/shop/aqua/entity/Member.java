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

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name="member")
@Getter @Setter
@ToString
public class Member extends BaseEntity {
	
	@Id
	@Column(name="member_id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;		//회원 번호
	
	private String username; //회원 아이디
	
	private String name;	//이름
	
	private String password; //비밀번호
	
	private String password2; //비밀번호확인
	
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
		String password2 = passwordEncoder.encode(joinDto.getPassword2());
		member.setPassword2(password2);
		member.setPhone(joinDto.getPhone());
		member.setRole(Role.USER);
		return member;
	}
}
