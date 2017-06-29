package com.parking.member.service;

import javax.servlet.http.HttpSession;

import com.parking.member.vo.MemberVO;

public interface MemberLoginService {
	public String getPwd(MemberVO param);

	public MemberVO memberData(MemberVO param);

	//public boolean loginCheck(MemberVO param, HttpSession session);
}
