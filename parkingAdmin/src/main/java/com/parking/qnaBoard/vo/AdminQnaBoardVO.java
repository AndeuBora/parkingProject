package com.parking.qnaBoard.vo;

import com.parking.board.paging.PagingVO;

public class AdminQnaBoardVO extends PagingVO {
	private int qnaNum = 0; // qna 글 번호
	private int replyNum = 0; // 댓글 번호
	private String qnaTitle = ""; // qna 글 제목
	private String qnaContent = ""; // qna 글 내용
	private String qnaWriteDate = ""; // qna 글 작성일
	private String memberId = ""; // 회원 아이디

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

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

}
