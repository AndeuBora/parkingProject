package com.parking.payment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/payment")
public class PaymentController {
	
	@RequestMapping(value="/payment")
	public String payment(){
		
		return "payment/payment";
	}
	
	
	
		
		@RequestMapping(value="/paymentComplete")
		public String paymentComplete(){
			
			return"payment/paymentComplete";
		}
	}


