package com.shop.aqua.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

	@RequestMapping("/")
	public @ResponseBody String root() throws Exception {
		return "Hello Test";
	}
	
	@GetMapping("/test1")
	public String test1(Model model) {		
		return "test1";
	}
	
	@GetMapping("/test2")
	public String test2() {		
		return "test2";
	}

}
