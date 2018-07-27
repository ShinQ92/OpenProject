package com.bitcamp.mvc0727;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/order/order")
public class OrderController {
	
	@RequestMapping(method=RequestMethod.GET)
	public String getOrderForm() {
		return "order/orderForm";		
		//   /WEB-INF/views/order/orderForm.jsp		
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public String order(OrderCommand orderCommand) {		
		return "order/orderCompletion";
	}
	
	
	
	
	
	
	
	
	
	

}
