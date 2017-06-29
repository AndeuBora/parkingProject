package com.parking.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.parking.admin.passwd.crypt.BCrypt;
import com.parking.admin.service.AdminLoginService;
import com.parking.admin.vo.AdminVO;
import com.parking.admin.vo.MemberVO;


@Controller
@RequestMapping(value="/adminLogin")
public class AdminLoginController {

	@Autowired
	AdminLoginService adminLoginService;
	
	//로그인 체크
	@RequestMapping(value="/adminLoginCheck", method=RequestMethod.POST)
	public ModelAndView loginCheck(@ModelAttribute AdminVO adminVo,HttpSession session){
	
		BCrypt checkPass=new BCrypt();
		ModelAndView mav=new ModelAndView();
		
		System.out.println(adminVo.getAdminId());
		System.out.println(adminVo.getAdminPwd());
		//폼에서 입력된 아이디 값으로 값을 뽑아옴 
		String result=adminLoginService.getAdminPwd(adminVo);
		
		//해당 아이디로 비밀번호를 가져오지 못할경우
		if(result==null||result==""){
			mav.setViewName("loginTest");
			mav.addObject("msg", "아이디가 틀렸습니다");
	
			}else{
				String formPwd=adminVo.getAdminPwd();
				//폼 입력 비밀번호와 DB저장 비밀번호와 비교
			boolean resultPwd=checkPass.checkpw(formPwd , result);
			
			//비밀번호 일치시
			if(resultPwd == true){
				mav.setViewName("main");
				mav.addObject("msg", "로그인 성공");
				
				
				//아이디 값으로 불러온 회원정보를 세션에 저장하자
				AdminVO adminVo2=adminLoginService.getAdminData(adminVo);
						session.setAttribute("adminId", adminVo2.getAdminId());
				
				
			}else{
				mav.setViewName("loginTest");
				mav.addObject("msg", "비밀번호가 틀렸습니다");
			}
			
			}
			return mav;

		}
			
	
}
