package com.parking.member.dao;

import com.parking.member.vo.MemberVO;


public interface MemberLoginDAO {
	public String getPwd(MemberVO param);
	public MemberVO memberData(MemberVO param);
}
