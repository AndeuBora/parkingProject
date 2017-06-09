package com.parking.noticeBoard.dao;

import java.util.List;

import com.parking.noticeBoard.vo.NoticeBoardVO;

public interface NoticeBoardDAO {
	public List<NoticeBoardVO> noticeBoardList(NoticeBoardVO nvo);
}
