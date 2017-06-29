package com.parking.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.parking.admin.dao.AdminLoginDAO;
import com.parking.admin.vo.AdminVO;

@Service
public class AdminLoginServiceImpl implements AdminLoginService {

	@Autowired
	AdminLoginDAO adminLoginDao;
	
	@Override
	public String getAdminPwd(AdminVO adminVo) {
		
		return adminLoginDao.getAdminPwd(adminVo);
	}

	@Override
	public AdminVO getAdminData(AdminVO adminVo) {
		
		return adminLoginDao.getAdminData(adminVo);
	}
}
