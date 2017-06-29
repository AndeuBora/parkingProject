package com.parking.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.mapping.ResultMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.parking.member.passwd.crypt.BCrypt;
import com.parking.member.service.MemberJoinService;

import com.parking.member.vo.MemberVO;

@Controller
@RequestMapping(value = "/join")
public class MemberJoinController {

	@Autowired
	private MemberJoinService memberJoinService;
	

	// 회원가입 페이지 폼 출력
	@RequestMapping(value = "/memberJoin")
	public String MemberJoinForm() {

		return "join/memberJoin";
	}

	// 회원 등록
	@RequestMapping(value = "/insertMember", method = RequestMethod.POST)
	public String insertMember(@ModelAttribute MemberVO param) {

		int result = 0;

		// 사용자가 입력한 비밀번호 값 변수에 저장
		String memberPwd = param.getMemberPwd();

		// BCrypt 객체 생성
		BCrypt pwdEncode = new BCrypt();

		// 입력 값 암호화
		String pwdHashed = pwdEncode.hashpw(memberPwd, pwdEncode.gensalt());

		// 암호된 값으로 다시 세팅
		param.setMemberPwd(pwdHashed);

		result = memberJoinService.insertMember(param);

		System.out.println(result);
		System.out.println(param.getMemberName());

		return "join/memberJoin";
	}

	// 아이디 중복검사
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	@ResponseBody
	public String idCheck(@ModelAttribute MemberVO memberVo) {

		System.out.println("check" + memberVo.getMemberId());
		int result = 0;

		result = memberJoinService.idCheck(memberVo);

		return result + "";

	}


}
