package com.parking.payment.service;

import java.util.List;

import com.parking.payment.vo.PaymentVO;

public interface PaymentService {

	public List<PaymentVO> paymentList(PaymentVO vo);
	public int paymentListCnt(PaymentVO vo);
	public String paymentDateMin(PaymentVO vo);
}
