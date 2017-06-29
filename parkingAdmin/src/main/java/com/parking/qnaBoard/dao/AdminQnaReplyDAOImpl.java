package com.parking.qnaBoard.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.parking.qnaBoard.vo.AdminQnaReplyVO;

@Repository
public class AdminQnaReplyDAOImpl implements AdminQnaReplyDAO {

	@Autowired
	private SqlSession sqlSession;

	private static final String namespace = "adminQnaReply";

	/* 댓글 목록 구현 */
	@Override
	public List<AdminQnaReplyVO> adminQnaReplyList(Integer qnaNum) {
		return sqlSession.selectList(namespace + ".adminQnaReplyList", qnaNum);
	}

	/* 댓글 입력 구현 */
	@Override
	public int adminQnaReplyInsert(AdminQnaReplyVO aqvo) {
		return sqlSession.insert(namespace + ".adminQnaReplyInsert", aqvo);
	}

	/* 댓글 수정 구현 */
	@Override
	public int adminQnaReplyUpdate(AdminQnaReplyVO aqvo) {
		return sqlSession.update(namespace + ".adminQnaReplyUpdate", aqvo);
	}

	/* 댓글 삭제 구현 */
	@Override
	public int adminQnaReplyDelete(int replyNum) {
		return sqlSession.delete(namespace + ".adminQnaReplyDelete", replyNum);
	}

}
