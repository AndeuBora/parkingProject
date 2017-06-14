package com.parking.booking.vo;

import com.parking.booking.paging.PagingVO;

public class BookingVO extends PagingVO {
	// 예약 12개필드
	private String bookingNum; // 예약번호
	private int memberNum; // 회원번호
	private String paymentNum; // 결제번호
	private int bookingState; // 예약상황(사용/미사용/취소)
	private String bookingName; // 예약자이름
	private String bookingPhone; // 전화번호
	private int bookingMoney; // 예약금액
	private String bookingDiscount; // 감면혜택
	private String bookingSpot; // 자리
	private String applicationDate; // 신청일자
	private String bookingDate; // 예약날짜
	private int bookingPolicy; // 약관동의

	// jsp
	private String selectDate; // 선택조회날짜
	private String startDate; // 선택조회날짜
	private String endDate; // 선택조회날짜

	// getset
	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getSelectDate() {
		return selectDate;
	}

	public void setSelectDate(String selectDate) {
		this.selectDate = selectDate;
	}

	public String getBookingNum() {
		return bookingNum;
	}

	public void setBookingNum(String bookingNum) {
		this.bookingNum = bookingNum;
	}

	public int getMemberNum() {
		return memberNum;
	}

	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}

	public String getPaymentNum() {
		return paymentNum;
	}

	public void setPaymentNum(String paymentNum) {
		this.paymentNum = paymentNum;
	}

	public int getBookingState() {
		return bookingState;
	}

	public void setBookingState(int bookingState) {
		this.bookingState = bookingState;
	}

	public String getBookingName() {
		return bookingName;
	}

	public void setBookingName(String bookingName) {
		this.bookingName = bookingName;
	}

	public String getBookingPhone() {
		return bookingPhone;
	}

	public void setBookingPhone(String bookingPhone) {
		this.bookingPhone = bookingPhone;
	}

	public int getBookingMoney() {
		return bookingMoney;
	}

	public void setBookingMoney(int bookingMoney) {
		this.bookingMoney = bookingMoney;
	}

	public String getBookingDiscount() {
		return bookingDiscount;
	}

	public void setBookingDiscount(String bookingDiscount) {
		this.bookingDiscount = bookingDiscount;
	}

	public String getBookingSpot() {
		return bookingSpot;
	}

	public void setBookingSpot(String bookingSpot) {
		this.bookingSpot = bookingSpot;
	}

	public String getApplicationDate() {
		return applicationDate;
	}

	public void setApplicationDate(String applicationDate) {
		this.applicationDate = applicationDate;
	}

	public String getBookingDate() {
		return bookingDate;
	}

	public void setBookingDate(String bookingDate) {
		this.bookingDate = bookingDate;
	}

	public int getBookingPolicy() {
		return bookingPolicy;
	}

	public void setBookingPolicy(int bookingPolicy) {
		this.bookingPolicy = bookingPolicy;
	}

}
