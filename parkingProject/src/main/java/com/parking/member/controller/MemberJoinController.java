package com.parking.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/join")
public class MemberJoinController {

	@RequestMapping(value="/memberJoin")
	public String MemberJoinForm(){
	
		return "join/memberJoin";
	}
	
}
