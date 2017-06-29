package com.parking.member.paging;

import com.parking.admin.vo.MemberVO;

public class PagingMember {
	public static void set(MemberVO memberVo) {

		// 한페이지
		int page = UtilMember.nvl(memberVo.getPage(), 1);
		// 페이지 사이즈 20개씩
		int pageSize = UtilMember.nvl(memberVo.getPageSize(), 20);

		//현재 페이지 번호 값이 없으면 1로 초기화
		if (memberVo.getPage() == null) {
			memberVo.setPage(page + "");

		}
		//한페이지에 보여줄 사이즈 지정하지 않으면 기본값은 20개
		if (memberVo.getPageSize() == null) {
			memberVo.setPageSize(pageSize + "");
		}

		//페이지 사이즈 20 현재 페이지 1일때 첫번째 행의 숫자는 1
		int startRow = (page - 1) * pageSize + 1;
		//페이지  사이즈 20 현재 페이지 1일때 마지막 행의 숫자는 20
		int endRow = (page - 1) * pageSize + pageSize;

		//vo에 초기화값 저장
		memberVo.setStart_memberRow(startRow + "");
		memberVo.setEnd_memberRow(endRow + "");

	}
}
