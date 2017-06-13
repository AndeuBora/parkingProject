package com.parking.payment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.parking.payment.service.PaymentService;
import com.parking.payment.vo.PaymentVO;

@Controller
@RequestMapping(value = "/payment")
public class PaymentController {

	@Autowired
	private PaymentService service;

	@RequestMapping(value = "/payment")
	public String payment() {

		return "payment/payment";
	}

	@RequestMapping(value = "/paymentComplete", method = RequestMethod.GET)
	public String paymentComplete(@ModelAttribute PaymentVO vo, Model model) throws Exception {

		// 출력테스트
		System.out.println("post방식 입력 성공");
		System.out.println("카드사:" + vo.getCardCompany());
		System.out.println("이름:" + vo.getPaymentName());
		System.out.println("카드번호1:" + vo.getCardNum1());
		System.out.println("카드번호2:" + vo.getCardNum2());
		System.out.println("카드번호3:" + vo.getCardNum3());
		System.out.println("카드번호4:" + vo.getCardNum4());
		System.out.println("유효기간1:" + vo.getCardValid1());
		System.out.println("유효기간2:" + vo.getCardValid2());
		System.out.println("cvc:" + vo.getCardCvc());
		System.out.println("약관동의:" + vo.getPaymentPolicy());

		String card1 = vo.getCardNum1();
		String card2 = vo.getCardNum2();
		String card3 = vo.getCardNum3();
		String card4 = vo.getCardNum4();
		String valid1 = vo.getCardValid1();
		String valid2 = vo.getCardValid2();

		String cardNum = card1 + "-" + card2 + "-" + card3 + "-" + card4;
		String term = valid1 + "/" + valid2;

		// 객체 값 넣기

		vo.setCardNum(cardNum);
		vo.setCardValid(term);
		vo.setPaymentNum("1234567891234");
		vo.setPaymentMoney(30000);
		vo.setPaymentPenalty(0);
		int result = service.paymentInsert(vo);
		System.out.println("성공여부:" + result);

		return "payment/paymentComplete";
	}

}
