package com.parking.qnaBoard.dao;

import java.util.List;

import com.parking.qnaBoard.vo.AdminQnaBoardVO;

public interface AdminQnaBoardDAO {
	public List<AdminQnaBoardVO> adminQnaBoardList(AdminQnaBoardVO aqvo);

	public int adminQnaBoardCnt(AdminQnaBoardVO aqvo);

	public AdminQnaBoardVO adminQnaBoardDetail(AdminQnaBoardVO qvo);
}
