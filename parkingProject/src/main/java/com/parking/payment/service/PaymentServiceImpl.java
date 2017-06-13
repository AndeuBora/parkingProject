package com.parking.payment.service;

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

	// 결제 정보 입력
	@Override
	public int paymentInsert(PaymentVO vo) {

		int result = 0;
		result = paymentDao.paymentInsert(vo);

		return result;
	}

}
