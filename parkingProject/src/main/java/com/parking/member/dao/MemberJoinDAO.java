package com.parking.member.dao;

import com.parking.member.vo.MemberVO;

public interface MemberJoinDAO {

	public int insertMember(MemberVO param);
	public int idCheck(String memberId);
}
