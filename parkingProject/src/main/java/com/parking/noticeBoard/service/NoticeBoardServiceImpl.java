package com.parking.noticeBoard.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.parking.noticeBoard.dao.NoticeBoardDAO;
import com.parking.noticeBoard.vo.NoticeBoardVO;

@Service
@Transactional
public class NoticeBoardServiceImpl implements NoticeBoardService {

	@Autowired
	private NoticeBoardDAO noticeBoardDAO;

	/* 공지사항 글 목록 구현 */
	@Override
	public List<NoticeBoardVO> noticeBoardList(NoticeBoardVO nvo) {
		List<NoticeBoardVO> noticeBoardList = new ArrayList<NoticeBoardVO>();
		noticeBoardList = noticeBoardDAO.noticeBoardList(nvo);
		return noticeBoardList;
	}
}
