package com.parking.noticeBoard.vo;

import com.parking.board.paging.PagingVO;

public class AdminNoticeBoardVO extends PagingVO {
	private int noticeNum = 0;
	private String noticeTitle = "";
	private String noticeContent = "";
	private String noticeWriteDate = "";
	private String adminId = "";

	public AdminNoticeBoardVO() {
		super();
	}

	public AdminNoticeBoardVO(int noticeNum, String noticeTitle, String noticeContent, String noticeWriteDate,
			String adminId) {
		super();
		this.noticeNum = noticeNum;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeWriteDate = noticeWriteDate;
		this.adminId = adminId;
	}

	public int getNoticeNum() {
		return noticeNum;
	}

	public void setNoticeNum(int noticeNum) {
		this.noticeNum = noticeNum;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public String getNoticeWriteDate() {
		return noticeWriteDate;
	}

	public void setNoticeWriteDate(String noticeWriteDate) {
		this.noticeWriteDate = noticeWriteDate;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

}
