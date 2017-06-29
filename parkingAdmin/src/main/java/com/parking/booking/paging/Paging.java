package com.parking.booking.paging;

import com.parking.booking.vo.BookingVO;

public class Paging {
	// 페이징 처리를 위해 기본필드에 대해 초기값설정
	public static void set(BookingVO vo) {
		int page = Util.nvl(vo.getPage(), 1); // 몇번째 페이지
		int pageSize = Util.nvl(vo.getPageSize(), 10); // 10개씩보기

		//문자열로설정
		if (vo.getPage() == null) {
			vo.setPage(page + "");
		}
		if (vo.getPageSize() == null) {
			vo.setPageSize(pageSize + "");
		}
		
		int startRow = (page-1)*pageSize+1; //시작 행번호
		int endRow = (page-1)*pageSize+pageSize; //마지막 행번호
		
		//문자열로 설정
		vo.setStartRow(startRow+"");
		vo.setEndRow(endRow+"");
	}

}
