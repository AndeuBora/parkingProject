package com.parking.admin.vo;

import com.parking.member.paging.PagingMemberVO;

public class MemberVO extends PagingMemberVO {

	private int memberNum; // 회원번호
	private String memberId; // 회원 아이디
	private String memberPwd; // 회원 비밀번호
	private String memberName; // 회원 이름
	private String memberPhone; // 전화번호
	private String memberEmail; // 이메일
	private int memberPolicy; // 약관동의
	private String memberDate; // 가입 날짜
	private int memberType; // 회원 종류 (가입 /탈퇴)
	private String newMemberPwd; //새비밀번호
    private int rnum;//글 순서 번호
	

    
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPwd() {
		return memberPwd;
	}
	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberPhone() {
		return memberPhone;
	}
	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public int getMemberPolicy() {
		return memberPolicy;
	}
	public void setMemberPolicy(int memberPolicy) {
		this.memberPolicy = memberPolicy;
	}
	public String getMemberDate() {
		return memberDate;
	}
	public void setMemberDate(String memberDate) {
		this.memberDate = memberDate;
	}
	public int getMemberType() {
		return memberType;
	}
	public void setMemberType(int memberType) {
		this.memberType = memberType;
	}
	public String getNewMemberPwd() {
		return newMemberPwd;
	}
	public void setNewMemberPwd(String newMemberPwd) {
		this.newMemberPwd = newMemberPwd;
	}

	
	
}
