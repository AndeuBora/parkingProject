package com.parking.qnaBoard.service;

import java.util.List;

import com.parking.qnaBoard.vo.QnaBoardVO;

public interface QnaBoardService {
	public List<QnaBoardVO> qnaBoardList(QnaBoardVO qvo);

	public int qnaBoardInsert(QnaBoardVO qvo);
}
