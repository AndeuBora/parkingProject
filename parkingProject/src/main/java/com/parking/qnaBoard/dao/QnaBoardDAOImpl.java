package com.parking.qnaBoard.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
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

	/* 전체 레코드 건수 구현 */
	@Override
	public int qnaBoardCnt(QnaBoardVO qvo) {
		return sqlSession.selectOne(namespace + ".qnaBoardCnt", qvo);
	}

	/* qna 글 등록 구현 */
	@Override
	public int qnaBoardInsert(QnaBoardVO qvo) {
		return sqlSession.insert(namespace + ".qnaBoardInsert", qvo);
	}

	/* qna 글 상세보기 구현 */
	@Override
	public QnaBoardVO qnaBoardDetail(QnaBoardVO qvo) {
		return sqlSession.selectOne(namespace + ".qnaBoardDetail", qvo);
	}

	/* qna 글 비밀번호 확인 구현 */
	@Override
	public int pwdConfirm(QnaBoardVO qvo) {
		return sqlSession.selectOne(namespace + ".pwdConfirm", qvo);
	}

	/* qna 글 삭제하기 구현 */
	@Override
	public int qnaBoardDelete(int qnaNum) {
		return sqlSession.delete(namespace + ".qnaBoardDelete", qnaNum);
	}

}
