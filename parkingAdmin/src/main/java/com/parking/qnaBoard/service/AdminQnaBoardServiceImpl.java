package com.parking.qnaBoard.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.parking.qnaBoard.dao.AdminQnaBoardDAO;
import com.parking.qnaBoard.vo.AdminQnaBoardVO;

@Service
@Transactional
public class AdminQnaBoardServiceImpl implements AdminQnaBoardService {

	@Autowired
	private AdminQnaBoardDAO adminQnaBoardDAO;

	/* qna 게시판 글 리스트 구현 */
	public List<AdminQnaBoardVO> adminQnaBoardList(AdminQnaBoardVO aqvo) {
		List<AdminQnaBoardVO> adminQnaBoardList = new ArrayList<AdminQnaBoardVO>();
		adminQnaBoardList = adminQnaBoardDAO.adminQnaBoardList(aqvo);

		return adminQnaBoardList;
	}

	/* 전체 레코드 수 구현 */
	@Override
	public int adminQnaBoardCnt(AdminQnaBoardVO aqvo) {
		return adminQnaBoardDAO.adminQnaBoardCnt(aqvo);
	}

	/* qna 글 상세보기 구현 */
	@Override
	public AdminQnaBoardVO adminQnaBoardDetail(AdminQnaBoardVO qvo) {
		AdminQnaBoardVO detail = null;
		detail = adminQnaBoardDAO.adminQnaBoardDetail(qvo);
		return detail;
	}

}
