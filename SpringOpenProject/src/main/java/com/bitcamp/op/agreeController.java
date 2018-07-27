package com.bitcamp.op;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

public class agreeController {
	@RequestMapping(value="/agree", method=RequestMethod.GET)
	public String getLoginForm(@RequestParam(value="type", required=false) String type  ) {
		return "join/agree";
	}
	
	@RequestMapping(value="/agree", method=RequestMethod.POST)
	public String processLogin(
			HttpServletRequest request,
			@RequestParam("id") String userId,
			@RequestParam("pw") String userPw,
			
			loginInfo info,
			Model model
			) {
				
		
		return "joinForm";
	}
}
