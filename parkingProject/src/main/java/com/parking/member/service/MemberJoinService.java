package com.parking.member.service;

import com.parking.member.vo.MemberVO;

public interface MemberJoinService {

	public int insertMember(MemberVO param);
	public int idCheck(String memberId);
}
