package com.parking.payment.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class PaymentDAOImpl implements PaymentDAO {

	
	 @Inject
	private SqlSession sqlSession; //sql의존성 주입
	
	 private static final String namespace="PaymentMapper";

}
