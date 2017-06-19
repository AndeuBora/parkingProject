package com.parking.qnaBoard.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.parking.qnaBoard.dao.QnaBoardDAO;
import com.parking.qnaBoard.vo.QnaBoardVO;

@Service
@Transactional
public class QnaBoardServiceImpl implements QnaBoardService {

	@Autowired
	private QnaBoardDAO qnaBoardDAO;

	/* qna 게시판 글 리스트 구현 */
	public List<QnaBoardVO> qnaBoardList(QnaBoardVO qvo) {
		List<QnaBoardVO> qnaList = new ArrayList<QnaBoardVO>();
		qnaList = qnaBoardDAO.qnaBoardList(qvo);

		return qnaList;
	}

	/* 전체 레코드 수 구현 */
	@Override
	public int qnaBoardCnt(QnaBoardVO qvo) {
		return qnaBoardDAO.qnaBoardCnt(qvo);
	}

	/* qna 글 등록 구현 */
	@Override
	public int qnaBoardInsert(QnaBoardVO qvo) {
		int result = 0;
		result = qnaBoardDAO.qnaBoardInsert(qvo);
		return result;
	}

	/* qna 글 상세보기 구현 */

	@Override
	public QnaBoardVO qnaBoardDetail(QnaBoardVO qvo) {
		QnaBoardVO detail = null;
		detail = qnaBoardDAO.qnaBoardDetail(qvo);
		return detail;
	}

	/* qna 글 비밀번호 확인 구현 */
	@Override
	public int pwdConfirm(QnaBoardVO qvo) {
		int result = 0;
		result = qnaBoardDAO.pwdConfirm(qvo);
		return result;
	}

	/* qna 글 삭제하기 구현 */

	@Override
	public int qnaBoardDelete(int qnaNum) {
		int result = 0;
		result = qnaBoardDAO.qnaBoardDelete(qnaNum);
		return result;
	}

}
