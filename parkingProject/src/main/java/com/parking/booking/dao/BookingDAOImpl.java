package com.parking.booking.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.parking.booking.vo.BookingVO;

@Repository // DAO구분 아노테이션
public class BookingDAOImpl implements BookingDAO {

	@Inject
	private SqlSession sqlSession; // sql의존성주입
	private static final String NAMESPACE = "BookingMapper";

	@Override
	public List<BookingVO> selectBookingSpot(BookingVO vo) {
		// 예약날짜자리조회
		return sqlSession.selectList(NAMESPACE + ".selectBookingSpot", vo);
	}

	@Override
	public int insertBooking(BookingVO vo) {
		// 예약추가
		return sqlSession.insert(NAMESPACE + ".insertBooking", vo);
	}

	@Override
	public List<BookingVO> selectMyBookingList(BookingVO vo) {
		// 나의예약조회
		return sqlSession.selectList(NAMESPACE + ".selectMyBookingList", vo);
	}

	@Override
	public int selectmyBookingListCnt(BookingVO vo) {
		// 나의예약 전체건수
		return sqlSession.selectOne(NAMESPACE+".selectmyBookingListCnt", vo);
	}

}
