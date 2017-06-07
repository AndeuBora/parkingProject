package com.parking.payment.vo;

import java.util.Date;

public class PaymentVO {

  private String paymentNum;//결제번호
  private String cardCompany;//카드사
  private String cardNum;//카드번호
  private String cardValid;//유효기간
  private String cardCvc;//CVC
  private int paymentMoney;//결제금액
  private int paymentPolicy;//약관동의
  private Date paymentDate;//결제날짜
  private int paymentType;//결제종류
  private int paymentPenalty;//차액 부과금
  private int paymentState;//결제상황
  
  
  //생성자
  public PaymentVO(String paymentNum, String cardCompany, String cardNum, String cardValid, String cardCvc,
		int paymentMoney, int paymentPolicy, Date paymentDate, int paymentType, int paymentPenalty, int paymentState) {
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
}
//getter , setter
  
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
public Date getPaymentDate() {
	return paymentDate;
}
public void setPaymentDate(Date paymentDate) {
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
  
  
	
  
  
}
