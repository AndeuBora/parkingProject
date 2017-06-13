package com.parking.qnaBoard.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.parking.qnaBoard.vo.QnaBoardVO;

@Repository
public class QnaBoardDAOImpl implements QnaBoardDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "qnaBoard";

	/* qna 게시판 글 리스트 구현 */
	@Override
	public List<QnaBoardVO> qnaBoardList(QnaBoardVO qvo) {
		return sqlSession.selectList(namespace + ".qnaBoardList", qvo);
	}

	/* qna 글 등록 구현 */
	@Override
	public int qnaBoardInsert(QnaBoardVO qvo) {
		return sqlSession.insert(namespace + ".qnaBoardInsert", qvo);
	}

}
