package com.parking.member.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.parking.member.passwd.crypt.BCrypt;
import com.parking.member.service.MemberLoginService;
import com.parking.member.vo.MemberVO;

@Controller
@RequestMapping(value = "/login")
public class MemberLoginController {

	
	@Autowired
	private MemberLoginService memberLoginService;
	
	
	@RequestMapping(value="/loginForm")
	public String loginForm() {

		return "login/loginForm";
	}
	
	//로그인 체크
	@RequestMapping("/loginCheck")
	public ModelAndView loginCheck(@ModelAttribute MemberVO param,HttpSession session){
	
		BCrypt checkPass=new BCrypt();
		ModelAndView mav=new ModelAndView();
		
		System.out.println(param.getMemberId());
		
		//폼에서 입력된 아이디 값으로 값을 뽑아옴 
		String result=memberLoginService.getPwd(param);
		
		//해당 아이디로 비밀번호를 가져오지 못할경우
		if(result==null||result==""){
			mav.setViewName("login/loginForm");
			mav.addObject("msg", "아이디가 틀렸습니다");
	
			}else{
				String formPwd=param.getMemberPwd();
				//폼 입력 비밀번호와 DB저장 비밀번호와 비교
			boolean resultPwd=checkPass.checkpw(formPwd , result);
			
			//비밀번호 일치시
			if(resultPwd==true){
				mav.setViewName("main");
				mav.addObject("msg", "로그인 성공");
				
				
				
				//아이디 값으로 불러온 회원정보를 세션에 저장하자
				MemberVO param2=memberLoginService.memberData(param);
				session.setAttribute("memberNum", param2.getMemberNum());
				session.setAttribute("memberId", param2.getMemberId());
				session.setAttribute("memberPhone",param2.getMemberPhone());
				session.setAttribute("memberType", param2.getMemberType());
				
			}else{
				mav.setViewName("login/loginForm");
				mav.addObject("msg", "비밀번호가 틀렸습니다");
			}
			
			}
			return mav;

		}
		
	
		
		
		//boolean isvalidPassword=BCrypt.checkpw(password, passwordHashed);
		
		
	
	

}
