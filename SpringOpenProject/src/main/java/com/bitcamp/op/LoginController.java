package com.bitcamp.op;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {

	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String getLoginForm(@RequestParam(value="type", required=false) String type  ) {
		return "login/loginForm";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String processLogin(
			HttpServletRequest request
			) {
		// 1. request 객체를 이용한 데이터 받기
		//    : 메서드의 매개변수에 HttpServletRequest 매개변수로 선언
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		System.out.println("폼에서 전송된 데이터 request 객체 이용 : " + id + " : " + pw);
		return "loginOk";
	}
}
