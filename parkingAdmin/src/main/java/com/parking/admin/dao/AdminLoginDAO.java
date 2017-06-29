package com.parking.admin.dao;

import com.parking.admin.vo.AdminVO;

public interface AdminLoginDAO {
	public String getAdminPwd(AdminVO adminVo);

	public AdminVO getAdminData(AdminVO adminVo);

}
