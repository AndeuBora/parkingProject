package com.parking.qnaBoard.vo;

public class AdminQnaReplyVO {
	private int qnaNum = 0; // qna 글 번호
	private int replyNum = 0; // 댓글 번호
	private String adminId = ""; // 관리자 아이디
	private String replyContent = ""; // 댓글 내용
	private String replyWriteDate = ""; // 댓글 등록일
	private String replyDeleteFrag = ""; // 댓글 삭제여부

	public AdminQnaReplyVO() {
		super();
	}

	public AdminQnaReplyVO(int qnaNum, int replyNum, String adminId, String replyContent, String replyWriteDate,
			String replyDeleteFrag) {
		super();
		this.qnaNum = qnaNum;
		this.replyNum = replyNum;
		this.adminId = adminId;
		this.replyContent = replyContent;
		this.replyWriteDate = replyWriteDate;
		this.replyDeleteFrag = replyDeleteFrag;
	}

	public int getQnaNum() {
		return qnaNum;
	}

	public void setQnaNum(int qnaNum) {
		this.qnaNum = qnaNum;
	}

	public int getReplyNum() {
		return replyNum;
	}

	public void setReplyNum(int replyNum) {
		this.replyNum = replyNum;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public String getReplyWriteDate() {
		return replyWriteDate;
	}

	public void setReplyWriteDate(String replyWriteDate) {
		this.replyWriteDate = replyWriteDate;
	}

	public String getReplyDeleteFrag() {
		return replyDeleteFrag;
	}

	public void setReplyDeleteFrag(String replyDeleteFrag) {
		this.replyDeleteFrag = replyDeleteFrag;
	}

}