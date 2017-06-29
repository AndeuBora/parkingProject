package com.parking.payment.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.parking.payment.vo.PaymentVO;

@Repository
public class PaymentDAOImpl implements PaymentDAO {

	@Inject
	private SqlSession sqlSession; // sql의존성 주입

	private static final String namespace = "PaymentMapper";

	// 결제관리 정보 불러오기
	// 페이징 전체 레코드 수 구현
	@Override
	public List<PaymentVO> paymentList(PaymentVO vo) {

		return sqlSession.selectList(namespace + ".paymentManagementList", vo);
	}
	
 //전체 레코드 건수 구현
	@Override
	public int paymentListCnt(PaymentVO vo) {
		return  sqlSession.selectOne(namespace + ".paymentListCnt", vo);
	}

	 // 처음 일 수 불러오기
	
@Override
	public String paymentDateMin(PaymentVO vo) {
		
		
		return sqlSession.selectOne(namespace + ".paymentDateMin", vo);
	}

}
