package com.parking.member.paging;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

public class PagingMemberTag extends TagSupport {
	private static final long serialVersionUID = 1L;

	/*
	 * @param page 현재 페이지 번호
	 * 
	 * @param total 전체 조회된 row 수
	 * 
	 * @param list size 페이지에 보여주는 줄수
	 * 
	 * @param page_size 페이지 네비게이터에 표시되는 페이지 버튼의 갯수
	 */

	//현재 페이지 번호
	private int page = 1;
	//전체 조회된 row수
	private int total = 1;
	//10개씩 보기
	private int list_size = 10;
	//페이지버튼 갯수 5개씩
	private int page_size = 5;

	@Override
	public int doStartTag() throws JspException {
		try {
			pageContext.getOut().println(getPaging());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return super.doStartTag();
	}

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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	
	public String getPaging() {
		String ret = "";
		if (page < 1) {
			page = 1;
		}
		if (total < 1) {
			return "";

		}

		// 현재 페이지 위치에 따른 가장 처음페이지 숫자 계산
		//예를 들면 페이지 버튼 갯수를 5로 지정하면
		//페이지번호 3의 위치에 있으면 가장 첫페이지 번호 1번으로 계산
		//페이지 7번이면   가장 첫번째 페이지 번호 6번으로 계산
		int currentFirst = (page - 1) / page_size;
		currentFirst = currentFirst * page_size + 1;
		
		//현재 페이지 위치에 따른 가장 마지막 페이지 숫자 계산
		int currentlast = (page - 1) / page_size;
		currentlast = currentlast * page_size + page_size;
		
		//예를들어 3페이지에 있다면  다음페이지 첫번째 버튼수는 6번이다
		int nextFirst = (page - 1) / page_size;
		nextFirst = (nextFirst + 1) * page_size + 1;

		//예를 들어 7페이지에 있다고 가정하면  
		//바로 전 페이지의 마지막 숫자는 5로 계산된다
		int preLast = (page - 1) / page_size;
		preLast = (preLast - 1) * page_size + page_size;

		
		//총 데이터의 수는 250개라 치고  페이지 버튼 개수를 5개로 지정하면
		//마지막 버튼숫자는 50이다
		int lastPage = 1;
		lastPage = total / list_size;

		
		//단 데이터의 갯수가 홀수인 233개라 치자 
		//버튼의 갯수는 5개로 지정 
		//나머지가 존재할경우 
		//결과값 정수부분에서 1을 더해준다
		//233/5=46.6  0.6데이터가 존재하므로
		//46페이지에서 +1더해서 47페이지가 나온다
		if (total % list_size != 0) {
			lastPage = lastPage + 1;
		}
			
		//현재 위치번호가  마지막 페이지 번호보다 큰경우에는 현재 위치 번호를 마지막페이지 번호로 넣어준다   
		currentlast = (currentlast > lastPage) ? lastPage : currentlast;

		ret += " <div class='paginate'> ";

	      if (page > 1) {
	         ret += "<ul class='pagination'><li><a href=\"javascript:goPage('1')\"><span><img src='/resources/images/btn_paginate_first.gif' alt='처음' /></span></a>";
	      } else {
	         ret += "<ul class='pagination'><li><span><img src='/resources/images/btn_paginate_first.gif' alt='처음' /></span>";
	      }

	      if (preLast > 0) {
	         ret += "<li><a href=\"javascript:goPage('" + preLast
	               + "');\"><span><img src='/resources/images/btn_paginate_prev.gif' alt='이전' /></span></a>";
	      } else {
	         ret += "<li><span><img src='/resources/images/btn_paginate_prev.gif' alt='이전' /></span>";
	      }

	      for (int j = currentFirst; j < currentFirst + page_size && j <= lastPage; j++) {
	         if (j <= currentlast) {
	            if (j == page) {
	               ret += "<li><a href ='#' class='on textAn'>" + j + "</a></li>";
	            } else {
	               ret += "<li><a href=\"javascript:goPage('" + j + "');\" class='textAn'>" + j
	                     + "</a></li>";
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
