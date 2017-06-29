package com.parking.payment.dao;

import java.util.List;

import com.parking.payment.vo.PaymentVO;

public interface PaymentDAO {

	public List<PaymentVO> paymentList(PaymentVO vo);
	public int paymentListCnt(PaymentVO vo);
public String paymentDateMin(PaymentVO vo);
	
}
