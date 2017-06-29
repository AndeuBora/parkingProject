package com.parking.noticeBoard.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.parking.noticeBoard.vo.AdminNoticeBoardVO;

@Repository
public class AdminNoticeBoardDAOImpl implements AdminNoticeBoardDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "adminNoticeBoard";

	/* 공지사항 게시판 글 리스트 구현 */
	@Override
	public List<AdminNoticeBoardVO> adminNoticeBoardList(AdminNoticeBoardVO avo) {
		return sqlSession.selectList(namespace + ".adminNoticeBoardList", avo);
	}

	/* 전체 레코드 건수 구현 */
	@Override
	public int adminNoticeBoardCnt(AdminNoticeBoardVO avo) {
		return sqlSession.selectOne(namespace + ".adminNoticeBoardCnt", avo);
	}

	/* 공지사항 게시판 글 등록 구현 */
	@Override
	public int adminNoticeBoardInsert(AdminNoticeBoardVO avo) {
		return sqlSession.insert(namespace + ".adminNoticeBoardInsert", avo);
	}

	/* 공지사항 게시판 글 상세보기 구현 */
	@Override
	public AdminNoticeBoardVO adminNoticeBoardDetail(AdminNoticeBoardVO avo) {
		return sqlSession.selectOne(namespace + ".adminNoticeBoardDetail", avo);
	}

	/* 공지사항 게시판 글 삭제하기 구현 */
	@Override
	public int adminNoticeBoardDelete(int noticeNum) {
		return sqlSession.delete(namespace + ".adminNoticeBoardDelete", noticeNum);
	}

	/* 공지사항 게시판 글 수정하기 구현 */
	@Override
	public int adminNoticeBoardUpdate(AdminNoticeBoardVO avo) {
		return sqlSession.update(namespace + ".adminNoticeBoardUpdate", avo);
	}
}
