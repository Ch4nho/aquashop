package com.shop.aqua.service;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.TestPropertySource;
import org.springframework.transaction.annotation.Transactional;

import com.shop.aqua.dto.JoinDto;
import com.shop.aqua.entity.Member;

@SpringBootTest
@Transactional
@TestPropertySource(locations="classpath:application-test.properties")
class MemberServiceTest {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	PasswordEncoder passwordEncoder;

	public Member createMember() {
		JoinDto joinDto = new JoinDto();
		joinDto.setUsername("test");  //아이디
		joinDto.setName("테스트 이름");  //이름
		joinDto.setPassword("1234");  //비밀번호
		joinDto.setEmail("test@email.com");  //이메일
		joinDto.setAddress("서울시 마포구");    //주소
		joinDto.setPhone("010-1234-1111");
	
		return Member.createMember(joinDto, passwordEncoder);
	}
	
	@Test
	@DisplayName("회원가입 테스트")
	public void saveMemberTest() {
		Member member = this.createMember();
		Member savedMember = memberService.saveMember(member);
		
		assertEquals(member.getUsername(), savedMember.getUsername());
		assertEquals(member.getName(), savedMember.getName());
		assertEquals(member.getPassword(), savedMember.getPassword());
		assertEquals(member.getEmail(), savedMember.getEmail());
		assertEquals(member.getAddress(), savedMember.getAddress());
		assertEquals(member.getPhone(), savedMember.getPhone());
	}
	
	@Test
	@DisplayName("중복 회원 가입 테스트")
	public void validateDuplicateMemberTest() {
		Member member1 = this.createMember();
	 	Member member2 = this.createMember();
	 	memberService.saveMember(member1);
	 	
	 	IllegalStateException e = assertThrows(IllegalStateException.class, () -> memberService.saveMember(member2));
	 	assertEquals("이미 가입된 회원입니다.", e.getMessage());
	}
}
