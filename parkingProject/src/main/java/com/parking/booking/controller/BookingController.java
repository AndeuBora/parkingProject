package com.parking.booking.controller;

import java.util.ArrayList;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.parking.booking.paging.Paging;
import com.parking.booking.paging.Util;
import com.parking.booking.service.BookingService;
import com.parking.booking.vo.BookingVO;

@Controller
@RequestMapping(value = "/booking")
public class BookingController {
	@Autowired
	private BookingService bookingService;

	// 예약자리조회
	@RequestMapping(value = "/bookingSpot")
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

	// 예약날짜 자리조회
	@RequestMapping(value = "/selectBookingSpot", method = RequestMethod.GET)
	@ResponseBody
	public List<BookingVO> selectBookingSpot(@ModelAttribute BookingVO vo, Model model) {
		// 테스트출력
		System.out.println("-----------------------------------");
		System.out.println("selectDate=" + vo.getSelectDate());

		// 자리list
		List<BookingVO> spot = bookingService.selectBookingSpot(vo);
		for (int i = 0; i < spot.size(); i++) {
			System.out.println("spot=" + spot.get(i).getBookingSpot());
		}
		return spot;
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

	/*-----------------------------myInfo----------------------------*/

	// 전체 예약목록조회
	@RequestMapping(value = "/myBooking")
	public String myBooking(@ModelAttribute BookingVO vo, Model model) {
		// 있다고 가정-------------회원번호로 조회
		vo.setMemberNum(3);

		// 페이징셋팅(초기값)
		Paging.set(vo);
		
		System.out.println("page="+vo.getPage());
		System.out.println("page size="+vo.getPageSize());
		System.out.println("page s="+vo.getStartRow());
		System.out.println("page e="+vo.getEndRow());
		// 전체레코드 수
		int total = bookingService.selectmyBookingListCnt(vo);
		System.out.println("레코드total건수" + total);

		int count = total - (Util.nvl(vo.getPage()) - 1) * (Util.nvl(vo.getPageSize()));
		System.out.println("count" + count);
		
		// Query문
		List<BookingVO> list = bookingService.selectMyBookingList(vo);
		
		//모델 값보내기
		model.addAttribute("myBooking", list);
		model.addAttribute("total", total);
		model.addAttribute("count", count);
		return "myInfo/myBooking";
	}

	// 예약취소넘겨줌
	@RequestMapping(value = "/myBookingCancle")
	public String bookingCancle() {
		return "myInfo/myBookingCancle";
	}
}
