package com.parking.booking.service;

import java.util.List;

import com.parking.booking.vo.BookingVO;

public interface BookingService {
	// 예약날짜자리조회
	public List<BookingVO> selectBookingSpot(BookingVO vo);

	// 예약추가
	public int insertBooking(BookingVO vo);

	// 나의예약조회
	public List<BookingVO> selectMyBookingList(BookingVO vo);

	// 전체레코드건수
	public int selectmyBookingListCnt(BookingVO vo);

}
