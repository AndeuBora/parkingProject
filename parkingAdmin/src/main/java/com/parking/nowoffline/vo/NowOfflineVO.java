package com.parking.nowoffline.vo;

public class NowOfflineVO {
	// 현장현황 10개필드
	private String offlineNum; // 현장번호
	private String offlineSpot; // 주차자리
	private String offlineName; // 이름
	private String offlinePhone; // 전화번호
	private String offlineCarNum; // 차량번호
	private String offlineInTime; // 입차
	private String offlineOutTime; // 퇴차
	private String offlineTime; // 이용시간
	private int offlineMoney; // 이용요금
	private String offlineDiscount; // 감면혜택
	private String paymentNum;
	private int offlineState;

	// jsp
	private String selectDate;
	private String out_price;
	private int bookingSpotCnt;
	private int offlineSpotCnt;
	private int totalSpotCnt;

	public int getBookingSpotCnt() {
		return bookingSpotCnt;
	}

	public void setBookingSpotCnt(int bookingSpotCnt) {
		this.bookingSpotCnt = bookingSpotCnt;
	}

	public int getOfflineSpotCnt() {
		return offlineSpotCnt;
	}

	public void setOfflineSpotCnt(int offlineSpotCnt) {
		this.offlineSpotCnt = offlineSpotCnt;
	}

	public int getTotalSpotCnt() {
		return totalSpotCnt;
	}

	public void setTotalSpotCnt(int totalSpotCnt) {
		this.totalSpotCnt = totalSpotCnt;
	}

	public String getOut_price() {
		return out_price;
	}

	public void setOut_price(String out_price) {
		this.out_price = out_price;
	}

	public String getPaymentNum() {
		return paymentNum;
	}

	public void setPaymentNum(String paymentNum) {
		this.paymentNum = paymentNum;
	}

	public int getOfflineState() {
		return offlineState;
	}

	public void setOfflineState(int offlineState) {
		this.offlineState = offlineState;
	}

	public String getSelectDate() {
		return selectDate;
	}

	public void setSelectDate(String selectDate) {
		this.selectDate = selectDate;
	}

	public String getOfflineNum() {
		return offlineNum;
	}

	public void setOfflineNum(String offlineNum) {
		this.offlineNum = offlineNum;
	}

	public String getOfflineSpot() {
		return offlineSpot;
	}

	public void setOfflineSpot(String offlineSpot) {
		this.offlineSpot = offlineSpot;
	}

	public String getOfflineName() {
		return offlineName;
	}

	public void setOfflineName(String offlineName) {
		this.offlineName = offlineName;
	}

	public String getOfflinePhone() {
		return offlinePhone;
	}

	public void setOfflinePhone(String offlinePhone) {
		this.offlinePhone = offlinePhone;
	}

	public String getOfflineCarNum() {
		return offlineCarNum;
	}

	public void setOfflineCarNum(String offlineCarNum) {
		this.offlineCarNum = offlineCarNum;
	}

	public String getOfflineInTime() {
		return offlineInTime;
	}

	public void setOfflineInTime(String offlineInTime) {
		this.offlineInTime = offlineInTime;
	}

	public String getOfflineOutTime() {
		return offlineOutTime;
	}

	public void setOfflineOutTime(String offlineOutTime) {
		this.offlineOutTime = offlineOutTime;
	}

	public String getOfflineTime() {
		return offlineTime;
	}

	public void setOfflineTime(String offlineTime) {
		this.offlineTime = offlineTime;
	}

	public int getOfflineMoney() {
		return offlineMoney;
	}

	public void setOfflineMoney(int offlineMoney) {
		this.offlineMoney = offlineMoney;
	}

	public String getOfflineDiscount() {
		return offlineDiscount;
	}

	public void setOfflineDiscount(String offlineDiscount) {
		this.offlineDiscount = offlineDiscount;
	}

}