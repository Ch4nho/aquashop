package com.shop.aqua.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

	@RequestMapping("/")
	public @ResponseBody String root() throws Exception {
		return "Hello Test";
	}
	
	@RequestMapping("/test1")
	public String test1() {		
		return "test1";
	}

}
