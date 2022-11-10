package com.shop.aqua.controller;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.aqua.dto.JoinDto;
import com.shop.aqua.service.MemberService;

import lombok.RequiredArgsConstructor;

@RequestMapping("/members")
@Controller
@RequiredArgsConstructor
public class MemberController {
	
	private final MemberService memberService;
	private final PasswordEncoder passwordEncoder;
	
	@GetMapping("/new")
	public String join(Model model) {
		model.addAttribute("joinDto", new JoinDto());
		return "user/join";
	}
<<<<<<< HEAD
=======
	
	@PostMapping("/new")
	public String join(JoinDto joinDto) {
		
		Member member = Member.createMember(joinDto, passwordEncoder);
		memberService.saveMember(member);
		
		return "redirect:/";
	}
>>>>>>> 4058442c3a591a941936e91cac6c827c96888118
}
