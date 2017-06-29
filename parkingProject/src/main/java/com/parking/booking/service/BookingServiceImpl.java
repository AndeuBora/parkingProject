package com.parking.booking.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.parking.booking.dao.BookingDAO;
import com.parking.booking.vo.BookingVO;

@Service // 서비스 아노테이션
@Transactional // 여러로직 묶음
public class BookingServiceImpl implements BookingService {

	Logger logger = Logger.getLogger(BookingServiceImpl.class);
	@Autowired
	private BookingDAO dao;

	@Override
	public List<BookingVO> selectBookingSpot(BookingVO vo) {
		// 예약자리조회
		return dao.selectBookingSpot(vo);
	}

	@Override
	public int insertBooking(BookingVO vo) {
		// 예약추가
		return dao.insertBooking(vo);
	}

	@Override
	public List<BookingVO> selectMyBookingList(BookingVO vo) {
		// 나의예약목록
		return dao.selectMyBookingList(vo);
	}

	@Override
	public int selectmyBookingListCnt(BookingVO vo) {
		// 나의예약건수
		return dao.selectmyBookingListCnt(vo);
	}

}
