package com.parking.booking.paging;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

public class PagingTag extends TagSupport {
	private static final long serialVersionUID = 1L;

	private int page = 1;
	private int total = 1;
	private int list_size = 10; // 몇개씩보기
	private int page_size = 5; // nav

	@Override
	public int doStartTag() throws JspException {
		// TODO Auto-generated method stub
		try {
			pageContext.getOut().println(getPaging());
		} catch (IOException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return super.doStartTag();
	}

	public void setPage(int page) {
		this.page = page;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public void setList_size(int list_size) {
		this.list_size = list_size;
	}

	public void setPage_size(int page_size) {
		this.page_size = page_size;
	}

	public String getPaging() {
		String ret = "";
		if (page < 1)
			page = 1;
		if (total < 1)
			return "";

		int currentFirst = (page - 1) / page_size;
		currentFirst = currentFirst * page_size + 1;

		int currentlast = (page - 1) / page_size;
		currentlast = currentlast * page_size + page_size;

		int nextFirst = (page - 1) / page_size;
		nextFirst = (nextFirst + 1) * page_size + 1;

		int prevLast = (page - 1) / page_size;
		prevLast = (prevLast - 1) * page_size + page_size;

		int lastPage = 1;
		lastPage = total / list_size;

		if (total % list_size != 0)
			lastPage = lastPage + 1;
		currentlast = (currentlast > lastPage) ? lastPage : currentlast;

		ret += " <div class='paginate'> ";

		if (page > 1) {
			ret += "<ul class='pagination'><li><a href=\"javascript:goPage('1')\"><span><img src='/resources/images/btn_paginate_first.gif' alt='처음' /></span></a>";
		} else {
			ret += "<ul class='pagination'><li><span><img src='/resources/images/btn_paginate_first.gif' alt='처음' /></span>";
		}

		if (prevLast > 0) {
			ret += "<li><a href=\"javascript:goPage('" + prevLast
					+ "');\"><span><img src='/resources/images/btn_paginate_prev.gif' alt='이전' /></span></a>";
		} else {
			ret += "<li><span><img src='/resources/images/btn_paginate_prev.gif' alt='이전' /></span>";
		}

		for (int j = currentFirst; j < currentFirst + page_size && j <= lastPage; j++) {
			if (j <= currentlast) {
				if (j == page) {
					ret += "<li><a href ='#' class='on textAn'>" + j + "</a></li>";
				} else {
					ret += "<li><a href=\"javascript:goPage('" + j + "');\" class='textAn'>" + j + "</a></li>";
				}
			}
		}

		if (nextFirst <= lastPage) {
			ret += "<li><a href=\"javascript:goPage('" + nextFirst
					+ "');\"><span><img src='/resources/images/btn_paginate_next.gif' alt='다음' /></span></a>";
		} else {
			ret += "<li><span><img src='/resources/images/btn_paginate_next.gif' alt='다음' /></span>";
		}

		if (page < lastPage) {
			ret += "<li><a href=\"javascript:goPage('" + lastPage
					+ "')\"><span><img src='/resources/images/btn_paginate_last.gif' alt='마지막' /></span></a></ul>";
		} else {
			ret += "<li><span><img src='/resources/images/btn_paginate_last.gif' alt='마지막' /></span></ul>";
		}

		ret += "</div>";

		return ret;
	}

}