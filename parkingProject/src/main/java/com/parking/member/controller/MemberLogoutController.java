package com.parking.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/logout")
public class MemberLogoutController {


	//로그아웃 기능
	@RequestMapping("/memberLogout")
	public ModelAndView logout(HttpSession session){
		
		ModelAndView mav=new ModelAndView();
		
		mav.setViewName("main");
		mav.addObject("msg", "로그아웃");
		
		session.invalidate();
		
		return mav;
		
	}
}
