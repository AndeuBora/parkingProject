package com.parking.payment.paging;

import com.parking.payment.vo.PaymentVO;

public class Paging {

	
	public static void set(PaymentVO vo){
		int page = Util.nvl(vo.getPage(),1);
		int pageSize = Util .nvl(vo.getPageSize(),10);
		
		if(vo.getPage() == null) vo.setPage(page+"");
		if(vo.getPageSize()==null)vo.setPageSize(pageSize+"");
		
		int start_row = (page-1)*pageSize +1;
		int end_row = (page-1)*pageSize+pageSize;
		
		
		vo.setStart_row(start_row+"");
		vo.setEnd_row(end_row+"");
	}
}