package com.parking.nowoffline.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.parking.booking.vo.BookingVO;
import com.parking.nowoffline.vo.NowOfflineVO;

@Repository // DAO구분 아노테이션
public class nowOfflineDAOImpl implements nowOfflineDAO {
	@Inject
	private SqlSession sqlSession; // sql의존성주입
	private static final String NAMESPACE = "nowOffline";

	@Override
	public List<BookingVO> selectBookingSpot(BookingVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE + ".selectBookingSpot", vo);
	}

	@Override
	public int updatePenalty(BookingVO vo) {
		return sqlSession.update(NAMESPACE + ".updatePenalty", vo);
	}

	@Override
	public int updateBooking(BookingVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.update(NAMESPACE + ".updateBooking", vo);
	}

	@Override
	public int insertOffline(NowOfflineVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE + ".insertOffline", vo);
	}

	@Override
	public List<NowOfflineVO> selectOfflineSpot(NowOfflineVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE + ".selectOfflineSpot", vo);
	}

	@Override
	public int updateOfflineOut(NowOfflineVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.update(NAMESPACE + ".updateOfflineOut", vo);
	}

	@Override
	public int insertPaymentOut(NowOfflineVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE + ".insertPaymentOut", vo);
	}

	@Override
	public int deleteOffline(NowOfflineVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.delete(NAMESPACE + ".deleteOffline", vo);
	}

	@Override
	public int selectBookingSpotCount(NowOfflineVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE + ".selectBookingSpotCount", vo);
	}

	@Override
	public int selectOfflineSpotCount(NowOfflineVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE + ".selectOfflineSpotCount", vo);
	}

	@Override
	public int updateOfflineEnd(NowOfflineVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.update(NAMESPACE + ".updateOfflineEnd", vo);
	}
}
