package com.parking.booking.controller;

import java.text.ParseException;
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
import org.springframework.web.bind.annotation.RequestParam;

import com.parking.booking.service.BookingService;
import com.parking.booking.vo.BookingVO;
import com.parking.member.vo.MemberVO;

@Controller
@RequestMapping(value = "/booking")
public class BookingController {
	@Autowired
	private BookingService bookingService;

	// 예약자리조회
	@RequestMapping(value = "/selectBookingSpot")
	public String selectBookingSpot() {
		return "booking/bookingSpot";
	}

	// 예약하기페이지
	@RequestMapping(value = "/bookingDetail")
	public String bookingDetail(@RequestParam("bookingDate") String bookingDate,
			@RequestParam("bookingSpot") String bookingSpot, Model model) {

		// 있다고 가정-------------회원이름, 회원전화번호
		List<String> memberInfo = new ArrayList<>();
		memberInfo.add("안드보라");
		memberInfo.add("010-4245-0220");

		// list 저장
		List<String> bookingInfo = new ArrayList<>();
		bookingInfo.add(bookingDate);
		bookingInfo.add(bookingSpot);

		// 값보내기
		model.addAttribute("bookingInfo", bookingInfo);
		model.addAttribute("memberInfo", memberInfo);

		return "booking/bookingDetail";
	}

	// 예약입력
	@RequestMapping(value = "/bookingInsert", method = RequestMethod.GET)
	public void bookingInsert(@ModelAttribute BookingVO vo, Model model) {
		// 테스트출력
		System.out.println("-----------------------------------1");
		System.out.println("예약자 이름=" + vo.getBookingName());
		System.out.println("예약자 전화=" + vo.getBookingPhone());
		System.out.println("예약금액=" + vo.getBookingMoney());
		System.out.println("예약할인=" + vo.getBookingDiscount());
		System.out.println("예약날짜=" + vo.getBookingDate());
		System.out.println("예약자리=" + vo.getBookingSpot());

		// 예약번호
		long coad = System.currentTimeMillis();
		String BookingNum = String.valueOf(coad);
		vo.setBookingNum(BookingNum);
		System.out.println("예약번호=" + vo.getBookingNum());

		// 있다고 가정-------------회원아이디,회원이름
		List<String> memberInfo = new ArrayList<>();
		memberInfo.add("dksemqh97");
		memberInfo.add("안드보라");

		int result = bookingService.insertBooking(vo);
		System.out.println("result=" + result);
	}

	// 재차확인페이지
	@RequestMapping(value = "/bookingCheckAgain", method = RequestMethod.GET)
	public String bookingCheckAgain(@ModelAttribute BookingVO vo, Model model) {
		return "booking/bookingCheckAgain";
	}

	// 결제페이지로 넘기기
	@RequestMapping(value = "/payment", method = RequestMethod.POST)
	public String payment(@ModelAttribute BookingVO vo, Model model) {
		// 테스트출력
		System.out.println("-----------------------------------");
		System.out.println("예약자 이름=" + vo.getBookingName());
		System.out.println("예약자 전화=" + vo.getBookingPhone());
		System.out.println("예약금액=" + vo.getBookingMoney());
		System.out.println("예약할인=" + vo.getBookingDiscount());
		System.out.println("예약날짜=" + vo.getBookingDate());
		System.out.println("예약자리=" + vo.getBookingSpot());
		System.out.println("예약코드=" + vo.getBookingNum());

		// 결제코드번호
		long coad = System.currentTimeMillis();
		String paymentNum = coad + "";
		vo.setPaymentNum(paymentNum);
		System.out.println("결제코드=" + vo.getPaymentNum());

		// 예약추가
		int result = bookingService.insertBooking(vo);
		System.out.println("result=" + result);

		// 값넘기기
		model.addAttribute("paymentNum", paymentNum);
		return "payment/payment";
	}
}
