package com.parking.nowoffline.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.parking.booking.vo.BookingVO;
import com.parking.nowoffline.service.nowOfflineService;
import com.parking.nowoffline.vo.NowOfflineVO;

@Controller
@RequestMapping(value = "/nowOffline")
public class NowOfflineController {
	@Autowired
	private nowOfflineService nowOfflineService;

	// 예약자리조회
	@RequestMapping(value = "/nowOfflineManagement")
	public String bookingManagement(@ModelAttribute BookingVO vo, Model model) {

		return "nowOffline/offlineStateManagement";
	}

	// 예약날짜 자리조회
	@RequestMapping(value = "/selectBookingSpot", method = RequestMethod.GET)
	@ResponseBody
	public List<BookingVO> selectBookingSpot(@ModelAttribute BookingVO vo, Model model) {

		// 현재날짜
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String now = format.format(date);
		vo.setSelectDate(now);

		// 자리list
		List<BookingVO> spot = nowOfflineService.selectBookingSpot(vo);
		for (int i = 0; i < spot.size(); i++) {
			System.out.println("예약상황=" + spot.get(i).getBookingState());
		}
		return spot;
	}

	// 차액부과금 추가
	@RequestMapping(value = "/penaltyInsert")
	@ResponseBody
	public int penaltyInsert(@ModelAttribute BookingVO vo, Model model) {
		// 출력
		System.out.println("penalty:" + vo.getPenalty());
		System.out.println("paymentnum:" + vo.getPaymentNum());

		// 쿼리문
		int result = nowOfflineService.updatePenalty(vo);
		System.out.println("update=" + result);

		return result;
	}

	// 예약 입차추가
	@RequestMapping(value = "/bookingParkingInsert")
	@ResponseBody
	public int bookingParkingInsert(@ModelAttribute BookingVO vo, Model model) {
		// 출력
		System.out.println("bookingNum:" + vo.getBookingNum());
		// 쿼리문
		int result = nowOfflineService.updateBooking(vo);
		System.out.println("update=" + result);

		return result;
	}

	// 현장추가
	@RequestMapping(value = "/offlineInsert", method = RequestMethod.GET)
	@ResponseBody
	public int offlineInsert(@ModelAttribute NowOfflineVO vo, Model model) {
		// 출력
		System.out.println("1" + vo.getOfflineNum());
		System.out.println("2" + vo.getOfflineName());
		System.out.println("3" + vo.getOfflinePhone());
		System.out.println("4" + vo.getOfflineCarNum());
		System.out.println("5" + vo.getOfflineDiscount());
		System.out.println("6" + vo.getOfflineSpot());

		// 쿼리문
		int result = nowOfflineService.insertOffline(vo);
		System.out.println("update=" + result);

		return result;
	}

	// 현장취소
	@RequestMapping(value = "/offlineCancle", method = RequestMethod.GET)
	@ResponseBody
	public int offlineCancle(@ModelAttribute NowOfflineVO vo, Model model) {
		// 출력
		System.out.println("1" + vo.getOfflineNum());
		// 쿼리문
		int result = nowOfflineService.deleteOffline(vo);
		System.out.println("delete=" + result);

		return result;
	}

	// 현장날짜 자리조회
	@RequestMapping(value = "/selectofflineSpot", method = RequestMethod.GET)
	@ResponseBody
	public List<NowOfflineVO> selectofflineSpot(@ModelAttribute NowOfflineVO vo, Model model) {

		// 자리list
		List<NowOfflineVO> spot = nowOfflineService.selectOfflineSpot(vo);
		for (int i = 0; i < spot.size(); i++) {
			System.out.println("현장자리=" + spot.get(i).getOfflineSpot());
			System.out.println("입차시간=" + spot.get(i).getOfflineInTime());
		}
		return spot;
	}

	// 현장 퇴차(현장update,결제insert)
	@RequestMapping(value = "/offlineOut")
	@ResponseBody
	public int offlineOut(@ModelAttribute NowOfflineVO vo, Model model) {
		// 출력
		System.out.println("1 offlineNum:" + vo.getOfflineNum());
		System.out.println("2 offlineout:" + vo.getOfflineOutTime());
		System.out.println("3 offlinetime:" + vo.getOfflineTime());
		String out_price = vo.getOut_price();
		out_price = out_price.replace("원", "");
		System.out.println("금액=" + out_price);
		int offlineMoney = Integer.parseInt(out_price);
		vo.setOfflineMoney(offlineMoney);

		// 결제코드번호
		long coad = System.currentTimeMillis();
		String paymentNum = coad + "";
		vo.setPaymentNum(paymentNum);
		System.out.println("결제코드=" + vo.getPaymentNum());
		// 쿼리문
		int result1 = nowOfflineService.updateOfflineOut(vo);
		System.out.println("1=" + result1);

		int result2 = nowOfflineService.insertPaymentOut(vo);
		System.out.println("2=" + result2);

		return result1;
	}

	// 현장/예약 자리수조회
	@RequestMapping(value = "/spotCount")
	@ResponseBody
	public List<NowOfflineVO> spotCount(@ModelAttribute NowOfflineVO vo, Model model) {
		// 쿼리문
		int bookingSpot = nowOfflineService.selectBookingSpotCount(vo);
		System.out.println("bookingSpot=" + bookingSpot);

		int offlineSpot = nowOfflineService.selectOfflineSpotCount(vo);
		System.out.println("offlineSpot=" + offlineSpot);

		int totalspot = bookingSpot + offlineSpot;
		System.out.println("totalspot=" + totalspot);

		// vo추가
		vo.setBookingSpotCnt(bookingSpot);
		vo.setOfflineSpotCnt(offlineSpot);
		vo.setTotalSpotCnt(totalspot);

		// list값넣기
		List<NowOfflineVO> spot = new ArrayList<NowOfflineVO>();
		spot.add(vo);

		return spot;
	}

	// 마감처리(예약사용자->사용)
	@RequestMapping(value = "/end")
	@ResponseBody
	public int end(@ModelAttribute NowOfflineVO vo, Model model) {
		// 쿼리문
		int result = nowOfflineService.updateOfflineEnd(vo);
		System.out.println("update" + "result");
		return result;
	}
}
