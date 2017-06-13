package com.parking.payment.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.parking.payment.vo.PaymentVO;

@Repository
public class PaymentDAOImpl implements PaymentDAO {

	@Inject
	private SqlSession sqlSession; // sql의존성 주입

	private static final String namespace = "PaymentMapper";

	// 결제 정보 입력
	@Override
	public int paymentInsert(PaymentVO vo) {

		return sqlSession.insert(namespace + ".paymentInsert", vo);
	}

}
