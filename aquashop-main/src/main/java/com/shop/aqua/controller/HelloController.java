package com.shop.aqua.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HelloController {

	@RequestMapping("/")
	public @ResponseBody String root() throws Exception {
		return "Hello World";
	}

	@RequestMapping("/test1")
	public String test1() {
		return "test1";
	}
}
