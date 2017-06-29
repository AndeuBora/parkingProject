package com.parking.member.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.parking.member.vo.MemberVO;

@Repository
public class MemberLoginDAOImpl implements MemberLoginDAO {
	
	@Inject
	private SqlSession sqlSession;
	
@Override
public String getPwd(MemberVO param) {
	// TODO Auto-generated method stub
 String	result=sqlSession.selectOne("getPwd", param);
	
	return  result;
}

@Override
public MemberVO memberData(MemberVO param) {
	// TODO Auto-generated method stub
	return sqlSession.selectOne("memberData",param);
}
}
