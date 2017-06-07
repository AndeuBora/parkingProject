package com.parking.nowoffline.vo;

import java.util.Date;

public class NowOfflineVO {
	// 현장현황 10개필드
	private String offlineNum; // 현장번호
	private String offlineSpot; // 주차자리
	private String offlineName; // 이름
	private String offlinePhone; // 전화번호
	private String offlineCarNum; // 차량번호
	private Date offlineInTime; // 입차
	private Date offlineOutTime; // 퇴차
	private String offlineTime; // 이용시간
	private int offlineMoney; // 이용요금
	private int offlineDiscount; // 감면혜택
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
	public Date getOfflineInTime() {
		return offlineInTime;
	}
	public void setOfflineInTime(Date offlineInTime) {
		this.offlineInTime = offlineInTime;
	}
	public Date getOfflineOutTime() {
		return offlineOutTime;
	}
	public void setOfflineOutTime(Date offlineOutTime) {
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
	public int getOfflineDiscount() {
		return offlineDiscount;
	}
	public void setOfflineDiscount(int offlineDiscount) {
		this.offlineDiscount = offlineDiscount;
	}
	
	
}