package com.parking.qnaBoard.vo;

public class QnaBoardVO {
	private int qnaNum = 0; // qna 글 번호
	private String qnaTitle = ""; // qna 글 제목
	private String qnaContent = ""; // qna 글 내용
	private String qnaWriteDate = ""; // qna 글 작성일
	private String qnaWriter = ""; // qna 글 작성자
	private int qnaWritePwd = 0; // qna 글 비밀번호

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

	public String getQnaWriter() {
		return qnaWriter;
	}

	public void setQnaWriter(String qnaWriter) {
		this.qnaWriter = qnaWriter;
	}

	public int getQnaWritePwd() {
		return qnaWritePwd;
	}

	public void setQnaWritePwd(int qnaWritePwd) {
		this.qnaWritePwd = qnaWritePwd;
	}

}
