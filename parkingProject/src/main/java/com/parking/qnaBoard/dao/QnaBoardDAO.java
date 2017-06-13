package com.parking.qnaBoard.dao;

import java.util.List;

import com.parking.qnaBoard.vo.QnaBoardVO;

public interface QnaBoardDAO {
	public List<QnaBoardVO> qnaBoardList(QnaBoardVO qvo);

	public int qnaBoardInsert(QnaBoardVO qvo);
}
