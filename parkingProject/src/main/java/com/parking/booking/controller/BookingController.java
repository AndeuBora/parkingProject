package com.parking.booking.controller;

import java.util.ArrayList;
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

		// 값보내기
		model.addAttribute("bookingDate", bookingDate);
		model.addAttribute("bookingSpot", bookingSpot);
		model.addAttribute("memberInfo", memberInfo);

		// 출력
		System.out.println("bookingDate" + bookingDate);
		System.out.println("bookingSpot" + bookingSpot);
		System.out.println("bookingSpot" + memberInfo.get(1).toString());
		return "booking/bookingDetail";
	}

	// 재차확인페이지
	@RequestMapping(value = "/bookingCheckAgain")
	public String bookingCheckAgain() {
		return "booking/bookingCheckAgain";
	}

}
