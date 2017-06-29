package com.parking.booking.service;

import java.util.List;

import com.parking.booking.vo.BookingVO;

public interface BookingService {
	// 예약목록조회
	public List<BookingVO> selectBookingList(BookingVO vo);

	// 예약목록 전체레코드건수
	public int selectBookingListCnt(BookingVO vo);

	// 예약목록에 들어갈 회원정보
	public List<BookingVO> selectMemberInfo(BookingVO vo);
}
