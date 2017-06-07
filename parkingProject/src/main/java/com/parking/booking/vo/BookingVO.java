package com.parking.booking.vo;

import java.util.Date;

public class BookingVO {
	// 예약 12개필드
	private String bookingNum; // 예약번호
	private int memberNum; // 회원번호
	private String paymentNum; // 결제번호
	private int bookingState; // 예약상황(사용/미사용/취소)
	private String bookingName; // 예약자이름
	private String bookingPhone; // 전화번호
	private int bookingMoney; // 예약금액
	private int bookingDiscount; // 감면혜택
	private String bookingSpot; // 자리
	private Date applicationDate; // 신청일자
	private Date bookingDate; // 예약날짜
	private int bookingPolicy; // 약관동의

	// getset
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

	public int getBookingDiscount() {
		return bookingDiscount;
	}

	public void setBookingDiscount(int bookingDiscount) {
		this.bookingDiscount = bookingDiscount;
	}

	public String getBookingSpot() {
		return bookingSpot;
	}

	public void setBookingSpot(String bookingSpot) {
		this.bookingSpot = bookingSpot;
	}

	public Date getApplicationDate() {
		return applicationDate;
	}

	public void setApplicationDate(Date applicationDate) {
		this.applicationDate = applicationDate;
	}

	public Date getBookingDate() {
		return bookingDate;
	}

	public void setBookingDate(Date bookingDate) {
		this.bookingDate = bookingDate;
	}

	public int getBookingPolicy() {
		return bookingPolicy;
	}

	public void setBookingPolicy(int bookingPolicy) {
		this.bookingPolicy = bookingPolicy;
	}

}
