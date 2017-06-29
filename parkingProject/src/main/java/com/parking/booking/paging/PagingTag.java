package com.parking.booking.paging;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

public class PagingTag extends TagSupport {
	// 페이징 처리를 커스텀태그로 표현하기 위함

	// 필드
	private int page = 1; // 현재 페이지번호
	private int total = 1; // 전체 조회된 레코드 개수
	private int list_size = 3; // 몇개씩보기
	private int page_size = 5; // 아래하단 페이지 버튼 갯수

	// getset
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getList_size() {
		return list_size;
	}

	public void setList_size(int list_size) {
		this.list_size = list_size;
	}

	public int getPage_size() {
		return page_size;
	}

	public void setPage_size(int page_size) {
		this.page_size = page_size;
	}

	// 재정의 html 코드출력
	@Override
	public int doStartTag() throws JspException {
		try {
			pageContext.getOut().println(getPaging());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return super.doStartTag();
	}

	// 메소드 추가
	public String getPaging() {
		String ret = "";
		if (page < 1)
			page = 1;
		if (total < 1)
			return "";

		// 시작
		int currentFirst = (page - 1) / page_size;
		currentFirst *= page_size + 1;

		// 마지막
		int currentLast = (page - 1) / page_size;
		currentLast *= page_size + page_size;

		// 다음페이지 시작번호
		int nextFirst = (page - 1) / page_size;
		nextFirst = (nextFirst + 1) * page_size + 1;

		// 이전페이지 끝번호
		int prevLast = (page - 1) / page_size;
		prevLast = (prevLast - 1) * page_size + page_size;

		// 마지막페이지목록
		int lastPage = 1;
		lastPage = total / list_size;
		if (total % list_size != 0) {
			lastPage += 1;
		}
		// 현재종료페이지>마지막페이지 yes:no
		currentLast = (currentLast > lastPage) ? lastPage : currentLast;

		// 소스추가 [페이지매기기] - ??
		ret += " <div class='paginate'> ";

		if (page > 1) {
			ret += "<a href=\"javascript:goPage('1')\"><span><img src='/resources/img/images/btn_paginate_first.gif' alt='처음' /></span></a>";
		} else {
			ret += "<span><img src='/resources/img/images/btn_paginate_first.gif' alt='처음' /></span>";
		}

		if (prevLast > 0) {
			ret += "<a href=\"javascript:goPage('" + prevLast
					+ "');\"><span><img src='/resources/img/images/btn_paginate_prev.gif' alt='이전' /></span></a>";
		} else {
			ret += "<span><img src='/resources/img/images/btn_paginate_prev.gif' alt='이전' /></span>";
		}

		for (int j = currentFirst; j < currentFirst + page_size && j <= lastPage; j++) {
			if (j <= currentLast) {
				if (j == page) {
					ret += "<a href ='#' class='on textAn'>" + j + "</a>";
				} else {
					ret += "<a href=\"javascript:goPage('" + j + "');\" class='textAn'>" + j + "</a>";
				}
			}
		}
		if (nextFirst <= lastPage) {
			ret += "<a href=\"javascript:goPage('" + nextFirst
					+ "');\"><span><img src='/resources/img/images/btn_paginate_next.gif' alt='다음' /></span></a>";
		} else {
			ret += "<span><img src='/resources/img/images/btn_paginate_next.gif' alt='다음' /></span>";
		}

		if (page < lastPage) {
			ret += "<a href=\"javascript:goPage('" + lastPage
					+ "')\"><span><img src='/resources/img/images/btn_paginate_last.gif' alt='마지막' /></span></a>";
		} else {
			ret += "<span><img src='/resources/img/images/btn_paginate_last.gif' alt='마지막' /></span>";
		}

		ret += "</div>";

		return ret;
	}
}
