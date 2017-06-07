package com.parking.booking.vo;

import java.util.Date;

public class MemberVO {

	private int memberNum; // 회원번호
	private String memberId; // 회원 아이디
	private String memberPwd; // 회원 비밀번호
	private String memberName; // 회원 이름
	private String memberPhone; // 전화번호
	private String memberEmail; // 이메일
	private int memberPolicy; // 약관동의
	private Date memberDate; // 가입 날짜
	private int memberType; // 회원 종류 (가입 /탈퇴)

}
