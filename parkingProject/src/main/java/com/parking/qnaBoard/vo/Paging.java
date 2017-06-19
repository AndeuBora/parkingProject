package com.parking.qnaBoard.vo;

public class Paging {
	public static void set(QnaBoardVO qvo) {
		int page = Util.nvl(qvo.getPage(), 1);
		int pageSize = Util.nvl(qvo.getPageSize(), 10);

		if (qvo.getPage() == null)
			qvo.setPage(page + "");
		if (qvo.getPageSize() == null)
			qvo.setPageSize(pageSize + "");

		int start_row = (page - 1) * pageSize + 1;
		int end_row = (page - 1) * pageSize + pageSize;

		qvo.setStart_row(start_row + "");
		qvo.setEnd_row(end_row + "");
	}
}
