package com.parking.admin.dao;

import java.util.List;

import com.parking.admin.vo.MemberVO;

public interface MemberManagementDAO {
	public List<MemberVO> memberList(MemberVO memberVo);
	public int memberListCnt(MemberVO memberVo);
}
