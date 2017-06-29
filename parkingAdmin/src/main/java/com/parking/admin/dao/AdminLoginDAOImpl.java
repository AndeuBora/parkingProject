package com.parking.admin.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.parking.admin.vo.AdminVO;

@Repository
public class AdminLoginDAOImpl implements AdminLoginDAO {

	@Inject
	SqlSession sqlSession;

	@Override
	public String getAdminPwd(AdminVO adminVo) {
		String result=sqlSession.selectOne("getAdminPwd", adminVo);
		return result;
	}

	@Override
	public AdminVO getAdminData(AdminVO adminVo) {
		
		return sqlSession.selectOne("getAdminData", adminVo);
	}
}
