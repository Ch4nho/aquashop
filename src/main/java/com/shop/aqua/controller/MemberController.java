package com.shop.aqua.controller;

import javax.validation.Valid;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.shop.aqua.dto.JoinDto;
import com.shop.aqua.entity.Member;
import com.shop.aqua.service.MemberService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MemberController {
	
	private final MemberService memberService;
	private final PasswordEncoder passwordEncoder;
	
	// 회원가입_GET
	@GetMapping("/members/new")
	public String join(Model model) {
		model.addAttribute("joinDto", new JoinDto());
		return "user/join";
	}
	
	// 회원가입_POST
	@PostMapping("/members/new")
	public String newMember(@Valid JoinDto joinDto, BindingResult bindingResult, Model model) {
		
		if(bindingResult.hasErrors()) {
			return "user/join";
		}
		
		try {
			Member member = Member.createMember(joinDto, passwordEncoder);
			memberService.saveMember(member);
		} catch (IllegalStateException e) {
			model.addAttribute("errorMessage", e.getMessage());
			return "user/join";
		}
		
		System.out.println(joinDto.toString());
		
		return "redirect:/";		// 회원가입 후 메인페이지로 이동
	}
}
