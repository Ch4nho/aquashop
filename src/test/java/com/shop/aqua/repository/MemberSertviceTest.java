package com.shop.aqua.repository;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.TestPropertySource;
import org.springframework.transaction.annotation.Transactional;

import com.shop.aqua.dto.MemberFormDto;
import com.shop.aqua.entity.Member;
import com.shop.aqua.service.MemberService;



@SpringBootTest
@Transactional
@TestPropertySource(locations = "classpath:application-test.properties")
class MemberSertviceTest {
	
	
    @Autowired
    MemberService memberService;
	
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
	
	public Member createMember() { // 생성할 회원 정보
		MemberFormDto memberFormDto = new MemberFormDto();
		memberFormDto.setEmail("test@email.com");
		memberFormDto.setUserId("gildong");
		memberFormDto.setMemberName("홍길동");
		memberFormDto.setZipcode("125-22");
		memberFormDto.setMemberAddress("서울시");
		memberFormDto.setAddress_detail("상세주소");
		memberFormDto.setPhone("010-2222-3333");
		memberFormDto.setMemberPw("Q12345678(");
		return Member.createMember(memberFormDto, passwordEncoder);
		
	}
	@Test
	@DisplayName("회원가입 테스트")
	public void saveMemberTest() {
	Member member = createMember();
	Member saveMemer = memberService.saveMember(member);
	assertEquals(member.getEmail(), saveMemer.getEmail());
	assertEquals(member.getUserId(), saveMemer.getUserId());
	assertEquals(member.getMemberName(), saveMemer.getMemberName());
	assertEquals(member.getZipcode(), saveMemer.getZipcode());
	assertEquals(member.getMemberAddress(), saveMemer.getMemberAddress());
	assertEquals(member.getAddress_detail(), saveMemer.getAddress_detail());
	assertEquals(member.getPhone(), saveMemer.getPhone());
	assertEquals(member.getMemberPw(), saveMemer.getMemberPw());
	assertEquals(member.getRole(), saveMemer.getRole());
		
		
	}
	
	@Test
	@DisplayName("중복 회원가입 테스트")
	public void saveDuplicateMemberTest() {
		Member member1 = createMember();
		Member member2 = createMember();
		memberService.saveMember(member1);
		Throwable e = assertThrows(IllegalStateException.class, () -> {
			memberService.saveMember(member2);});
		assertEquals("이미 가입된 회원입니다.", e.getMessage());
		}
		
    @Test
    @DisplayName("로그인 성공 테스트")
    public void loginSuccessTest() throws  Exception {
    
    }
	
	
		
	}

	
	

