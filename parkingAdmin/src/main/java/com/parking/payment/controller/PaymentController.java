package com.parking.payment.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import  org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.parking.payment.paging.Paging;
import com.parking.payment.paging.Util;
import com.parking.payment.service.PaymentService;
import com.parking.payment.vo.PaymentVO;
import org.apache.log4j.Logger;

@Controller
@RequestMapping(value = "/payment")
public class PaymentController {
	
	Logger logger = Logger.getLogger(PaymentController.class);
	@Autowired
	private PaymentService paymentService;
	SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
	String date = sd.format(new Date());

	@RequestMapping(value = "/paymentList", method=RequestMethod.GET)
	public String paymentList(@ModelAttribute PaymentVO vo, Model model) {

		
		 
		//검색에 대한 데이터 확인
         logger.info("page ="+vo.getPage());
         logger.info("pageSize ="+vo.getPageSize());        
		 System.out.println(vo.getPaymentDate());
		 System.out.println(vo.getPaymentNum());
		 System.out.println(vo.getDateMin());
		 System.out.println(date);
         
		/*  
		 String date = paymentService.paymentDateMin(vo);
        
		 model.addAttribute("date",date);*/
          
	
			
			// 데이터 피커 초기값
	       if (vo.getPaymentDate() == null || "".equals(vo.getPaymentDate().toString())) {
				vo.setPaymentDate(date);
	       }
		//전체 레코드 수 구하기
		int total =paymentService.paymentListCnt(vo);
         
		int count = total-(Util.nvl(vo.getPage())-1)*Util.nvl(vo.getPageSize());
		
	
    // 페이징 세팅
    		Paging.set(vo);

		// List전체
		List<PaymentVO> paymentList = paymentService.paymentList(vo);
		model.addAttribute("paymentList", paymentList);
        // jsp 히든값
		model.addAttribute("data", vo);
		
		//페이징 
		model.addAttribute("count",count);
		model.addAttribute("total",total);
		//결제 처음 일자 불러오기 
		
		return "payment/paymentManagement";
	}

}
