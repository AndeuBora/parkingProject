package com.parking.payment.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.parking.payment.dao.PaymentDAO;
import com.parking.payment.vo.PaymentVO;

@Service
@Transactional
public class PaymentServiceImpl implements PaymentService {

	@Autowired
	private PaymentDAO paymentDao;

	

	
	// 페이징 전체 레코드 수 구현
	@Override
	public List<PaymentVO> paymentList(PaymentVO vo) {
		
		List<PaymentVO> myList = new ArrayList<PaymentVO>();
		myList = paymentDao.paymentList(vo);
		
		return myList;
		
	
	}
// 전체 레코드 수 구현
	@Override
	public int paymentListCnt(PaymentVO vo) {
		
		
		return paymentDao.paymentListCnt(vo);
	}

	// 처음 일 수 불러오기
	@Override
	public String paymentDateMin(PaymentVO vo) {
		return paymentDao.paymentDateMin(vo);
	}


}
