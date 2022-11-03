package com.shop.aqua.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shop.aqua.entity.Member;
import com.shop.aqua.repository.MemberRepository;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class MemberService {
	
	private final MemberRepository memberRepository;
	
	public Member saveMember(Member member) {
		validateDuplicateMember(member);
		return memberRepository.save(member);
	}

	private void validateDuplicateMember(Member member) {
		memberRepository.findByUsername(member.getUsername())
						.ifPresent(m -> {
							throw new IllegalStateException("이미 가입된 회원입니다.");
						});
		
	}
}
