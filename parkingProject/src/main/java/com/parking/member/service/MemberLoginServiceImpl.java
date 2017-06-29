package com.parking.member.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.parking.member.dao.MemberLoginDAO;
import com.parking.member.vo.MemberVO;

@Service
public class MemberLoginServiceImpl implements MemberLoginService {
	
	
	
	@Autowired
	private MemberLoginDAO memberLoginDAO;
	
@Override
public String getPwd(MemberVO param) {
	
	String result=memberLoginDAO.getPwd(param);
	
	return result;
}
@Override
public MemberVO memberData(MemberVO param) {
	// TODO Auto-generated method stub
	return memberLoginDAO.memberData(param);
}

/*@Override
public boolean loginCheck(MemberVO param, HttpSession session) {
	// TODO Auto-generated method stub
	return false;
}*/
}
