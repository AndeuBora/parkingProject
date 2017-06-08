package com.parking.noticeBoard.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.parking.noticeBoard.vo.NoticeBoardVO;

@Repository
public class NoticeBoardDAOImpl implements NoticeBoardDAO {

	@Inject
	private SqlSession sqlSession;
	private static String namespace = "com.parking.noticeBoard.dao.NoticeBoardDAO";

	/* 공지사항 글 목록 구현 */
	@Override
	public List<NoticeBoardVO> noticeBoardList(NoticeBoardVO nvo) {
		return sqlSession.selectList(namespace+".noticeBoardList", nvo);
	}
}
