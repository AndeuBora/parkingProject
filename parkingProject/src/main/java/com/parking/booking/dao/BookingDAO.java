package com.parking.booking.dao;

import java.util.List;

import com.parking.booking.vo.BookingVO;

public interface BookingDAO {
	// 예약날짜자리조회
	public List<BookingVO> selectBookingSpot(BookingVO vo);
}
