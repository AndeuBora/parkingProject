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
	public List<BookingVO> selectBookingList(BookingVO vo) {
		// TODO Auto-generated method stub
		return dao.selectBookingList(vo);
	}

	@Override
	public int selectBookingListCnt(BookingVO vo) {
		// TODO Auto-generated method stub
		return dao.selectBookingListCnt(vo);
	}

	@Override
	public List<BookingVO> selectMemberInfo(BookingVO vo) {
		// TODO Auto-generated method stub
		return dao.selectMemberInfo(vo);
	}

}
