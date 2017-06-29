package com.parking.noticeBoard.service;

import java.util.List;

import com.parking.noticeBoard.vo.AdminNoticeBoardVO;

public interface AdminNoticeBoardService {
	public List<AdminNoticeBoardVO> adminNoticeBoardList(AdminNoticeBoardVO avo);

	public int adminNoticeBoardCnt(AdminNoticeBoardVO avo);

	public int adminNoticeBoardInsert(AdminNoticeBoardVO avo);

	public AdminNoticeBoardVO adminNoticeBoardDetail(AdminNoticeBoardVO avo);

	public int adminNoticeBoardDelete(int noticeNum);

	public int adminNoticeBoardUpdate(AdminNoticeBoardVO avo);
}
