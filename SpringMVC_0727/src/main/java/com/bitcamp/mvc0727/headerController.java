package com.bitcamp.mvc0727;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class headerController {

	@RequestMapping("header/check")
	public String checkHeader(@RequestHeader("Referer") String referer, Model model) {
		
		model.addAttribute("referer", referer);
		
		System.out.println("이전페이지 :" + referer);
		return "header/headerInfo";
	}

	@ModelAttribute("username")
	public String getName() {
		return "SCOTT";
	}
}
