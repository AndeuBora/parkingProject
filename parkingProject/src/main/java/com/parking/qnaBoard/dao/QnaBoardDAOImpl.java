package com.parking.qnaBoard.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.parking.qnaBoard.vo.QnaBoardVO;

@Repository
public class QnaBoardDAOImpl implements QnaBoardDAO {

	@Inject
	private SqlSession sqlSession;
	private static String namespace = "com.parking.qnaBoard.dao.QnaBoardDAO";

	/* qna 글 등록 구현 */
	@Override
	public int qnaBoardInsert(QnaBoardVO qvo) {
		return sqlSession.insert(namespace + ".qnaBoardWrite", qvo);
	}
}
