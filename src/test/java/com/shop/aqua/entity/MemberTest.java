//package com.shop.aqua.service.entity;
//
//import javax.persistence.EntityManager;
//import javax.persistence.EntityNotFoundException;
//import javax.persistence.PersistenceContext;
//
//import org.junit.jupiter.api.DisplayName;
//import org.junit.jupiter.api.Test;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.context.SpringBootTest;
//import org.springframework.security.test.context.support.WithMockUser;
//import org.springframework.test.context.TestPropertySource;
//import org.springframework.transaction.annotation.Transactional;
//
//
//import com.shop.aqua.repository.MemberRepository;
//
//@SpringBootTest
//@Transactional
//@TestPropertySource(locations = "classpath:application-test.properties")
//public class MemberTest {
//	
//	@Autowired
//	MemberRepository memberRepository;
//	
//	@PersistenceContext //영속성 컨텍스트 사용 가상의 DB역할
//	EntityManager em;		// ENtityManager 생성하여 영속성 컨텍스트에 접근
//	
//	@Test
//	@DisplayName("AUditing 테스트")
//	@WithMockUser(username="gildong", roles="USER")
//	public void auditingTest() {
//		Member newMember = new Member();
//		memberRepository.save(newMember);
//		
//		em.flush();
//		em.clear();
//		
//		  Member member = memberRepository.findById(newMember.getId())
//                  .orElseThrow(EntityNotFoundException::new);
//		  
//		  System.out.println("register time" +member.getRegTime());
//	}
//	
//
//}
