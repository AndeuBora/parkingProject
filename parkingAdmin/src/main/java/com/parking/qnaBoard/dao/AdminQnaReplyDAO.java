package com.parking.qnaBoard.dao;

import java.util.List;

import com.parking.qnaBoard.vo.AdminQnaReplyVO;

public interface AdminQnaReplyDAO {
	public List<AdminQnaReplyVO> adminQnaReplyList(Integer qnaNum);

	public int adminQnaReplyInsert(AdminQnaReplyVO aqvo);

	public int adminQnaReplyUpdate(AdminQnaReplyVO aqvo);

	public int adminQnaReplyDelete(int replyNum);
}
