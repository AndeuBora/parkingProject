package com.parking.booking.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.parking.booking.service.BookingService;
import com.parking.booking.vo.BookingVO;

@Controller
@RequestMapping(value = "/booking")
public class BookingController {
	@Autowired
	private BookingService bookingService;

	// 예약자리조회
	@RequestMapping(value = "/selectBookingSpot")
	public String selectBookingSpot() {
		/*
		 * System.out.println("예약자리조회 메소드 호출"); List<BookingVO> spotlist =
		 * bookingService.selectBookingSpot(vo); model.addAttribute("spotlist",
		 * spotlist);
		 */
		return "booking/bookingSpot";
	}

	// 예약하기페이지
	@RequestMapping(value = "/bookingDetail")
	public String bookingDetail() {
		/*
		 * System.out.println("예약자리조회 메소드 호출"); List<BookingVO> spotlist =
		 * bookingService.selectBookingSpot(vo); model.addAttribute("spotlist",
		 * spotlist);
		 */
		return "booking/bookingDetail";
	}
}
