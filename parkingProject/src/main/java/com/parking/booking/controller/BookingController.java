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

		// 있다고 가정-------------회원 insert되면 받아오기
		List<String> memberInfo = new ArrayList<>();
		memberInfo.add("안드보라");
		memberInfo.add("010-4245-0220");

		// String->date
		SimpleDateFormat format = new java.text.SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		try {
			date = format.parse(bookingDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		// vo값 저장
		BookingVO vo = new BookingVO();
		vo.setBookingDate(date);
		vo.setBookingSpot(bookingSpot);

		// list 저장
		List<BookingVO> bookingList = new ArrayList<>();
		bookingList.add(vo);

		// 값보내기
		model.addAttribute("bookingList", bookingList);
		model.addAttribute("memberInfo", memberInfo);

		// 출력
		System.out.println("bookingList=" + bookingList.toString());
		return "booking/bookingDetail";
	}

	// 재차확인페이지
	@RequestMapping(value = "/bookingCheckAgain")
	public String bookingCheckAgain(@RequestParam("bookingName") String bookingName,
			@RequestParam("bookingPhone") String bookingPhone, @RequestParam("discountState") String discountState,
			@RequestParam("totalBookingMeney") String totalBookingMeney, Model model) {
		// vo값 저장-------------------------------------
		return "booking/bookingCheckAgain";
	}

}
