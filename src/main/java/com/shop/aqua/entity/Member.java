package com.shop.aqua.entity;

import javax.persistence.*;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.shop.aqua.constrant.Role;
import com.shop.aqua.dto.MemberFormDto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;



@Entity
@Table(name="member")
@Getter
@Setter
@ToString
public class Member extends BaseEntity{
	
	
	
	@Id
	@Column(name="member_id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id; 	// 회원 번호

	private String memberName;	// 회원 이름
	
	private String userId;	// 아이디
	
	@Column(unique = true)
	private String email; 
	

	private String memberAddress;
	private String zipcode;
	private String address_detail;
	
	private String Phone;
	
	private String memberPw;
	
	@Enumerated(EnumType.STRING)
	private Role role;
	
	
	//member테이블에 회원생성
    public static  Member createMember(MemberFormDto memberFormDto, PasswordEncoder passwordEncoder){
        Member member = new Member();
    	member.setMemberName(memberFormDto.getMemberName());
        member.setUserId(memberFormDto.getUserId());
        member.setEmail(memberFormDto.getEmail());
        member.setZipcode(memberFormDto.getZipcode());
        member.setMemberAddress(memberFormDto.getMemberAddress());
        member.setAddress_detail(memberFormDto.getAddress_detail());
        member.setPhone(memberFormDto.getPhone());
        String password = passwordEncoder.encode(memberFormDto.getMemberPw()) ;
        member.setMemberPw(password);
        member.setRole(Role.USER);	// 상품 등록 관리는 ADMIN만 가능하다.
        return member;
    }





}
