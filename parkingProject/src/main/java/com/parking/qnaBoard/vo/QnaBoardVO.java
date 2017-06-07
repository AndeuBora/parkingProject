package com.parking.qnaBoard.vo;

import java.util.Date;

public class QnaBoardVO {
	private int qnaNum;
	private int memberNum;
	private int adminNum;
	private String qnaTitle;
	private String qnaContent;
	private Date qnaWriteDate;
	private int ref;
	private int ref_level;
	private int ref_step;
	private int qnaWritePwd;

	public QnaBoardVO() {
		super();
	}

	public QnaBoardVO(int qnaNum, int memberNum, int adminNum, String qnaTitle, String qnaContent, Date qnaWriteDate,
			int ref, int ref_level, int ref_step, int qnaWritePwd) {
		super();
		this.qnaNum = qnaNum;
		this.memberNum = memberNum;
		this.adminNum = adminNum;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.qnaWriteDate = qnaWriteDate;
		this.ref = ref;
		this.ref_level = ref_level;
		this.ref_step = ref_step;
		this.qnaWritePwd = qnaWritePwd;
	}

	public int getQnaNum() {
		return qnaNum;
	}

	public void setQnaNum(int qnaNum) {
		this.qnaNum = qnaNum;
	}

	public int getMemberNum() {
		return memberNum;
	}

	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}

	public int getAdminNum() {
		return adminNum;
	}

	public void setAdminNum(int adminNum) {
		this.adminNum = adminNum;
	}

	public String getQnaTitle() {
		return qnaTitle;
	}

	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}

	public String getQnaContent() {
		return qnaContent;
	}

	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}

	public Date getQnaWriteDate() {
		return qnaWriteDate;
	}

	public void setQnaWriteDate(Date qnaWriteDate) {
		this.qnaWriteDate = qnaWriteDate;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getRef_level() {
		return ref_level;
	}

	public void setRef_level(int ref_level) {
		this.ref_level = ref_level;
	}

	public int getRef_step() {
		return ref_step;
	}

	public void setRef_step(int ref_step) {
		this.ref_step = ref_step;
	}

	public int getQnaWritePwd() {
		return qnaWritePwd;
	}

	public void setQnaWritePwd(int qnaWritePwd) {
		this.qnaWritePwd = qnaWritePwd;
	}

}
