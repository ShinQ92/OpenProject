package com.bitcamp.mvc0727;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CookieController {
	
	@RequestMapping("/cookie/makeCookie")
	public String makeCookie(HttpServletResponse response) {
		//쿠키 생성하고 등록
		response.addCookie(new Cookie("auth", "cool"));
		
		return "cookie/makeCookie";
	}
	
	@RequestMapping("/cookie/viewCookie")
	public String viewCookie(@CookieValue(value="auth", defaultValue="0") String auth, Model model) {
		
		System.out.println("쿠키값 확인 : " + auth);
		
		model.addAttribute("auth", auth);
		
		return "cookie/viewCookie";
	}
}
