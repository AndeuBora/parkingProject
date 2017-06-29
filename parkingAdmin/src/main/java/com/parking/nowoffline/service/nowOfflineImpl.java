package com.parking.nowoffline.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.parking.booking.vo.BookingVO;
import com.parking.nowoffline.dao.nowOfflineDAO;
import com.parking.nowoffline.vo.NowOfflineVO;

@Service // 서비스 아노테이션
@Transactional // 여러로직 묶음
public class nowOfflineImpl implements nowOfflineService {

	@Autowired
	private nowOfflineDAO dao;

	@Override
	public List<BookingVO> selectBookingSpot(BookingVO vo) {
		// TODO Auto-generated method stub
		return dao.selectBookingSpot(vo);
	}

	@Override
	public int updatePenalty(BookingVO vo) {
		// TODO Auto-generated method stub
		return dao.updatePenalty(vo);
	}

	@Override
	public int updateBooking(BookingVO vo) {
		// TODO Auto-generated method stub
		return dao.updateBooking(vo);
	}

	@Override
	public int insertOffline(NowOfflineVO vo) {
		// TODO Auto-generated method stub
		return dao.insertOffline(vo);
	}

	@Override
	public List<NowOfflineVO> selectOfflineSpot(NowOfflineVO vo) {
		// TODO Auto-generated method stub
		return dao.selectOfflineSpot(vo);
	}

	@Override
	public int updateOfflineOut(NowOfflineVO vo) {
		// TODO Auto-generated method stub
		return dao.updateOfflineOut(vo);
	}

	@Override
	public int insertPaymentOut(NowOfflineVO vo) {
		// TODO Auto-generated method stub
		return dao.insertPaymentOut(vo);
	}

	@Override
	public int deleteOffline(NowOfflineVO vo) {
		// TODO Auto-generated method stub
		return dao.deleteOffline(vo);
	}

	@Override
	public int selectBookingSpotCount(NowOfflineVO vo) {
		// TODO Auto-generated method stub
		return dao.selectBookingSpotCount(vo);
	}

	@Override
	public int selectOfflineSpotCount(NowOfflineVO vo) {
		// TODO Auto-generated method stub
		return dao.selectOfflineSpotCount(vo);
	}

	@Override
	public int updateOfflineEnd(NowOfflineVO vo) {
		// TODO Auto-generated method stub
		return dao.updateOfflineEnd(vo);
	}

}
