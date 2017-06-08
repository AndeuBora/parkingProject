package com.parking.qnaBoard.service;

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

	/* qna 글 등록 구현 */
	@Override
	public int qnaBoardInsert(QnaBoardVO qvo) {
		int result = 0;
		result = qnaBoardDAO.qnaBoardInsert(qvo);
		return result;
	}
}
