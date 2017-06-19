package com.parking.qnaBoard.vo;

public class QnaBoardVO extends PagingVO {
	private int qnaNum = 0; // qna 글 번호
	private String qnaTitle = ""; // qna 글 제목
	private String qnaContent = ""; // qna 글 내용
	private String qnaWriteDate = ""; // qna 글 작성일
	private int qnaWritePwd = 0; // qna 글 비밀번호
	private String memberId = ""; // 회원 아이디

	public int getQnaNum() {
		return qnaNum;
	}

	public void setQnaNum(int qnaNum) {
		this.qnaNum = qnaNum;
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

	public String getQnaWriteDate() {
		return qnaWriteDate;
	}

	public void setQnaWriteDate(String qnaWriteDate) {
		this.qnaWriteDate = qnaWriteDate;
	}

	public int getQnaWritePwd() {
		return qnaWritePwd;
	}

	public void setQnaWritePwd(int qnaWritePwd) {
		this.qnaWritePwd = qnaWritePwd;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

}
