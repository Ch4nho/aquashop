package com.shop.aqua.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.shop.aqua.entity.Member;

public interface MemberRepository extends JpaRepository<Member, Long> {
	
	Member findByEmail(String email);
	Member findByUsername(String username);

}
