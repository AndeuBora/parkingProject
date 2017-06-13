package com.parking.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.parking.member.dao.MemberJoinDAO;
import com.parking.member.vo.MemberVO;

@Service
@Transactional
public class MemberJoinServiceImpl implements MemberJoinService {

	@Autowired
	private MemberJoinDAO memberJoinDAO;

	@Override
	public int insertMember(MemberVO param) {
		// TODO Auto-generated method stub
		return memberJoinDAO.insertMember(param);
	}

	@Override
	public int idCheck(MemberVO memberVo) {
		// TODO Auto-generated method stub
		int result=0;
		
		result=memberJoinDAO.idCheck(memberVo);
		
		return result;
	}
}
