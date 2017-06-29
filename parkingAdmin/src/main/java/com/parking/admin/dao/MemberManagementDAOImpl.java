package com.parking.admin.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.parking.admin.vo.MemberVO;

@Repository
public class MemberManagementDAOImpl implements MemberManagementDAO {

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<MemberVO> memberList(MemberVO memberVo) {
		
		return sqlSession.selectList("memberList", memberVo);
	}
	//전체 레코드 건수 구현
	@Override
	public int memberListCnt(MemberVO memberVo) {
		
		return sqlSession.selectOne("memberListCnt",memberVo);
	}
}
