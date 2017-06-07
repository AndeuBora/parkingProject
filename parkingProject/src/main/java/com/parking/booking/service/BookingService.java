package com.parking.booking.service;

import java.util.List;

import com.parking.booking.vo.BookingVO;

public interface BookingService {
	// 예약날짜자리조회
	public List<BookingVO> selectBookingSpot(BookingVO vo);
}
