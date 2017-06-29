package com.parking.nowoffline.service;

import java.util.List;

import com.parking.booking.vo.BookingVO;
import com.parking.nowoffline.vo.NowOfflineVO;

public interface nowOfflineService {
	// 예약자리조회
	public List<BookingVO> selectBookingSpot(BookingVO vo);

	// 패널티추가
	public int updatePenalty(BookingVO vo);

	// 예약입차확인
	public int updateBooking(BookingVO vo);

	// 현장추가
	public int insertOffline(NowOfflineVO vo);

	// 현장자리조회
	public List<NowOfflineVO> selectOfflineSpot(NowOfflineVO vo);

	// 현장퇴차(현장update)
	public int updateOfflineOut(NowOfflineVO vo);

	// 현장퇴차(결제insert)
	public int insertPaymentOut(NowOfflineVO vo);

	// 현장취소(현장delete)
	public int deleteOffline(NowOfflineVO vo);

	// 자리수조회(현장)
	public int selectBookingSpotCount(NowOfflineVO vo);

	// 자리수조회(예약)
	public int selectOfflineSpotCount(NowOfflineVO vo);

	// 마감처리
	public int updateOfflineEnd(NowOfflineVO vo);
}
