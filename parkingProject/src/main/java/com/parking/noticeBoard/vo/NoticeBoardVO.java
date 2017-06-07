package com.parking.noticeBoard.vo;

import java.util.Date;

public class NoticeBoardVO {
	private int noticeNum;
	private int adminNum;
	private String noticeTitle;
	private String noticeContent;
	private Date noticeWriteDate;
	private int noticeCount;

	public NoticeBoardVO() {
		super();
	}

	public NoticeBoardVO(int noticeNum, int adminNum, String noticeTitle, String noticeContent, Date noticeWriteDate,
			int noticeCount) {
		super();
		this.noticeNum = noticeNum;
		this.adminNum = adminNum;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeWriteDate = noticeWriteDate;
		this.noticeCount = noticeCount;
	}

	public int getNoticeNum() {
		return noticeNum;
	}

	public void setNoticeNum(int noticeNum) {
		this.noticeNum = noticeNum;
	}

	public int getAdminNum() {
		return adminNum;
	}

	public void setAdminNum(int adminNum) {
		this.adminNum = adminNum;
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

	public Date getNoticeWriteDate() {
		return noticeWriteDate;
	}

	public void setNoticeWriteDate(Date noticeWriteDate) {
		this.noticeWriteDate = noticeWriteDate;
	}

	public int getNoticeCount() {
		return noticeCount;
	}

	public void setNoticeCount(int noticeCount) {
		this.noticeCount = noticeCount;
	}

}
