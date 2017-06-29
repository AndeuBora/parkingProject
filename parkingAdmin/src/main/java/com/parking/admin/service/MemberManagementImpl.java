package com.parking.admin.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.parking.admin.dao.MemberManagementDAO;
import com.parking.admin.vo.MemberVO;

@Service
@Transactional
public class MemberManagementImpl implements MemberManagementService {

	@Autowired
	private MemberManagementDAO memberDAO;

	//글목록 구현
	@Override
	public List<MemberVO> memberList(MemberVO memberVo) {
		List<MemberVO> memberList = new ArrayList<MemberVO>();
		memberList = memberDAO.memberList(memberVo);
		return memberList;
	}
	
	//전체 레코드 수 구현
	@Override
	public int memberListCnt(MemberVO memberVo) {
	     
		return memberDAO.memberListCnt(memberVo);
	}
}
