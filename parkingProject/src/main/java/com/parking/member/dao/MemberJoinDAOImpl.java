package com.parking.member.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.parking.member.vo.MemberVO;

@Repository
public class MemberJoinDAOImpl implements MemberJoinDAO {

	@Inject
	private SqlSession sqlSession;

	@Override
	public int insertMember(MemberVO param) {

		return sqlSession.insert("insertMember", param);
	}

	@Override
	public int idCheck(MemberVO memberVo) {
		// TODO Auto-generated method stub
		int result = 0;

		result=sqlSession.selectOne("idCheck", memberVo);
		return result;
	}
}
