package com.parking.noticeBoard.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.parking.noticeBoard.dao.AdminNoticeBoardDAO;
import com.parking.noticeBoard.vo.AdminNoticeBoardVO;

@Service
@Transactional
public class AdminNoticeBoardServiceImpl implements AdminNoticeBoardService {

	@Autowired
	private AdminNoticeBoardDAO adminNoticeBoardDAO;

	/* 공지사항 게시판 글 리스트 구현 */
	public List<AdminNoticeBoardVO> adminNoticeBoardList(AdminNoticeBoardVO avo) {
		List<AdminNoticeBoardVO> adminNoticeBoardList = new ArrayList<AdminNoticeBoardVO>();
		adminNoticeBoardList = adminNoticeBoardDAO.adminNoticeBoardList(avo);

		return adminNoticeBoardList;
	}

	/* 전체 레코드 수 구현 */
	@Override
	public int adminNoticeBoardCnt(AdminNoticeBoardVO avo) {
		return adminNoticeBoardDAO.adminNoticeBoardCnt(avo);
	}

	/* 공지사항 글 등록 구현 */
	@Override
	public int adminNoticeBoardInsert(AdminNoticeBoardVO avo) {
		int result = 0;
		result = adminNoticeBoardDAO.adminNoticeBoardInsert(avo);
		return result;
	}

	/* 공지사항 글 상세보기 구현 */
	@Override
	public AdminNoticeBoardVO adminNoticeBoardDetail(AdminNoticeBoardVO avo) {
		AdminNoticeBoardVO detail = null;
		detail = adminNoticeBoardDAO.adminNoticeBoardDetail(avo);
		return detail;
	}

	/* 공지사항 글 삭제하기 구현 */
	@Override
	public int adminNoticeBoardDelete(int noticeNum) {
		int result = 0;
		result = adminNoticeBoardDAO.adminNoticeBoardDelete(noticeNum);
		return result;
	}

	/* 공지사항 글 수정하기 구현 */
	public int adminNoticeBoardUpdate(AdminNoticeBoardVO avo) {
		int result = 0;
		result = adminNoticeBoardDAO.adminNoticeBoardUpdate(avo);
		return result;
	}
}
