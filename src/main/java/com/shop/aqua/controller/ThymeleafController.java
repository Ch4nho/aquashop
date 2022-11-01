package com.shop.aqua.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/thymeleaf")
public class ThymeleafController {
	
	@GetMapping(value="/index")
	public String thymeleafIndex() {
		return "index";
	}
}
