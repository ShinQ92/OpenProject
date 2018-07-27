package com.bitcamp.op;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

public class joinController {
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String getLoginForm(@RequestParam(value="type", required=false) String type  ) {
		return "join/joinForm";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String processLogin(
			HttpServletRequest request ) {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		return "loginOk";
	}
}
