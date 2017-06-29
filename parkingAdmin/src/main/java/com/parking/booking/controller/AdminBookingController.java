package com.parking.booking.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.parking.booking.paging.Paging;
import com.parking.booking.paging.Util;
import com.parking.booking.service.BookingService;
import com.parking.booking.vo.BookingVO;

@Controller
@RequestMapping(value = "/booking")
public class AdminBookingController {
	@Autowired
	private BookingService bookingService;

	// 예약자리조회
	@RequestMapping(value = "/bookingManagement")
	public String bookingManagement(@ModelAttribute BookingVO vo, Model model) {
		System.out.println("--bookingManagement");
		// 페이징셋팅(초기값)
		Paging.set(vo);

		String state = vo.getBookingState() + "";
		System.out.println(">>>state=" + state);

		// 검색조건(초기값)
		if (vo.getStartDate() == null || "".equals(vo.getStartDate().toString())) {
			vo.setStartDate("all");// 날짜 전체조회
		}
		if (state == null || "".equals(state)) {
			vo.setBookingState(3); // 예약상황 전체조회
		}
		if (vo.getBookingNum() == null || "".equals(vo.getBookingNum().toString())) {
			vo.setBookingNum("all"); // 예약번호 전체조회
		}

		// bookingNum
		String bookingNum = vo.getBookingNum();
		bookingNum = bookingNum.trim();
		vo.setBookingNum(bookingNum);

		// 출력
		System.out.println("date=" + vo.getStartDate());
		System.out.println("state=" + vo.getBookingState());
		System.out.println("bookingNum=" + vo.getBookingNum());

		// Query문 (전체레코드수,전체list)
		List<BookingVO> list = bookingService.selectBookingList(vo);
		int total = bookingService.selectBookingListCnt(vo);

		int count = total - (Util.nvl(vo.getPage()) - 1) * (Util.nvl(vo.getPageSize()));

		// 모델 값보내기
		model.addAttribute("BookingList", list);
		model.addAttribute("data", vo);
		model.addAttribute("total", total);
		model.addAttribute("count", count);
		return "booking/bookingManagement";
	}
}
