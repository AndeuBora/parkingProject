package com.parking.qnaBoard.service;

import java.util.List;

import com.parking.qnaBoard.vo.AdminQnaBoardVO;

public interface AdminQnaBoardService {
	public List<AdminQnaBoardVO> adminQnaBoardList(AdminQnaBoardVO aqvo);

	public int adminQnaBoardCnt(AdminQnaBoardVO aqvo);

	public AdminQnaBoardVO adminQnaBoardDetail(AdminQnaBoardVO aqvo);
}
