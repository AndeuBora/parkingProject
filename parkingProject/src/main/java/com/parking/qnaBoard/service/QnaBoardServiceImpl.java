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

	/* qna 글 등록 구현 */

	@Override
	public int qnaBoardInsert(QnaBoardVO qvo) {
		int result = 0;
		result = qnaBoardDAO.qnaBoardInsert(qvo);
		return result;
	}

}
