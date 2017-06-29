package com.parking.admin.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.parking.admin.service.MemberManagementService;
import com.parking.admin.vo.MemberVO;
import com.parking.member.paging.PagingMember;

import com.parking.member.paging.UtilMember;

@Controller
@RequestMapping(value = "/memberListBoard")
public class MemberManagementController {

	@Autowired
	private MemberManagementService memberService;

	// 리스트 보여주기
	@RequestMapping(value = "/memberList", method = RequestMethod.GET)
	public String memberList(@ModelAttribute MemberVO memberVo, Model model) {

	
		// 페이지 세팅
		PagingMember.set(memberVo);

		System.out.println(memberVo.getMemberType());
		System.out.println(memberVo.getMemberName());
		
		if(memberVo.getMemberName()==null||"".equals(memberVo.getMemberName().toString())){
		
			memberVo.setMemberName("all");	
		}
		
	
		
		// 멤버 리스트
		List<MemberVO> memberList = memberService.memberList(memberVo);

		// 전체 레코드 수 구하기
		int memberTotal = memberService.memberListCnt(memberVo);

		System.out.println(memberTotal);
		
		int memberCount = memberTotal
				- (UtilMember.nvl(memberVo.getPage()) - 1) * UtilMember.nvl(memberVo.getPageSize());

		
		// 리스트값 저장
		model.addAttribute("memberList", memberList);

		// vo값 저장
		model.addAttribute("data", memberVo);

		// 카운트값 저장
		model.addAttribute("memberCount", memberCount);

		// 전체 레코드수 저장
		model.addAttribute("memberTotal", memberTotal);

		return "memberList/memberList";
	}

}
