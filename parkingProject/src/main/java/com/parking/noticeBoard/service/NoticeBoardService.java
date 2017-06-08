package com.parking.noticeBoard.service;

import java.util.List;

import com.parking.noticeBoard.vo.NoticeBoardVO;

public interface NoticeBoardService {
	public List<NoticeBoardVO> noticeBoardList(NoticeBoardVO nvo);
}
