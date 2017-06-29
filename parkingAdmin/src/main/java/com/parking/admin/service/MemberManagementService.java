package com.parking.admin.service;

import java.util.List;

import com.parking.admin.vo.MemberVO;

public interface MemberManagementService {
	public List<MemberVO> memberList(MemberVO memberVo);
	public int memberListCnt(MemberVO memberVo);
}
