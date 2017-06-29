package com.parking.qnaBoard.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.parking.qnaBoard.vo.AdminQnaBoardVO;

@Repository
public class AdminQnaBoardDAOImpl implements AdminQnaBoardDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "adminQnaBoard";

	/* qna 게시판 글 리스트 구현 */
	@Override
	public List<AdminQnaBoardVO> adminQnaBoardList(AdminQnaBoardVO aqvo) {
		return sqlSession.selectList(namespace + ".adminQnaBoardList", aqvo);
	}

	/* 전체 레코드 건수 구현 */
	@Override
	public int adminQnaBoardCnt(AdminQnaBoardVO aqvo) {
		return sqlSession.selectOne(namespace + ".adminQnaBoardCnt", aqvo);
	}

	/* qna 글 상세보기 구현 */
	@Override
	public AdminQnaBoardVO adminQnaBoardDetail(AdminQnaBoardVO aqvo) {
		return sqlSession.selectOne(namespace + ".adminQnaBoardDetail", aqvo);
	}

}
