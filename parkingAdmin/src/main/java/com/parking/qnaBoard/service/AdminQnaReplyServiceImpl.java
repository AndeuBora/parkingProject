package com.parking.qnaBoard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.parking.qnaBoard.dao.AdminQnaReplyDAO;
import com.parking.qnaBoard.vo.AdminQnaReplyVO;

@Service
@Transactional
public class AdminQnaReplyServiceImpl implements AdminQnaReplyService {

	@Autowired
	private AdminQnaReplyDAO adminQnaReplyDAO;

	/* 댓글 목록 구현 */
	@Override
	public List<AdminQnaReplyVO> adminQnaReplyList(Integer qnaNum) {
		List<AdminQnaReplyVO> myList = null;
		myList = adminQnaReplyDAO.adminQnaReplyList(qnaNum);
		return myList;
	}

	/* 댓글 입력 구현 */
	@Override
	public int adminQnaReplyInsert(AdminQnaReplyVO aqvo) {
		int result = 0;
		result = adminQnaReplyDAO.adminQnaReplyInsert(aqvo);
		return result;
	}

	/* 댓글 수정 구현 */
	@Override
	public int adminQnaReplyUpdate(AdminQnaReplyVO aqvo) {
		int result = 0;
		result = adminQnaReplyDAO.adminQnaReplyUpdate(aqvo);
		return result;
	}

	/* 댓글 삭제 구현 */
	@Override
	public int adminQnaReplyDelete(int replyNum) {
		int result = 0;
		result = adminQnaReplyDAO.adminQnaReplyDelete(replyNum);
		return result;
	}
}
