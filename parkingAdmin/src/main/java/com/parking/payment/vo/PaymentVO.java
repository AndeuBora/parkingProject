package com.parking.payment.vo;

import com.parking.payment.paging.PagingVO;

public class PaymentVO  extends PagingVO{

	private String paymentNum;// 결제번호
	private String cardCompany;// 카드사
	private String cardNum;// 카드번호
	private String cardValid;// 유효기간
	private String cardCvc;// CVC
	private int paymentMoney;// 결제금액
	private int paymentPolicy;// 약관동의
	private String paymentDate;// 결제날짜
	private int paymentType;// 결제종류 온오프
	private int paymentPenalty;// 차액 부과금
	private int paymentState;// 결제상황
	private String bookingNum;// 예약번호
	private String offlineNum; // 현장 번호
	private int rnum; // 순서 번호
	// jsp 요청
	private String p_type;// 히든값 (전체,예약,현장 정하는 콤보박스)
	private String s_Number;//히든값(결제번호,예약번호,현장번호 정하는 콤보박스)
    private String s_date;//히든 값  데이터 피커 값
    private String justNumber; // 히든 값  번호로 검색 시 받을 번호
    private String dateMin;
	
	// 생성자
	public PaymentVO() {
		super();
	}

	public PaymentVO(String paymentNum, String cardCompany, String cardNum, String cardValid, String cardCvc,
			int paymentMoney, int paymentPolicy, String paymentDate, int paymentType, int paymentPenalty,
			int paymentState, String bookingNum, String offlineNum, int rnum, String p_type, String s_Number,
			String s_date,String justNumber, String dateMin) {
		super();
		this.paymentNum = paymentNum;
		this.cardCompany = cardCompany;
		this.cardNum = cardNum;
		this.cardValid = cardValid;
		this.cardCvc = cardCvc;
		this.paymentMoney = paymentMoney;
		this.paymentPolicy = paymentPolicy;
		this.paymentDate = paymentDate;
		this.paymentType = paymentType;
		this.paymentPenalty = paymentPenalty;
		this.paymentState = paymentState;
		this.bookingNum = bookingNum;
		this.offlineNum = offlineNum;
		this.rnum = rnum;
		this.p_type = p_type;
		this.s_Number = s_Number;
		this.s_date = s_date;
		this.justNumber = justNumber;
		this.dateMin = dateMin;
		
	}
	
	
	
	

	public String getDateMin() {
		return dateMin;
	}

	public void setDateMin(String dateMin) {
		this.dateMin = dateMin;
	}

	public String getJustNumber() {
		return justNumber;
	}

	public void setJustNumber(String justNumber) {
		this.justNumber = justNumber;
	}

	public String gets_date() {
		return s_date;
	}

	public void sets_date(String s_date) {
		this.s_date = s_date;
	}

	public String getp_type() {
		return p_type;
	}

	public void setp_type(String p_type) {
		this.p_type = p_type;
	}

	public String getS_Number() {
		return s_Number;
	}

	public void setS_Number(String s_Number) {
		this.s_Number = s_Number;
	}

	public String getOfflineNum() {
		return offlineNum;
	}


	public void setOfflineNum(String offlineNum) {
		this.offlineNum = offlineNum;
	}

	public String getPaymentNum() {
		return paymentNum;
	}

	public void setPaymentNum(String paymentNum) {
		this.paymentNum = paymentNum;
	}

	public String getCardCompany() {
		return cardCompany;
	}

	public void setCardCompany(String cardCompany) {
		this.cardCompany = cardCompany;
	}

	public String getCardNum() {
		return cardNum;
	}

	public void setCardNum(String cardNum) {
		this.cardNum = cardNum;
	}

	public String getCardValid() {
		return cardValid;
	}

	public void setCardValid(String cardValid) {
		this.cardValid = cardValid;
	}

	public String getCardCvc() {
		return cardCvc;
	}

	public void setCardCvc(String cardCvc) {
		this.cardCvc = cardCvc;
	}

	public int getPaymentMoney() {
		return paymentMoney;
	}

	public void setPaymentMoney(int paymentMoney) {
		this.paymentMoney = paymentMoney;
	}

	public int getPaymentPolicy() {
		return paymentPolicy;
	}

	public void setPaymentPolicy(int paymentPolicy) {
		this.paymentPolicy = paymentPolicy;
	}

	public String getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(String paymentDate) {
		this.paymentDate = paymentDate;
	}

	public int getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(int paymentType) {
		this.paymentType = paymentType;
	}

	public int getPaymentPenalty() {
		return paymentPenalty;
	}

	public void setPaymentPenalty(int paymentPenalty) {
		this.paymentPenalty = paymentPenalty;
	}

	public int getPaymentState() {
		return paymentState;
	}

	public void setPaymentState(int paymentState) {
		this.paymentState = paymentState;
	}

	public String getBookingNum() {
		return bookingNum;
	}

	public void setBookingNum(String bookingNum) {
		this.bookingNum = bookingNum;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

}
