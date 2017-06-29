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
	public List<BookingVO> selectBookingList(BookingVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE + ".selectBookingList", vo);
	}

	@Override
	public int selectBookingListCnt(BookingVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE + ".selectBookingListCnt", vo);
	}

	@Override
	public List<BookingVO> selectMemberInfo(BookingVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE + ".selectMemberInfo", vo);
	}

}
