package com.parking.admin.service;

import com.parking.admin.vo.AdminVO;


public interface AdminLoginService {
	public String getAdminPwd(AdminVO adminVo);

	public AdminVO getAdminData(AdminVO adminVo);

}
