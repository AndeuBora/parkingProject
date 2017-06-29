package com.parking.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping(value="/adminLogout")
public class AdminLogoutController {
	//로그아웃 기능
	@RequestMapping("/adminLogout")
	public ModelAndView logout(HttpSession session){
		
		ModelAndView mav=new ModelAndView();
		
		mav.setViewName("loginTest");
		mav.addObject("msg", "로그아웃");
		
		session.invalidate();
		
		return mav;
		
	}
}
